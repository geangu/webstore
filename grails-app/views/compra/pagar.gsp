<meta name="layout" content="main">

<div class="pull-right">
    <a class="btn btn-primary" href="${createLink(controller: 'compra', action:'pagos', id:compra.id)}">Detalle Orden ${compra.orden}</a>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>

<h2>Pago Orden de Compra ${compra?.orden}</h2>
<hr>
<g:form name="name" controller="compra" action="pagar2" id="${compra.id}">

    <fieldset class="form">
        <div class="form-group">
            <label for="total">Total Compra</label>
            <input class="form-control" name="total" value="${compra.total}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="form-group">
            <label for="saldo">Saldo Pendiente</label>
            <input class="form-control" name="saldo" value="${compra.saldo}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="form-group required">
            <label for="pago">Pago</label>
            <g:select name="pago" from="${ compra.pagos.findAll{!it.pagado}.sort{it.numero} }" required="true" optionKey="id" optionValue="numero"/>
            <input class="form-control" type="hidden" name="valor" value="${compra.saldo<compra.valorCuota?compra.saldo:compra.valorCuota}"/>
        </div>
        <div class="form-group">
            <label for="valorPago">Valor Pago</label>
            <input class="form-control" name="valorPago" value="${compra.valorCuota}" type="number"/>
        </div>
    </fieldset>
    <fieldset class="text-center">
        <g:if test="${compra.saldo > 0}">
            <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </g:if>
    </fieldset>
</g:form>
