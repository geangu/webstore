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
        <script>
            function crearExcel(){
                $.ajax({
                    url: '${createLink(controller: "pago", action:"morosos")}',
                    method: 'post',
                    data: null,
                    success: function(data){
                        var array = typeof data != 'object' ? JSON.parse(data) : data;
                        var str = '"Documento";"Nombre";"Teléfono";"Direccion";"Zona";"Fecha último pago";"Dias de Mora";\r\n';
                        for (var i = 0; i < array.length; i++) {
                            var line = '';
                            for (var index in array[i]) {
                                line += array[i][index] + ';';
                            }
                            line.slice(0,line.Length-1);
                            str += line + '\r\n';
                        }
                        window.open( "data:text/csv;charset=utf-8," + escape(str))
                    }
                });
            }
        </script>
    </body>
</html>
