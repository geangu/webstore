package hogaryestilo

import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class CompraController {

    def fechaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Compra.list(params), model:[compraInstanceCount: Compra.count()]
    }

    def show(Compra compraInstance) {
        respond compraInstance
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

}
