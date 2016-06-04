
<%@ page import="webstore.Zona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'zona.label', default: 'Zona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-zona" class="col-sm-12">
			<div class="pull-right">
				<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>

			<g:if test="${zonaInstance?.nombre}">
				<div class="form-group">
					<label id="nombre-label" class="property-label"><g:message code="zona.nombre.label" default="Nombre" /></label>
					<input type="text" readonly="true" class="form-control" value="${zonaInstance.nombre}">
				</div>
			</g:if>

			<g:if test="${zonaInstance?.detalles}">
				<div class="form-group">
					<label id="detalles-label" class="property-label"><g:message code="zona.detalles.label" default="Detalles" /></label>
					<input type="text" readonly="true" class="form-control" value="${zonaInstance.detalles}">
				</div>
			</g:if>

			<g:form url="[resource:zonaInstance, action:'delete']" method="DELETE">
				<fieldset class="text-center">
					<g:link class="btn btn-primary" action="edit" resource="${zonaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
