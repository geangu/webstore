<%@ page import="hogaryestilo.Zona" %>



<div class="fieldcontain ${hasErrors(bean: zonaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="zona.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${zonaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: zonaInstance, field: 'detalles', 'error')} ">
	<label for="detalles">
		<g:message code="zona.detalles.label" default="Detalles" />
		
	</label>
	<g:textField name="detalles" value="${zonaInstance?.detalles}"/>

</div>

