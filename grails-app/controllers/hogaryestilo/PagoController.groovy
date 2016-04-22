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
}
