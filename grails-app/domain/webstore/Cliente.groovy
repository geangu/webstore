package webstore

class Cliente {

    String documento
    String nombre
    String telefono
    String direccion
    Zona zona

    static hasOne = [
        fiador: Fiador
    ]

    static constraints = {
        documento nullable: false, unique: true
        nombre nullable: false
        telefono nullable: false
        direccion nullable: false
        zona nullable: false
        fiador nullable: true
    }

    @Override
    String toString(){
        documento + '-' + nombre
    }
}
