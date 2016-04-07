package hogaryestilo

class Producto {

    String referencia
    String nombre
    String descripcion
    BigInteger precio
    BigInteger precioCredito
    String observaciones

    static belongsTo = [ categoria: Categoria ]

    static constraints = {
        referencia nullable: false, unique: true
        nombre nullable: false
        descripcion nullable: true
        precio nullable: false
        precioCredito nullable: false
        categoria nullable: false
        observaciones nullable: true
    }

    @Override
    String toString(){
        referencia + ' - ' + descripcion
    }
}
