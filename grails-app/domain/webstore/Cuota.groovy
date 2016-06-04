package webstore

class Cuota {

    Credito credito
    Integer numero
    Date fecha
    BigInteger valor
    Boolean pagada
    Date fechaPago
    BigInteger valorPago

    static constraints = {
        credito nullable: false
        numero nullable: false
        fecha nullable: false
        valor nullable: false
        pagada nullable: false, default: false
        fechaPago nullable: true
        valorPago nullable: true
    }
}
