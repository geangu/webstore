<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="list" onclick="crearExcel()">Reporte Morosos</a></li>
            </ul>
        </div>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:form controller="pago" action="buscar">
            <div style="margin-left: 2em;">
                <h1>Buscar por número de pago o cedula de cliente</h1>
            </div>
            <fieldset class="form">
                <div class="fieldcontain">
                    <label for="creditoId">
                        Código de pago
                    </label>
                    <g:textField name="creditoId" value="" />
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
        <g:render template="crearExcelScript" />
    </body>
</html>
