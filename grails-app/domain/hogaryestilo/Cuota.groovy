package hogaryestilo

class Cuota {

    Credito credito
    Integer numero
    Date fecha
    BigInteger valor
    Boolean pagada
    Date fechaPago

    static constraints = {
        numero nullable: false
        credito nullable: false
        fecha nullable: false
        valor nullable: false
        pagada nullable: false, default: false
        fechaPago nullable: true
    }
}
