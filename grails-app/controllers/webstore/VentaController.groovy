package webstore

import grails.transaction.Transactional
import groovy.sql.Sql
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class VentaController {

    def springSecurityService
    def productoService
    def dataSource
    def filterPaneService

    def guardar(){
        def venta = new Venta(
            orden: params.orden,
            vendedor: Usuario.get(springSecurityService.principal.id),
            cliente: Cliente.get(params.clienteId),
            fecha: new Date().parse('yyyy-MM-dd', params.fecha),
            tipo: params.tipo,
            observations: params.observations,
            cuotas: 1,
            abono: BigInteger.ZERO,
            saldo: BigInteger.ZERO,
            total: BigInteger.ZERO,
            descuento: BigInteger.ZERO,
            cerrada: false
        )
        venta.save(flush: true, failOnError: true)
        redirect action:'detalles', id: venta.id
    }

    def detalles() {
        def venta = Venta.get(params?.id)
        render view: 'detalles', model: [venta: venta?:new Venta()], params:[id: venta?.id]
    }

    def anadir(Venta venta){
        if( params.productoId && params.int('cantidad') > 0){
            def producto = Producto.get( params.productoId )
            new DetalleVenta(
                venta: venta,
                producto: producto,
                cantidad: params.int('cantidad')
            ).save(flush: true, failOnError: true)
            calcularTotal(venta)
        }
        render view: 'detalles', model: [venta: venta], params:[id: venta.id]
    }

    def descuento(Venta venta){
        try{
            venta.descuento = new BigInteger(params.descuento)
            venta.save(flush: true, failOnError: true)
            calcularTotal(venta)
        } catch(e) {
            e.printStacktrace()
            flash.message = 'No se puede guardar descuento, por favor rectifique el valor'
            flash.type = "error"
        }
        render view: 'detalles', model: [venta: venta], params:[id: venta.id]
    }

    def quitar(Venta venta){
        if( params.productoId ){
            def producto = Producto.get( params.productoId )
            def detalle = DetalleVenta.findByVentaAndProducto(venta, producto)
            detalle.delete(flush: true, failOnError: true)
            calcularTotal(venta)
        }
        render view: 'detalles', model: [venta: venta], params:[id: venta?.id]
    }

    def cerrar(Venta venta){
        venta.cerrada = true
        calcularTotal(venta)
        productoService.calcularCantidad(venta)
        venta.save(flush: true, failOnError: true)

        // Crear credito de una cuota
        def credito = Credito.findOrCreateByVenta(venta)
        credito.fecha = venta.fecha
        credito.numeroCuotas = 1
        credito.total = venta.total
        credito.valorCuota = venta.total
        credito.saldo = 0
        credito.save(flush: true, failOnError: true)

        // Crear cuota
        def cuota = new Cuota()
        cuota.credito = credito
        cuota.numero = 1
        cuota.fecha = venta.fecha
        cuota.valor = venta.total
        cuota.pagada = true
        cuota.fechaPago = venta.fecha
        cuota.save(flush: true, failOnError: true)

        flash.message = "Venta cerrada"
        redirect url: '/'
    }

    def descartar(Venta venta){
        def detalles = DetalleVenta.findAllByVenta(venta)
        detalles.each{ d->
            d.delete(flush: true, failOnError: true)
        }
        venta.delete(flush: true, failOnError: true)
        flash.message = "Venta descartada"
        redirect url: '/'
    }

    private void calcularTotal(Venta venta){
        def detalles = DetalleVenta.findAllByVenta(venta)
        venta.total = 0;
        detalles.each{ d->
            if( venta.tipo == 'Contado' || venta.tipo == 'Credicontado'){
                venta.total += (d.producto.precioContado * d.cantidad)
            } else {
                venta.total += (d.producto.precioCredito * d.cantidad)
            }
        }

        if(venta.descuento != null){
            println "Quitar el descuento"
            venta.total -= venta.descuento
        } else {
            println "nunca entra"
        }

        venta.save(flush: true, failOnError: true)
    }

    def credito(Venta venta){
        def credito = new Credito(
            venta: venta,
            fecha: venta.fecha,
            total: venta.total,
            saldo: venta.total
        )
        [credito: credito, venta: venta]
    }

    def pago(Venta venta){
        redirect action:'credito', id:venta.id
    }

    def imprimir(Venta venta){
        def credito = Credito.findByVenta(venta);
        [venta: venta, credito: credito]
    }

    def ventasDia(){
        def query = "select id from venta where DATE(fecha) = CURDATE() and cerrada"
        def sql = new Sql(dataSource)

        def rows = []
        sql.rows( query ).each{
            def venta = Venta.get(it.id)
            rows << [
                venta: venta.id,
                valor: venta.total,
                vendedor: venta.vendedor.username,
                tipo: venta.tipo,
                documento: venta.cliente.documento,
                nombre: venta.cliente.nombre,
                observaciones: venta.observaciones
            ]
        }
        render rows as grails.converters.JSON
    }

    def lista() {
        def list = Venta.list(params)
        [ventaInstanceList: list]
    }

    def filter(Integer max) {
        if(!params.max) params.max = 100
        render( view:'lista', model:[
            ventaInstanceList: filterPaneService.filter( params, Venta ),
            filterParams: FilterPaneUtils.extractFilterParams(params),
            params: params
        ])
    }

    def detalle(Venta venta){
        render view:'imprimir', model:[venta: venta, showTemplate:true]
    }

    @Transactional
    def borrar(Venta venta){

        def credito = Credito.findByVenta(venta)
        def cuotas = Cuota.findAllByCredito(credito)
        cuotas.each { c ->
            c.delete(flush: true, failOnError: true)
        }
        credito?.delete(flush:true, failOnError: true)

        def detalles = DetalleVenta.findAllByVenta(venta)
        detalles?.each { d ->
            d.delete(flush: true, failOnError: true)
        }

        venta.detalles = null
        venta.delete(flush:true, failOnError: true)

        flash.message = "Se elimino la venta correctamente"
        flash.type = "danger"

        redirect action:'lista'
    }
}
