package hogaryestilo

import grails.plugin.jxl.builder.ExcelBuilder
import grails.plugin.jxl.Cell
import groovy.sql.Sql
import jxl.write.NumberFormats
import jxl.write.WritableCellFormat

@Mixin(ExcelBuilder)
class ReportService {

    def dataSource

    def execute( OutputStream outputStream ){

        def query = """
            select credito_id id, max(fecha) fecha
            from pago
            where credito_id in (
            	select id from credito where saldo > 0
            )
            group by credito_id
        """
        def sql = new Sql(dataSource)

        try {
            workbook(outputStream){
                sheet("Morosos"){

                    cell(0,0, "Documento")
                    cell(1,0, "Nombre")
                    cell(2,0, "Telefono")
                    cell(3,0, "Direccion")
                    cell(4,0, "Zona")
                    cell(5,0, "Ultimo Pago")
                    cell(6,0, "Dias Mora")

                    sql.rows( query ).eachWithIndex { item, i ->
                        println item
                    //     def credito = Credito.get(item.id)
                    //
                    //     println credito
                    //
                    //     cell( 0, i+1, credito.venta.cliente.documento )
                    //     cell( 1, i+1, credito.venta.cliente.nombre )
                    //     cell( 2, i+1, credito.venta.cliente.telefono )
                    //     cell( 3, i+1, credito.venta.cliente.direccion )
                    //     cell( 4, i+1, credito.venta.cliente.zona.nombre )
                    //     cell( 5, i+1, item.fecha )
                    //     cell( 6, i+1, dias )
                    }
                }
            }
        } catch (Throwable e) {
            e.printStackTrace()
            throw (e)
        }
    }
}
