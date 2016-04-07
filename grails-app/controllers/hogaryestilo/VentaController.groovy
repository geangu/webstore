package hogaryestilo

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class VentaController {

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index() {
        redirect action: 'lista'
    }

    @Secured(['ROLE_ADMIN'])
    def lista(){
        [ventas: Venta.list()]
    }

    def crear(){
        [venta: new Venta()]
    }

    def guardar(){
        def venta = new Venta(
            vendedor: Usuario.get(springSecurityService.principal.id),
            cliente: Cliente.get(params.clienteId),
            fecha: new Date(),
            tipo: params.tipo,
            observations: params.observations,
            cuotas: 1,
            abono: BigInteger.ZERO,
            saldo: BigInteger.ZERO,
            total: BigInteger.ZERO,
            cerrada: false
        )
        venta.save(flush: true, failOnError: true)
        redirect action:'detalles', id: venta.id
    }

    def detalles(Venta venta) {
        render view: 'detalles', model: [venta: venta], params:[id: venta.id]
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
            if( venta.tipo == 'Contado' ){
                venta.total += (d.producto.precio * d.cantidad)
            } else {
                venta.total += (d.producto.precioCredito * d.cantidad)
            }
        }
        venta.save(flush: true, failOnError: true)
    }

}
