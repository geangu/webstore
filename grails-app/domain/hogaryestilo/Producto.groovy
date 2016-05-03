package hogaryestilo

class Producto {

    String referencia
    String nombre
    String descripcion
    BigInteger precio
    BigInteger precioCredito
    String observaciones

    Integer almacen
    Integer vendidos

    static belongsTo = [ categoria: Categoria ]

    static constraints = {
        referencia nullable: false, unique: true
        nombre nullable: false
        descripcion nullable: true
        precio nullable: false
        precioCredito nullable: false
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
