<%@ page import="hogaryestilo.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nit', 'error')} required">
	<label for="nit">
		<g:message code="proveedor.nit.label" default="Nit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nit" required="" value="${proveedorInstance?.nit}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'razonSocial', 'error')} required">
	<label for="razonSocial">
		<g:message code="proveedor.razonSocial.label" default="Razon Social" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razonSocial" required="" value="${proveedorInstance?.razonSocial}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="proveedor.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${proveedorInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="proveedor.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${proveedorInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'encargado', 'error')} required">
	<label for="encargado">
		<g:message code="proveedor.encargado.label" default="Encargado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="encargado" required="" value="${proveedorInstance?.encargado}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="proveedor.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${proveedorInstance?.observaciones}"/>

</div>

