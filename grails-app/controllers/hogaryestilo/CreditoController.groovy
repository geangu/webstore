package hogaryestilo

import org.springframework.security.access.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN','ROLE_USER'])
class CreditoController {

    def productoService

    @Transactional
    def crear(){

        def venta = Venta.get(params.venta.id)
        venta.cerrada = true
        productoService.calcularCantidad(venta)
        venta.save(flush: true, failOnError: true)

        def credito = Credito.findOrCreateByVenta(venta)
        credito.fecha = venta.fecha
        credito.numeroCuotas = params.int('cuotas')
        credito.total = venta.total
        credito.valorCuota = venta.total / params.int('cuotas')
        credito.saldo = venta.total
        credito.save(flush: true, failOnError: true)

        for ( int i = 0; i < credito.numeroCuotas; i++){
            def fechaCuota  = sumarDias(credito.fecha, i * 30 )
            def cuota = new Cuota()
            cuota.credito = credito
            cuota.numero = i + 1
            cuota.fecha = fechaCuota
            cuota.valor = credito.valorCuota
            cuota.pagada = false
            cuota.save(flush: true, failOnError: true)
        }

        [credito: credito]
    }

    private Date sumarDias(Date fecha, int dias){
        Calendar calendar = Calendar.getInstance()
        calendar.setTime(fecha) // Configuramos la fecha que se recibe
        calendar.add(Calendar.DAY_OF_YEAR, dias)  // numero de días a añadir, o restar en caso de días<0
        return calendar.getTime()
    }

    def pago(Credito credito){

    }
}
