package webstore

import grails.transaction.Transactional
import org.grails.plugin.filterpane.FilterPaneUtils
import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN','ROLE_USER'])
class FiadorController {

    def filterPaneService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Fiador.list(params), model:[fiadorInstanceCount: Fiador.count()]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 10
        render( view:'index', model:[
            clienteInstanceList: filterPaneService.filter( params, Cliente ),
            clienteInstanceCount: filterPaneService.count( params, Cliente ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def show(Fiador fiadorInstance) {
        respond fiadorInstance
    }

    def create() {
        respond new Fiador(params)
    }

    @Transactional
    def save(Fiador fiadorInstance) {
        if (fiadorInstance == null) {
            notFound()
            return
        }

        if (fiadorInstance.hasErrors()) {
            respond fiadorInstance.errors, view:'create'
            return
        }

        fiadorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fiador.label', default: 'Fiador'), fiadorInstance.id])
                redirect fiadorInstance
            }
            '*' { respond fiadorInstance, [status: CREATED] }
        }
    }

    def edit(Fiador fiadorInstance) {
        respond fiadorInstance
    }

    @Transactional
    def update(Fiador fiadorInstance) {
        if (fiadorInstance == null) {
            notFound()
            return
        }

        if (fiadorInstance.hasErrors()) {
            respond fiadorInstance.errors, view:'edit'
            return
        }

        fiadorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Fiador.label', default: 'Fiador'), fiadorInstance.id])
                redirect fiadorInstance
            }
            '*'{ respond fiadorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Fiador fiadorInstance) {

        if (fiadorInstance == null) {
            notFound()
            return
        }

        fiadorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Fiador.label', default: 'Fiador'), fiadorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fiador.label', default: 'Fiador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
