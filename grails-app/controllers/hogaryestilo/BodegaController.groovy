package hogaryestilo

import grails.transaction.Transactional
import org.grails.plugin.filterpane.FilterPaneUtils
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class BodegaController {

    def filterPaneService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bodega.list(params), model:[bodegaInstanceCount: Bodega.count()]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 10
        render( view:'index', model:[
            bodegaInstanceList: filterPaneService.filter( params, Bodega ),
            bodegaInstanceCount: filterPaneService.count( params, Bodega ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def show(Bodega bodegaInstance) {
        respond bodegaInstance
    }

    def create() {
        respond new Bodega(params)
    }

    @Transactional
    def save(Bodega bodegaInstance) {
        if (bodegaInstance == null) {
            notFound()
            return
        }

        if (bodegaInstance.hasErrors()) {
            respond bodegaInstance.errors, view:'create'
            return
        }

        bodegaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bodega.label', default: 'Bodega'), bodegaInstance.id])
                redirect bodegaInstance
            }
            '*' { respond bodegaInstance, [status: CREATED] }
        }
    }

    def edit(Bodega bodegaInstance) {
        respond bodegaInstance
    }

    @Transactional
    def update(Bodega bodegaInstance) {
        if (bodegaInstance == null) {
            notFound()
            return
        }

        if (bodegaInstance.hasErrors()) {
            respond bodegaInstance.errors, view:'edit'
            return
        }

        bodegaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bodega.label', default: 'Bodega'), bodegaInstance.id])
                redirect bodegaInstance
            }
            '*'{ respond bodegaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Bodega bodegaInstance) {

        if (bodegaInstance == null) {
            notFound()
            return
        }

        bodegaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Bodega.label', default: 'Bodega'), bodegaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bodega.label', default: 'Bodega'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
