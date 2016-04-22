package hogaryestilo

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class CreditoController {

    def crear(){

        def venta = Venta.get(params.venta.id)
        venta.cerrada = true
        venta.save(flush: true, failOnError: true)

        def credito = Credito.findOrCreateByVenta(venta)

        credito.fecha = venta.fecha
        credito.cuotas = params.int('cuotas')
        credito.total = venta.total
        credito.valorCuota = venta.total / params.int('cuotas')
        credito.saldo = venta.total

        credito.save(flush: true, failOnError: true)
        [credito: credito]
    }

    def pago(Credito credito){

    }
}
