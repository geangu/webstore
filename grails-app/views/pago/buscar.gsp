<meta name="layout" content="main">

<div class="text-right">
    <a class="btn btn-primary" href="${createLink(action: 'index')}">Buscar por número de orden o cédula de cliente</a>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>

<h2>Pago Orden de venta: ${credito.venta.orden}</h2>
<hr>

<g:form name="name" controller="pago" action="crear">

    <fieldset class="form">
        <input type="hidden" name="creditoId" value="${credito.id}"/>
        <div class="form-group">
            <label for="total">Cliente</label>
            <input class="form-control" name="total" value="${cliente}" type="text" readonly="true" disabled="true"/>
        </div>
        <div class="form-group">
            <label for="total">Total Crédito</label>
            <input class="form-control" name="total" value="${credito.total}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="form-group">
            <label for="saldo">Saldo Pendiente</label>
            <input class="form-control" name="saldo" value="${credito.saldo}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain required">
            <label for="fecha">Cuota</label>
            <g:select name="cuota" from="${ credito.cuotas.findAll{!it.pagada}.sort{it.numero} }" required="true" optionKey="id" optionValue="numero"/>
            <input type="hidden" name="valor" value="${credito.saldo<credito.valorCuota?credito.saldo:credito.valorCuota}"/>
        </div>
        <div class="form-group">
            <label for="valorPago">Valor Pago</label>
            <input class="form-control" name="valorPago" value="${credito.valorCuota}" type="number"/>
        </div>
    </fieldset>
    <fieldset class="text-center">
        <g:if test="${credito.saldo > 0}">
            <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </g:if>
    </fieldset>
</g:form>
