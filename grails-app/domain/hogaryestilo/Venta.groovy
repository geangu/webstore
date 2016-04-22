package hogaryestilo

class Venta {

    Date fecha
    String tipo
    Usuario vendedor
    Cliente cliente
    String observaciones
    BigInteger total

    Boolean cerrada

    static hasMany = [detalles:DetalleVenta]

    static constraints = {
        fecha nullable: false
        tipo nullable: false, inList:['Contado','Crédito']
        vendedor nullable: false
        cliente nullable: false
        observaciones nullable: true
        total nullable: false
        cerrada nullable: false, default: false
    }
}
