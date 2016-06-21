package webstore

class Proveedor {

    String nit
    String razonSocial
    String telefono
    String direccion
    String encargado
    String banco
    String numeroCuenta
    String observaciones

    static constraints = {
        nit nullable: false, unique: true
        razonSocial nullable: false
        telefono nullable: false
        direccion nullable: false
        encargado nullable: false
        banco nullable: true
        numeroCuenta nullable: true
        observaciones nullable: true
    }

    @Override
    String toString(){
        razonSocial
    }
}
