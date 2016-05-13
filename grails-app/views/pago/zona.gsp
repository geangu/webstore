<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="search" href="${createLink(action: 'index')}">Buscar</a></li>
    </ul>
</div>

<g:form name="name" controller="pago" action="morosos">
    <fieldset class="form">
        <div class="fieldcontain required">
            <label for="fecha">Seleccione una Zona</label>
            <g:select name="zona" from="${hogaryestilo.Zona.list()}" optionKey="id" noSelection="['null': '']"/>
        </div>
    </fieldset>
    <fieldset class="buttons">
        <a href="#" onclick="crearExcelMorosos()" name="search" class="search">Buscar</a>
    </fieldset>
</g:form>

<g:render template="crearExcelMororos" />
