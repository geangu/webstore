package webstore

class Pago {

    Compra compra
    Integer numero
    Date fecha
    BigInteger valor
    Boolean pagado
    Date fechaPago
    BigInteger valorPago

    static constraints = {
        compra nullable: false
        numero nullable: false
        fecha nullable: false
        valor nullable: false
        pagado nullable: false, default: false
        fechaPago nullable: true
        valorPago nullable: true
    }

}
