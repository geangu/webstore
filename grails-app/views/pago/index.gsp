<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<g:form controller="pago" action="buscar">
    <div style="margin-left: 2em;">
        <h1>Buscar por número de pago</h1>
    </div>
    <fieldset class="form">
        <div class="fieldcontain">
            <label for="fecha">
                Código de pago
            </label>
            <g:textField name="creditoId" value="0" />
        </div>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Buscar')}" />
    </fieldset>
</g:form>
