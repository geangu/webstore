<meta name="layout" content="main">

<div class="pull-right">
    <g:if test="${venta.id}">
        <g:link class="btn btn-danger" controller="venta" action="descartar" id="${venta.id}"><i class="fa fa-trash"></i> Descartar Venta </g:link>
    </g:if>
</div>

<h2>Crear Crédito Venta: ${venta.orden}</h2>
<hr>

<g:form controller="credito" action="crear">

    <input type="hidden" name="venta.id" value="${venta.id}" />
    <input type="hidden" name="fecha" value="${venta.fecha}" />
    <input type="hidden" name="saldo" value="${venta.total}" />

    <fieldset class="form">

        <div class="form-group">
            <label for="fecha">
                <g:message code="venta.fecha.label" default="Fecha" />
            </label>
            <g:textField class="form-control" name="fechas" value="${formatDate(number: venta.fecha, format:'yyyy-MM-dd')}" />
        </div>

        <div class="form-group">
            <label for="total">
                <g:message code="venta.total.label" default="Total" />
            </label>
            <input class="form-control" name="total" value="${venta.total}" type="number"/>
        </div>

        <div class="form-group">
            <label for="recibo">
                <g:message code="cuota.recibo.label" default="Recibo primera cuota" />
                <span class="required-indicator">*</span>
            </label>
            <input class="form-control" id="recibo" name="recibo" value="" type="number"/>
        </div>

        <div class="form-group">
            <label for="valorCuota">
                <g:message code="venta.valorCuota.label" default="Valor Cuota" />
                <span class="required-indicator">*</span>
            </label>
            <input class="form-control" id="valorCuota" name="valorCuota" value="${venta.total/12}" readonly="true" type="number"/>
        </div>

        <div class="form-group">
            <label for="cuotas">
                <g:message code="venta.cuotas.label" default="Cuotas" />
                <span class="required-indicator">*</span>
            </label>
            <input class="form-control" name="cuotas" value="12" onkeyup="$('#valorCuota').val(${venta.total}/this.value);" type="number"/>
        </div>

    </fieldset>

    <fieldset class="text-center">
        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>

</g:form>
