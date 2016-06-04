package webstore

import grails.transaction.Transactional
import groovy.sql.Sql
import java.util.concurrent.TimeUnit
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class PagoController {

    def dataSource

    def index(){}

    def zona(){}

    def buscar(){
        def credito = Credito.get(params.creditoId)

        if(credito == null && params.orden){
            def venta = Venta.findByOrden(params.orden)
            credito = Credito.findByVenta(venta)
        }

        if(credito){
            [credito: credito, cliente: credito.venta.cliente]
        } else if(params.cedula){
            def cliente = Cliente.findByDocumento( params.cedula )
            def ventas = Venta.findAllByClienteAndTipo(cliente, 'Crédito')
            def creditos = []
            ventas.each{ venta->
                def c = Credito.findByVenta(venta)
                if(c!=null){
                    creditos << c
                }
            }
            render view:'listacreditos', model:[creditos: creditos, cliente: cliente]
        } else {
            flash.message="No se encontraron registros con este código."
            redirect action:"index"
        }
    }

    @Transactional
    def crear(){

        def cuota = Cuota.get(params.cuota)

        def credito = cuota.credito
        def saldo = credito.saldo - new BigInteger(params.valorPago)

        if(saldo < 0){
            flash.message="No puedes ingresar un valor superior al saldo"
            redirect action:'buscar', params:params
            return
        } else {
            credito.saldo -= new BigInteger(params.valorPago)
        }

        def valorPago = new BigInteger(params.valorPago)
        if( valorPago ){
            if(valorPago == credito.valorCuota && cuota.valorPago == null){
                cuota.pagada = true
                cuota.fechaPago = new Date()
                cuota.valorPago = valorPago
                cuota.save(flush:true, failOnError: true)
            } else if(valorPago < credito.valorCuota){
                cuota.valorPago = cuota.valorPago?:BigDecimal.ZERO
                cuota.valorPago += valorPago
                if( cuota.valorPago == credito.valorCuota ) {
                    cuota.pagada = true
                    cuota.fechaPago = new Date()
                }
                cuota.save(flush:true, failOnError: true)
            } else if(valorPago >= credito.valorCuota){
                //Buscar las cuotas del credito y ir pagando hasta que se acabe el llete
                def disponible = valorPago + (cuota.valorPago?:0)
                def _break = false
                credito.cuotas.sort{ it.numero }.each{ c ->
                    if(!c.pagada && !_break){
                        def valorMaximoPago = c.valor
                        if( (disponible - c.valor) < 0 ){
                            valorMaximoPago = disponible
                            disponible = 0
                            _break = true
                            c.valorPago = valorMaximoPago
                            c.save(flush: true, failOnError: true)
                        } else if ( (disponible - c.valor) > 0 ){
                            disponible -= c.valor
                            c.valorPago = c.valor
                            c.fechaPago = new Date()
                            c.pagada = true
                            c.save(flush: true, failOnError: true)
                        }
                    }
                }
            }
        }

        credito.save(flush: true, failOnError:true)

        flash.message="El pago se ingreso correctamente"
        redirect action:"historial", params:[creditoId: credito.id]
    }

    def historial(){
        def credito = Credito.get(params.creditoId)
        [credito: credito]
    }

    def morosos(){

        def query = """
            select credito_id id, min(fecha) fecha
            from cuota
            where credito_id in (
            	select id from credito where saldo > 0
            )
            group by credito_id;
        """

        if( params.zona ){
            query = """
                select p.credito_id id, min(p.fecha) fecha
                from cuota p
                inner join credito c on c.id = p.credito_id
                inner join venta v on v.id = c.venta_id
                inner join cliente cl on cl.id = v.cliente_id
                inner join zona z on z.id = cl.zona_id
                where credito_id in (
                select id from credito where saldo > 0
                ) and z.id = ${params.zona}
                group by p.credito_id;
            """
        }

        def sql = new Sql(dataSource)

        def rows = []
        sql.rows( query ).each{
            def credito = Credito.get(it.id)
            def dias_mora = TimeUnit.DAYS.convert(
                new Date().getTime() - it.fecha.getTime(),
                TimeUnit.MILLISECONDS
            )

            if(dias_mora > 30 && credito.saldo > BigInteger.ZERO){
                rows << [
                    documento: credito.venta.cliente.documento,
                    nombre: credito.venta.cliente.nombre,
                    telefono: credito.venta.cliente.telefono,
                    direccion: credito.venta.cliente.direccion,
                    zona: credito.venta.cliente.zona.nombre,
                    ultimo_pago: it.fecha,
                    dias_mora: TimeUnit.DAYS.convert(
                        new Date().getTime() - it.fecha.getTime(),
                        TimeUnit.MILLISECONDS
                    )
                ]
            }
        }

        render rows as grails.converters.JSON
    }

    def pagosDia(){
        def query = "select id from cuota where DATE(fecha_pago) = CURDATE()"
        def sql = new Sql(dataSource)

        def rows = []
        sql.rows( query ).each{
            def cuota = Cuota.get(it.id)
            rows << [
                credito: cuota.credito.id,
                cuota: cuota.numero,
                cuotas: cuota.credito.numeroCuotas,
                documento: cuota.credito.venta.cliente.documento,
                nombre: cuota.credito.venta.cliente.nombre,
                valor: cuota.valor
            ]
        }
        render rows as grails.converters.JSON
    }
}
