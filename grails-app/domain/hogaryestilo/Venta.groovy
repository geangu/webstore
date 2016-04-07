package hogaryestilo

class Venta {

    Date fecha
    String tipo
    Usuario vendedor
    Cliente cliente
    String observaciones

    Integer cuotas
    BigInteger abono
    BigInteger saldo
    BigInteger total

    Boolean cerrada

    static hasMany = [detalles:DetalleVenta]

    static constraints = {
        tipo nullable: false, inList:['Contado','Crédito']
        vendedor nullable: false
        cliente nullable: false
        observaciones nullable: true
        cuotas nullable: false
        abono nullable: false
        saldo nullable: false
        total nullable: false
    }
}
