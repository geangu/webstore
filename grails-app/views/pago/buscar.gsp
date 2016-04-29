<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="search" href="${createLink(action: 'index')}">Buscar</a></li>
        <li><a class="list" href="${createLink(action: 'historial', params:[creditoId: credito.id])}">Detalles</a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<table>
    <thead>
        <th>Cliente</th>
    </thead>
    <tbody>
        <tr>
            <td>${cliente}</td>
        </tr>
    </tbody>
</table>
<hr>

<g:form name="name" controller="pago" action="crear">

    <fieldset class="form">
        <input type="hidden" name="creditoId" value="${credito.id}"/>
        <div class="fieldcontain">
            <label for="creditoIdRead">Número Crédito</label>
            <input name="creditoIdRead" value="${credito.id}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="total">Total Crédito</label>
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
        <g:if test="${credito.saldo > 0}">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </g:if>
    </fieldset>
</g:form>
