package hogaryestilo

import grails.transaction.Transactional
import groovy.sql.Sql
import java.util.concurrent.TimeUnit
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class CompraController {

    def dataSource
    def fechaService
    def filterPaneService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Compra.list(params), model:[compraInstanceCount: Compra.count()]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 10
        render( view:'index', model:[
            compraInstanceList: filterPaneService.filter( params, Compra ),
            compraInstanceCount: filterPaneService.count( params, Compra ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def show(Compra compraInstance) {
        redirect action:'pagos', id: compraInstance.id
    }

    def create() {
        respond new Compra(params)
    }

    @Transactional
    def save(Compra compraInstance) {

        compraInstance.saldo = compraInstance.total
        compraInstance.valorCuota = compraInstance.total / compraInstance.numeroCuotas
        compraInstance.save flush:true

        for ( int i = 0; i < compraInstance.numeroCuotas; i++){
            def fecha  = fechaService.sumarDias(compraInstance.fecha, i * 30 )
            def pago = new Pago()
            pago.compra = compraInstance
            pago.numero = i + 1
            pago.fecha = fecha
            pago.valor = compraInstance.valorCuota
            pago.pagado = false
            pago.save(flush: true, failOnError: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
                redirect compraInstance
            }
            '*' { respond compraInstance, [status: CREATED] }
        }
    }

    def edit(Compra compraInstance) {
        respond compraInstance
    }

    @Transactional
    def update(Compra compraInstance) {

        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Compra.label', default: 'Compra'), compraInstance.id])
                redirect compraInstance
            }
            '*'{ respond compraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Compra compraInstance) {

        if (compraInstance == null) {
            notFound()
            return
        }

        compraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Compra.label', default: 'Compra'), compraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def pagos(Compra compraInstance){
        [compra: compraInstance]
    }

    def pagar(Compra compraInstance){
        [compra: compraInstance]
    }

    @Transactional
    def pagar2(Compra compraInstance){

        def pago = Pago.get(params.pago)

        def compra = pago.compra
        def saldo = compra.saldo - new BigInteger(params.valorPago)

        if(saldo < 0){
            flash.message="No puede ingresar un valor superior al saldo"
            redirect action:'pagar', id: compraInstance.id
            return
        } else {
            compra.saldo -= new BigInteger(params.valorPago)
        }

        def valorPago = new BigInteger(params.valorPago)
        if( valorPago ){
            if(valorPago == compra.valorCuota && pago.valorPago == null){
                pago.pagado = true
                pago.fechaPago = new Date()
                pago.valorPago = valorPago
                pago.save(flush:true, failOnError: true)
            } else if(valorPago < compra.valorCuota){
                pago.valorPago = pago.valorPago?:BigDecimal.ZERO
                pago.valorPago += valorPago
                if( pago.valorPago == compra.valorCuota ) {
                    pago.pagado = true
                    pago.fechaPago = new Date()
                }
                pago.save(flush:true, failOnError: true)
            } else if(valorPago >= compra.valorCuota){
                //Buscar las pagos de la compra e ir pagando hasta que se acabe el llete
                def disponible = valorPago + (pago.valorPago?:0)
                def _break = false
                compra.pagos.sort{ it.numero }.each{ p ->
                    if(!p.pagado && !_break){
                        def valorMaximoPago = p.valor
                        if( (disponible - p.valor) < 0 ){
                            valorMaximoPago = disponible
                            disponible = 0
                            _break = true
                            p.valorPago = valorMaximoPago
                            p.save(flush: true, failOnError: true)
                        } else if ( (disponible - p.valor) > 0 ){
                            disponible -= p.valor
                            p.valorPago = p.valor
                            p.fechaPago = new Date()
                            p.pagado = true
                            p.save(flush: true, failOnError: true)
                        }
                    }
                }
            }
        }
        redirect action: 'pagos', id: compraInstance.id
    }

    def pagosMora(){
        def query = """
            select compra_id id, min(fecha) fecha
            from pago
            where
            compra_id in (
                select id from compra where saldo > 0
            ) and
            pagado = false
            group by compra_id"""

        def sql = new Sql(dataSource)
        def cantidad = 0
        sql.rows( query ).each{
            def compra = Compra.get(it.id)
            def dias_mora = TimeUnit.DAYS.convert(
                new Date().getTime() - it.fecha.getTime(),
                TimeUnit.MILLISECONDS
            )
            if(dias_mora > 30 && compra.saldo > BigInteger.ZERO){
                cantidad++
            }
        }
        render cantidad
    }

}
