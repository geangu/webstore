package hogaryestilo

import grails.transaction.Transactional
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class CategoriaController {

    def filterPaneService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Categoria.list(params), model:[categoriaInstanceCount: Categoria.count()]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 10
        render( view:'index', model:[
            categoriaInstanceList: filterPaneService.filter( params, Categoria ),
            categoriaInstanceCount: filterPaneService.count( params, Categoria ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def show(Categoria categoriaInstance) {
        respond categoriaInstance
    }

    def create() {
        respond new Categoria(params)
    }

    @Transactional
    def save(Categoria categoriaInstance) {
        if (categoriaInstance == null) {
            notFound()
            return
        }

        if (categoriaInstance.hasErrors()) {
            respond categoriaInstance.errors, view:'create'
            return
        }

        categoriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])
                redirect categoriaInstance
            }
            '*' { respond categoriaInstance, [status: CREATED] }
        }
    }

    def edit(Categoria categoriaInstance) {
        respond categoriaInstance
    }

    @Transactional
    def update(Categoria categoriaInstance) {
        if (categoriaInstance == null) {
            notFound()
            return
        }

        if (categoriaInstance.hasErrors()) {
            respond categoriaInstance.errors, view:'edit'
            return
        }

        categoriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Categoria.label', default: 'Categoria'), categoriaInstance.id])
                redirect categoriaInstance
            }
            '*'{ respond categoriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Categoria categoriaInstance) {

        if (categoriaInstance == null) {
            notFound()
            return
        }

        categoriaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Categoria.label', default: 'Categoria'), categoriaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
