
<%@ page import="hogaryestilo.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div class="text-right">
			<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>

		<div id="show-proveedor" class="col-sm-12">
			<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>

			<g:if test="${proveedorInstance?.nit}">
				<div class="form-group">
					<label id="nit-label"><g:message code="proveedor.nit.label" default="Nit" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="nit-label" value="${proveedorInstance?.nit}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.razonSocial}">
				<div class="form-group">
					<label id="razonSocial-label"><g:message code="proveedor.razonSocial.label" default="Razon Social" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="razonSocial-label" value="${proveedorInstance?.razonSocial}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.telefono}">
				<div class="form-group">
					<label id="telefono-label"><g:message code="proveedor.telefono.label" default="Telefono" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="telefono-label" value="${proveedorInstance?.telefono}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.direccion}">
				<div class="form-group">
					<label id="direccion-label"><g:message code="proveedor.direccion.label" default="Direccion" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="direccion-label" value="${proveedorInstance?.direccion}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.encargado}">
				<div class="form-group">
					<label id="encargado-label"><g:message code="proveedor.encargado.label" default="Encargado" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="encargado-label" value="${proveedorInstance?.encargado}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.banco}">
				<div class="form-group">
					<label id="banco-label"><g:message code="proveedor.banco.label" default="Banco" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="banco-label" value="${proveedorInstance?.banco}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.numeroCuenta}">
				<div class="form-group">
					<label id="numeroCuenta-label"><g:message code="proveedor.numeroCuenta.label" default="Numero Cuenta" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="numeroCuenta-label" value="${proveedorInstance?.numeroCuenta}"/>
				</div>
			</g:if>

			<g:if test="${proveedorInstance?.observaciones}">
				<div class="form-group">
					<label id="observaciones-label"><g:message code="proveedor.observaciones.label" default="Observaciones" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="observaciones-label" value="${proveedorInstance?.observaciones}"/>
				</div>
			</g:if>

			<g:form url="[resource:proveedorInstance, action:'delete']" method="DELETE">
				<fieldset class="text-center">
					<g:link class="btn btn-primary" action="edit" resource="${proveedorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
