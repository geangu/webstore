package webstore

import org.grails.databinding.BindingFormat

class Compra {

    String orden

    @BindingFormat('yyyy-MM-dd')
    Date fecha
    String observaciones
    BigInteger total

    Integer numeroCuotas
    BigInteger valorCuota
    BigInteger saldo

    static belongsTo = [ proveedor: Proveedor ]
    static hasMany = [ pagos: Pago ]

    static constraints = {
        orden nullable: false
        fecha nullable: false
        proveedor nullable: false
        observaciones nullable: true
        total nullable: false
        numeroCuotas nullable: false
        valorCuota nullable: false
        saldo nullable: false
    }

}
