<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="list" href="${createLink(controller: 'compra', action:'pagos', id:compra.id)}">Compras</a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<g:form name="name" controller="compra" action="pagar2" id="${compra.id}">

    <fieldset class="form">
        <div class="fieldcontain">
            <label for="compraIdRead">Número Orden</label>
            <input name="compraIdRead" value="${compra.orden}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="total">Total Compra</label>
            <input name="total" value="${compra.total}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="saldo">Saldo Pendiente</label>
            <input name="saldo" value="${compra.saldo}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain required">
            <label for="pago">Pago</label>
            <g:select name="pago" from="${ compra.pagos.findAll{!it.pagado}.sort{it.numero} }" required="true" optionKey="id" optionValue="numero"/>
            <input type="hidden" name="valor" value="${compra.saldo<compra.valorCuota?compra.saldo:compra.valorCuota}"/>
        </div>
        <div class="fieldcontain">
            <label for="valorPago">Valor Pago</label>
            <input name="valorPago" value="${compra.valorCuota}" type="number"/>
        </div>
    </fieldset>
    <fieldset class="buttons">
        <g:if test="${compra.saldo > 0}">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </g:if>
    </fieldset>
</g:form>
