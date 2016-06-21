package webstore

import grails.transaction.Transactional
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN','ROLE_USER'])
class ProductoController {

    def filterPaneService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Producto.list(params), model:[productoInstanceCount: Producto.count()]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 10
        render( view:'index', model:[
            productoInstanceList: filterPaneService.filter( params, Producto ),
            productoInstanceCount: filterPaneService.count( params, Producto ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def show(Producto productoInstance) {
        respond productoInstance
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Producto(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Producto productoInstance) {
        if (productoInstance == null) {
            notFound()
            return
        }

        if (productoInstance.hasErrors()) {
            respond productoInstance.errors, view:'create'
            return
        }

        productoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'producto.label', default: 'Producto'), productoInstance.id])
                redirect productoInstance
            }
            '*' { respond productoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Producto productoInstance) {
        respond productoInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Producto productoInstance) {
        if (productoInstance == null) {
            notFound()
            return
        }

        if (productoInstance.hasErrors()) {
            respond productoInstance.errors, view:'edit'
            return
        }

        productoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Producto.label', default: 'Producto'), productoInstance.id])
                redirect productoInstance
            }
            '*'{ respond productoInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Producto productoInstance) {

        if (productoInstance == null) {
            notFound()
            return
        }

        productoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Producto.label', default: 'Producto'), productoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def reporte(){
        def list = Producto.list()
        def rows = []
        list.each{
            rows << [
                categoria: it.categoria.nombre,
                referencia: it.referencia,
                nombre: it.nombre,
                precioCompra: it.precioCompra,
                precioContado: it.precioContado,
                precioCredito: it.precioCredito
            ]
        }
        render rows as grails.converters.JSON
    }
}
