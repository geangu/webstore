<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="text-right">
            <a class="btn btn-primary" onclick="crearExcelPagosDia()">Reporte Pagos del día</a>
            <a class="btn btn-primary" onclick="crearExcelMorosos()">Reporte Morosos</a>
            <a class="btn btn-primary" href="${createLink(controller: 'pago', action:'zona')}">Reporte Morosos por Zona</a>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
        <h2>Buscar por número de orden o cedula de cliente</h2>
        <hr>
        <g:form controller="pago" action="buscar">
            <fieldset class="form">
                <div class="form-group">
                    <label for="orden">
                        Número de Orden
                    </label>
                    <g:textField class="form-control" name="orden" value="" />
                </div>
                <div class="form-group">
                    <label for="cedula">
                        Cédula cliente
                    </label>
                    <g:textField class="form-control" name="cedula" value="" />
                </div>
            </fieldset>
            <fieldset class="text-center">
                <g:submitButton name="search" class="btn btn-primary" value="${message(code: 'default.button.search.label', default: 'Buscar')}" />
            </fieldset>
        </g:form>
        <g:render template="crearExcelMorososScript" />
        <g:render template="crearExcelPagosDiaScript" />
    </body>
</html>
