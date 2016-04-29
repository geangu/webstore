package hogaryestilo

import org.springframework.security.access.annotation.Secured
import java.util.Calendar
import groovy.sql.Sql
import java.util.concurrent.TimeUnit

@Secured(['ROLE_ADMIN','ROLE_USER'])
class PagoController {

    def index(){

    }

    def buscar(){
        def credito = Credito.get(params.creditoId)
        if(credito){
            [credito: credito, cliente: credito.venta.cliente]
        } else if(params.cedula){
            def cliente = Cliente.findByDocumento( params.cedula )
            def ventas = Venta.findAllByClienteAndTipo(cliente, 'Crédito')
            def creditos = []
            ventas.each{ venta->
                def c = Credito.findByVenta(venta)
                if(c.saldo!=BigInteger.ZERO){
                    creditos << c
                }
            }
            render view:'listacreditos', model:[creditos: creditos, cliente: cliente]
        } else {
            flash.message="No se encontraron registros con este código."
            redirect action:"index"
        }
    }

    def crear(){
        def credito = Credito.get(params.creditoId)
        def pago = new Pago(
            credito: credito,
            tipoPago: 'Cuota',
            valor: new BigInteger(params.valor),
            fecha: new Date()
        )
        pago.save(flush: true, failOnError:true)

        credito.saldo -= new BigInteger(params.valor)

        if(credito.saldo < 0){
            flash.message="No puedes ingresar un valor superior al saldo"
            redirect action:'buscar', params:params
            return
        }

        credito.save(flush: true, failOnError:true)

        flash.message="El pago se ingreso correctamente"
        redirect action:"index"
    }

    def historial(){
        def credito = Credito.get(params.creditoId)
        [credito: credito]
    }

    def dataSource

    def morosos(){

        def query = """
            select credito_id id, max(fecha) fecha
            from pago
            where credito_id in (
            	select id from credito where saldo > 0
            )
            group by credito_id;
        """

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

}
