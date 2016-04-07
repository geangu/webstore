package hogaryestilo

class Cliente {

    String documento
    String nombre
    String telefono
    String direccion
    Zona zona

    static constraints = {
        documento nullable: true, unique: true
        nombre nullable: true
        telefono nullable: true
        direccion nullable: true
        zona nullable: true
    }

    @Override
    String toString(){
        documento + '-' + nombre
    }
}
