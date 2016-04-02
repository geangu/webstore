<%@ page import="hogaryestilo.Bodega" %>



<div class="fieldcontain ${hasErrors(bean: bodegaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="bodega.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${bodegaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bodegaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="bodega.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${bodegaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bodegaInstance, field: 'encargado', 'error')} required">
	<label for="encargado">
		<g:message code="bodega.encargado.label" default="Encargado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="encargado" required="" value="${bodegaInstance?.encargado}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bodegaInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="bodega.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${bodegaInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bodegaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="bodega.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${bodegaInstance?.observaciones}"/>

</div>

