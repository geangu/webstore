package webstore

import grails.transaction.Transactional
import groovy.sql.Sql
import java.util.concurrent.TimeUnit
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ProveedorController {

    def dataSource
    def filterPaneService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proveedor.list(params), model:[proveedorInstanceCount: Proveedor.count()]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 10
        render( view:'index', model:[
            proveedorInstanceList: filterPaneService.filter( params, Proveedor ),
            proveedorInstanceCount: filterPaneService.count( params, Proveedor ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def show(Proveedor proveedorInstance) {
        respond proveedorInstance
    }

    def create() {
        respond new Proveedor(params)
    }

    @Transactional
    def save(Proveedor proveedorInstance) {
        if (proveedorInstance == null) {
            notFound()
            return
        }

        if (proveedorInstance.hasErrors()) {
            respond proveedorInstance.errors, view:'create'
            return
        }

        proveedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), proveedorInstance.id])
                redirect proveedorInstance
            }
            '*' { respond proveedorInstance, [status: CREATED] }
        }
    }

    def edit(Proveedor proveedorInstance) {
        respond proveedorInstance
    }

    @Transactional
    def update(Proveedor proveedorInstance) {
        if (proveedorInstance == null) {
            notFound()
            return
        }

        if (proveedorInstance.hasErrors()) {
            respond proveedorInstance.errors, view:'edit'
            return
        }

        proveedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proveedor.label', default: 'Proveedor'), proveedorInstance.id])
                redirect proveedorInstance
            }
            '*'{ respond proveedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proveedor proveedorInstance) {

        if (proveedorInstance == null) {
            notFound()
            return
        }

        proveedorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proveedor.label', default: 'Proveedor'), proveedorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def compraMora(){
        def mora = false
        def query = """
            select compra_id id, min(fecha) fecha
            from pago
            where
            compra_id in (
                select id from compra where saldo > 0
            ) and compra_id = '$params.compra_id' and
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
                mora = true
            }
        }
        render mora
    }

    def proveedorMora(Proveedor proveedorInstance){
        def mora = false
        def query = """
            select p.compra_id id, min(p.fecha) fecha
            from pago p inner join compra c on c.id = p.compra_id
            where
            p.compra_id in (
                select id from compra where saldo > 0
            ) and
            p.pagado = false and c.proveedor_id = '$proveedorInstance.id'
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
                mora = true
            }
        }
        render mora
    }

}
