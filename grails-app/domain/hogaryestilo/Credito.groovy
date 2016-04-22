package hogaryestilo

class Credito {

    Date fecha
    Venta venta
    Integer cuotas
    BigInteger total
    BigInteger valorCuota
    BigInteger saldo

    static belongsTo = [ venta: Venta ]
    static hasMany = [ pagos: Pago ]

    static constraints = {
        fecha nullable: false
        venta nullable: false, unique: true
        cuotas nullable: false, min: 1, max: 24
        total nullable: false
        valorCuota nullable: false
        saldo nullable: false
    }
}
