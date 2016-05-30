<%@ page import="hogaryestilo.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div class="text-right">
			<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>

		<div id="show-categoria" class="col-sm-12">
			<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>

			<g:if test="${categoriaInstance?.nombre}">
				<div class="form-group">
					<label id="nombre-label"><g:message code="proveedor.nombre.label" default="Nombre" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="nombre-label" value="${categoriaInstance?.nombre}"/>
				</div>
			</g:if>

			<g:if test="${categoriaInstance?.descripcion}">
				<div class="form-group">
					<label id="descripcion-label"><g:message code="proveedor.descripcion.label" default="Descripcion" /></label>
					<input type="text" readonly="true" class="form-control" aria-labelledby="descripcion-label" value="${categoriaInstance?.descripcion}"/>
				</div>
			</g:if>

			<g:form url="[resource:categoriaInstance, action:'delete']" method="DELETE">
				<fieldset class="text-center">
					<g:link class="btn btn-primary" action="edit" resource="${categoriaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
