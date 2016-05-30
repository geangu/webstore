<%@ page import="hogaryestilo.Proveedor" %>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'nit', 'error')} required">
	<label for="nit">
		<g:message code="proveedor.nit.label" default="Nit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nit" required="" value="${proveedorInstance?.nit}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'razonSocial', 'error')} required">
	<label for="razonSocial">
		<g:message code="proveedor.razonSocial.label" default="Razon Social" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razonSocial" required="" value="${proveedorInstance?.razonSocial}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="proveedor.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${proveedorInstance?.telefono}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="proveedor.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${proveedorInstance?.direccion}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'encargado', 'error')} required">
	<label for="encargado">
		<g:message code="proveedor.encargado.label" default="Encargado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="encargado" required="" value="${proveedorInstance?.encargado}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'banco', 'error')} required">
	<label for="banco">
		<g:message code="proveedor.banco.label" default="Banco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="banco" required="" value="${proveedorInstance?.banco}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'numeroCuenta', 'error')} required">
	<label for="numeroCuenta">
		<g:message code="proveedor.numeroCuenta.label" default="Numero Cuenta" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numeroCuenta" required="" value="${proveedorInstance?.numeroCuenta}" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: proveedorInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="proveedor.observaciones.label" default="Observaciones" />
	</label>
	<g:textField name="observaciones" value="${proveedorInstance?.observaciones}" class="form-control" />
</div>
