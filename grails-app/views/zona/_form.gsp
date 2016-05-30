<%@ page import="hogaryestilo.Zona" %>

<div class="form-group ${hasErrors(bean: zonaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="zona.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nombre" required="" value="${zonaInstance?.nombre}"/>
</div>

<div class="form-group ${hasErrors(bean: zonaInstance, field: 'detalles', 'error')} ">
	<label for="detalles">
		<g:message code="zona.detalles.label" default="Detalles" />

	</label>
	<g:textField class="form-control" name="detalles" value="${zonaInstance?.detalles}"/>
</div>
