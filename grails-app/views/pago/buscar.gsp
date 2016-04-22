<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="search" href="${createLink(action: 'index')}">Buscar</a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div class="">

</div>

<g:form name="name" controller="controller" action="action">

    <fieldset class="form">

        <div class="fieldcontain">
            <label for="total">Total Credito</label>
            <input name="total" value="${credito.total}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="saldo">Saldo Pendiente</label>
            <input name="saldo" value="${credito.saldo}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain required">
            <label for="fecha">Valor Pago</label>
            <g:textField name="valor" value="${credito.saldo<credito.valorCuota?credito.saldo:credito.valorCuota}" />
        </div>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>
</g:form>
