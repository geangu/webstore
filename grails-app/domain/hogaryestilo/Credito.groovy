package hogaryestilo

class Credito {

    Date fecha
    Venta venta
    Integer numeroCuotas
    BigInteger total
    BigInteger valorCuota
    BigInteger saldo

    static belongsTo = [ venta: Venta ]
    static hasMany = [ cuotas: Cuota ]

    static constraints = {
        fecha nullable: false
        venta nullable: false, unique: true
        numeroCuotas nullable: false, min: 1, max: 24
        total nullable: false
        valorCuota nullable: false
        saldo nullable: false
    }
}
