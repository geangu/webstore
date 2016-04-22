<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <g:if test="${venta.id}">
            <li><g:link controller="venta" action="descartar" id="${venta.id}"><i class="fa fa-trash"></i> Descartar Venta </g:link></li>
        </g:if>
    </ul>
</div>



<g:form controller="credito" action="crear">



    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>
</g:form>
