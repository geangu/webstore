package hogaryestilo

class Fiador {

    Cliente cliente
    String documento
    String nombre
    String telefono
    String direccion
    Zona zona

    static constraints = {
        cliente nullable: false
        documento nullable: false
        nombre nullable: false
        telefono nullable: false
        direccion nullable: false
        zona nullable: true
    }

    @Override
    String toString(){
        documento + '-' + nombre
    }
}
