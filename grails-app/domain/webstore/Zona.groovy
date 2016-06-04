package webstore

class Zona {

    String nombre
    String detalles

    static constraints = {
        nombre nullable: false
        detalles nullable: true
    }

    @Override
    String toString(){
        nombre
    }
}
