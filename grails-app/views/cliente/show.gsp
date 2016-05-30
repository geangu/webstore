<%@ page import="hogaryestilo.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div class="text-right">
			<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>

		<div id="show-cliente" class="col-sm-12">
			<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>

			<g:if test="${clienteInstance?.documento}">
				<div class="form-group">
					<span id="documento-label" class="property-label"><g:message code="cliente.documento.label" default="Documento" /></span>
					<input type="text" readonly="true" class="form-control" aria-labelledby="documento-label" value="${clienteInstance?.documento}"/>
				</div>
			</g:if>
			<g:if test="${clienteInstance?.nombre}">
				<div class="form-group">
					<span id="nombre-label" class="property-label"><g:message code="cliente.nombre.label" default="Nombre" /></span>
					<input type="text" readonly="true" class="form-control" aria-labelledby="nombre-label" value="${clienteInstance?.nombre}"/>
				</div>
			</g:if>
			<g:if test="${clienteInstance?.telefono}">
				<div class="form-group">
					<span id="telefono-label" class="property-label"><g:message code="cliente.telefono.label" default="Telefono" /></span>
					<input type="text" readonly="true" class="form-control" aria-labelledby="telefono-label" value="${clienteInstance?.telefono}"/>
				</div>
			</g:if>
			<g:if test="${clienteInstance?.direccion}">
				<div class="form-group">
					<span id="direccion-label" class="property-label"><g:message code="cliente.direccion.label" default="Direccion" /></span>
					<input type="text" readonly="true" class="form-control" aria-labelledby="direccion-label" value="${clienteInstance?.direccion}"/>
				</div>
			</g:if>
			<g:if test="${clienteInstance?.zona}">
				<div class="form-group">
					<span id="zona-label" class="property-label"><g:message code="cliente.zona.label" default="Zona" /></span>
					<input type="text" readonly="true" class="form-control" aria-labelledby="zona-label" value="${clienteInstance?.zona?.encodeAsHTML()}"/>
				</div>
			</g:if>
			<g:if test="${clienteInstance?.fiador}">
				<div class="form-group">
					<span id="fiador-label" class="property-label"><g:message code="cliente.fiador.label" default="Fiador" /></span>
					<input type="text" readonly="true" class="form-control" aria-labelledby="fiador-label" value="${clienteInstance?.fiador?.encodeAsHTML()}"/>
				</div>
			</g:if>

			<g:form url="[resource:clienteInstance, action:'delete']" method="DELETE">
				<fieldset class="text-center">
					<g:link class="btn btn-primary" action="edit" resource="${clienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
