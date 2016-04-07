package hogaryestilo

class DetalleVenta {

    Producto producto
    Integer cantidad

    static belongsTo = [venta: Venta]

    static constraints = {
        venta nullable: false
        producto nullable: false
        cantidad nullable: false, min: 1
    }
}
