
<%@ page import="webstore.Fiador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fiador.label', default: 'Fiador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div class="text-right">
			<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>

		<div id="show-fiador" class="content scaffold-show" role="main">
			<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>

			<g:if test="${fiadorInstance?.cliente}">
			<div class="form-group">
				<label id="cliente-label" class="property-label"><g:message code="fiador.cliente.label" default="Cliente" /></label>
				<input type="text" readonly="true" class="form-control" value="${fiadorInstance.cliente}"/>
			</div>
			</g:if>

			<g:if test="${fiadorInstance?.documento}">
			<div class="form-group">
				<label id="documento-label" class="property-label"><g:message code="fiador.documento.label" default="Documento" /></label>
				<input type="text" readonly="true" class="form-control" value="${fiadorInstance.documento}"/>
			</div>
			</g:if>

			<g:if test="${fiadorInstance?.nombre}">
			<div class="form-group">
				<label id="nombre-label" class="property-label"><g:message code="fiador.nombre.label" default="Nombre" /></label>
				<input type="text" readonly="true" class="form-control" value="${fiadorInstance.nombre}"/>
			</div>
			</g:if>

			<g:if test="${fiadorInstance?.telefono}">
			<div class="form-group">
				<label id="telefono-label" class="property-label"><g:message code="fiador.telefono.label" default="Telefono" /></label>
				<input type="text" readonly="true" class="form-control" value="${fiadorInstance.telefono}"/>
			</div>
			</g:if>

			<g:if test="${fiadorInstance?.direccion}">
			<div class="form-group">
				<label id="direccion-label" class="property-label"><g:message code="fiador.direccion.label" default="Direccion" /></label>
				<input type="text" readonly="true" class="form-control" value="${fiadorInstance.direccion}"/>
			</div>
			</g:if>

			<g:if test="${fiadorInstance?.zona}">
			<div class="form-group">
				<label id="zona-label" class="property-label"><g:message code="fiador.zona.label" default="Zona" /></label>
				<input type="text" readonly="true" class="form-control" value="${fiadorInstance.zona}"/>
			</div>
			</g:if>

			<g:form url="[resource:fiadorInstance, action:'delete']" method="DELETE">
			<fieldset class="text-center">
				<g:link class="btn btn-primary" action="edit" resource="${fiadorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
			</g:form>
		</div>
	</body>
</html>
