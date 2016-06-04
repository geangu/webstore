<meta name="layout" content="main">

<div class="text-right">
    <a class="btn btn-primary" href="${createLink(action: 'index')}">Buscar por número de orden o cédula de cliente</a>
</div>

<h2>Reporte Morosos por Zona</h2>
<hr>

<g:form name="name" controller="pago" action="morosos">
    <fieldset class="form">
        <div class="form-group">
            <label for="fecha">Seleccione una Zona</label>
            <g:select class="form-control" name="zona" from="${webstore.Zona.list()}" optionKey="id" noSelection="['null': '']"/>
        </div>
    </fieldset>
    <fieldset class="text-center">
        <a href="#" onclick="crearExcelMorosos()" name="search" class="btn btn-primary">Buscar</a>
    </fieldset>
</g:form>

<g:render template="crearExcelMorososScript" />
