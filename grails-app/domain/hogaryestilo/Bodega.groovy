package hogaryestilo

class Bodega {

    String nombre
    String descripcion
    String encargado
    String telefono
    String observaciones

    static constraints = {
        nombre nullable: false
        descripcion nullable: false
        encargado nullable: false
        telefono nullable: false
        observaciones nullable: true
    }

    @Override
    String toString(){
        nombre
    }

}
