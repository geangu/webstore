package hogaryestilo

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class VentaController {

    def springSecurityService

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

}
