package webstore

class Producto {

    String referencia
    String nombre
    String descripcion
    BigInteger precioContado
    BigInteger precioCredito
    BigInteger precioCompra
    String observaciones

    Integer almacen
    Integer vendidos

    static belongsTo = [ categoria: Categoria ]

    static constraints = {
        referencia nullable: false, unique: true
        nombre nullable: false
        descripcion nullable: true
        precioContado nullable: false
        precioCredito nullable: false
        precioCompra nullable: false
        categoria nullable: false
        observaciones nullable: true
        almacen nullable: false, default: 0
        vendidos nullable: false, default: 0
    }

    @Override
    String toString(){
        referencia + ' - ' + descripcion
    }
}
