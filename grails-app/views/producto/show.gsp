
<%@ page import="webstore.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-producto" class="content scaffold-show" role="main">
			<div class="pull-right">
				<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div class="property-list producto">

				<g:if test="${productoInstance?.referencia}">
				<div class="form-group">
					<label id="referencia-label" class="property-label"><g:message code="producto.referencia.label" default="Referencia" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.referencia}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.nombre}">
				<div class="form-group">
					<label id="nombre-label" class="property-label"><g:message code="producto.nombre.label" default="Nombre" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.nombre}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.descripcion}">
				<div class="form-group">
					<label id="descripcion-label" class="property-label"><g:message code="producto.descripcion.label" default="Descripcion" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.descripcion}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.precioCompra}">
				<div class="form-group">
					<label id="precioCompra-label" class="property-label"><g:message code="producto.precioCompra.label" default="Precio Compra" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.precioCompra}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.precioContado}">
				<div class="form-group">
					<label id="precioContado-label" class="property-label"><g:message code="producto.precioContado.label" default="Precio Contado" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.precioContado}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.precioCredito}">
				<div class="form-group">
					<label id="precioCredito-label" class="property-label"><g:message code="producto.precioCredito.label" default="Precio Credito" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.precioCredito}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.categoria}">
				<div class="form-group">
					<label id="categoria-label" class="property-label"><g:message code="producto.categoria.label" default="Categoria" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.categoria}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.observaciones}">
				<div class="form-group">
					<label id="observaciones-label" class="property-label"><g:message code="producto.observaciones.label" default="Observaciones" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.observaciones}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.almacen}">
				<div class="form-group">
					<label id="almacen-label" class="property-label"><g:message code="producto.almacen.label" default="Almacen" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.almacen}"/>
				</div>
				</g:if>

				<g:if test="${productoInstance?.vendidos}">
				<div class="form-group">
					<label id="vendidos-label" class="property-label"><g:message code="producto.vendidos.label" default="Vendidos" /></label>
					<input type="text" readonly="true" class="form-control" value="${productoInstance.vendidos}"/>
				</div>
				</g:if>

			</div>
			<g:form url="[resource:productoInstance, action:'delete']" method="DELETE">
				<fieldset class="text-center">
					<g:link class="btn btn-primary" action="edit" resource="${productoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
