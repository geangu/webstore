package webstore

class Venta {

    String orden
    Date fecha
    String tipo
    Usuario vendedor
    Cliente cliente
    String observaciones
    BigInteger total
    BigInteger descuento

    Boolean cerrada

    static hasMany = [detalles:DetalleVenta]

    static constraints = {
        orden nullable: false, unique: true
        fecha nullable: false
        tipo nullable: false, inList:['Contado','Credicontado','Crédito']
        vendedor nullable: false
        cliente nullable: false
        observaciones nullable: true
        total nullable: false
        total nullable: false, default: BigInteger.ZERO
        cerrada nullable: false, default: false
    }
}
