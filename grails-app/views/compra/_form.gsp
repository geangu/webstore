<%@ page import="hogaryestilo.Compra" %>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="compra.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<input type="number" id="orden" name="orden" value="${compraInstance?.orden}">
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="compra.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<input type="date" id="fecha" name="fecha" value="${new Date().format('yyyy-MM-dd')}">
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="compra.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${hogaryestilo.Proveedor.list()}" optionKey="id" required="" value="${compraInstance?.proveedor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="compra.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" type="number" value="${compraInstance.total}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'cuotas', 'error')} required">
	<label for="numeroCuotas">
		<g:message code="compra.numeroCuotas.label" default="Numero Cuotas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroCuotas" type="number" value="${compraInstance.numeroCuotas}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="compra.observaciones.label" default="Observaciones" />

	</label>
	<g:textField name="observaciones" value="${compraInstance?.observaciones}"/>

</div>
