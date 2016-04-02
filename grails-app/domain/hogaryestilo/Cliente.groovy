package hogaryestilo

class Cliente {

    String documento
    String nombre
    String telefono
    String direccion

    static constraints = {
        documento nullable: true, unique: true
        nombre nullable: true
        telefono nullable: true
        direccion nullable: true
    }

    @Override
    String toString(){
        nombre
    }
}
