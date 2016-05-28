package hogaryestilo

import grails.transaction.Transactional

@Transactional
class FechaService {

    private Date sumarDias(Date fecha, int dias){
        Calendar calendar = Calendar.getInstance()
        calendar.setTime(fecha) // Configuramos la fecha que se recibe
        calendar.add(Calendar.DAY_OF_YEAR, dias)  // numero de días a añadir, o restar en caso de días < 0
        return calendar.getTime()
    }
}
