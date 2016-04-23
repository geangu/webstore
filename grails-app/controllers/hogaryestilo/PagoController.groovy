package hogaryestilo

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class PagoController {

    def index(){

    }

    def buscar(){
        def credito = Credito.get(params.creditoId)
        if(credito){
            [credito: credito]
        } else {
            flash.message="No se encontraron registros con este código."
            redirect action:"index"
        }
    }

    def crear(){
        def credito = Credito.get(params.creditoId)
        def pago = new Pago(
            credito: credito,
            tipoPago: 'Cuota',
            valor: new BigInteger(params.valor),
            fecha: new Date()
        )
        pago.save(flush: true, failOnError:true)

        credito.saldo -= new BigInteger(params.valor)
        credito.save(flush: true, failOnError:true)

        flash.message="El pago se ingreso correctamente"
        redirect action:"index"
    }
}
