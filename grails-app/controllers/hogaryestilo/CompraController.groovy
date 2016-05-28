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

        compraInstance.fecha = new Date().parse('yyyy-MM-dd', params.fechaCompra)
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

    def pagar(Compra compraInstance){
        render "TODO"
    }
}
