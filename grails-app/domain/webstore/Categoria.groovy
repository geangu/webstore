package webstore

class Categoria {

    String nombre
    String descripcion

    static constraints = {
        nombre nullable: false
        descripcion nullable: false
    }

    @Override
    String toString(){
        nombre
    }
}
