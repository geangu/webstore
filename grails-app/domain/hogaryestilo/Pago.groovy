package hogaryestilo

class Pago {

    Credito credito
    String tipoPago
    BigInteger valor
    Date fecha

    static constraints = {
        credito nullable: false
        tipoPago nullable: false, inList: ['Cuota','Abono']
        valor nullable: false
        fecha nullable: false
    }
}
