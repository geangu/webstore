package hogaryestilo

import grails.transaction.Transactional
import groovy.sql.Sql
import java.util.concurrent.TimeUnit
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN','ROLE_USER'])
class ClienteController {

    def dataSource
    def filterPaneService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cliente.list(params), model:[clienteInstanceCount: Cliente.count()]
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

    def show(Cliente clienteInstance) {
        respond clienteInstance
    }

    def create() {
        respond new Cliente(params)
    }

    @Transactional
    def save(Cliente clienteInstance) {
        if (clienteInstance == null) {
            notFound()
            return
        }

        if (clienteInstance.hasErrors()) {
            respond clienteInstance.errors, view:'create'
            return
        }

        clienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
                redirect clienteInstance
            }
            '*' { respond clienteInstance, [status: CREATED] }
        }
    }

    def edit(Cliente clienteInstance) {
        respond clienteInstance
    }

    @Transactional
    def update(Cliente clienteInstance) {
        if (clienteInstance == null) {
            notFound()
            return
        }

        if (clienteInstance.hasErrors()) {
            respond clienteInstance.errors, view:'edit'
            return
        }

        clienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cliente.label', default: 'Cliente'), clienteInstance.id])
                redirect clienteInstance
            }
            '*'{ respond clienteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cliente clienteInstance) {

        if (clienteInstance == null) {
            notFound()
            return
        }

        clienteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cliente.label', default: 'Cliente'), clienteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def clientesMora(){
        def query = """
                select credito_id id, min(fecha) fecha
                from cuota
                where credito_id in (
                	select id from credito where saldo > 0
                ) and pagada = false
                group by credito_id"""

        def sql = new Sql(dataSource)
        def cantidad = 0
        sql.rows( query ).each{
            def credito = Credito.get(it.id)
            def dias_mora = TimeUnit.DAYS.convert(
                new Date().getTime() - it.fecha.getTime(),
                TimeUnit.MILLISECONDS
            )
            if(dias_mora > 30 && credito.saldo > BigInteger.ZERO){
                cantidad++
            }
        }
        render cantidad
    }

}
