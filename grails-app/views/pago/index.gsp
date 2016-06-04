<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="list" onclick="crearExcelPagosDia()">Reporte Pagos del día</a></li>
                <li><a class="list" onclick="crearExcelMorosos()">Reporte Morosos</a></li>
                <li><a class="list" href="${createLink(controller: 'pago', action:'zona')}">Reporte Morosos por Zona</a></li>
            </ul>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
        <g:form controller="pago" action="buscar">
            <div style="margin-left: 2em;">
                <h1>Buscar por número de orden o cedula de cliente</h1>
            </div>
            <fieldset class="form">
                <div class="fieldcontain">
                    <label for="orden">
                        Número de Orden
                    </label>
                    <g:textField name="orden" value="" />
                </div>
                <div class="fieldcontain">
                    <label for="cedula">
                        Cédula cliente
                    </label>
                    <g:textField name="cedula" value="" />
                </div>
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" />
            </fieldset>
        </g:form>
        <g:render template="crearExcelMorososScript" />
        <g:render template="crearExcelPagosDiaScript" />
    </body>
</html>
