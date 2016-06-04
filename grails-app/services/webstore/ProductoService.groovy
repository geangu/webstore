package webstore

import grails.transaction.Transactional

@Transactional
class ProductoService {

    def calcularCantidad(Venta venta) {

        venta.detalles.each { detalle ->
            def cantidad = detalle.cantidad
            def producto = detalle.producto
            producto.almacen -= cantidad
            producto.vendidos += cantidad
            producto.save(flush:true, failOnError: true)
        }
    }
}
