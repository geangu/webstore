<%@ page import="hogaryestilo.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<div class="text-right">
			<a class="btn btn-primary" href="${createLink(controller: 'compra')}">Compras</a>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<filterpane:filterButton class="btn btn-primary"/>
		</div>

		<div id="list-proveedor" class="col-sm-12">
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Proveedor"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="nit" title="${message(code: 'proveedor.nit.label', default: 'Nit')}" />
						<g:sortableColumn property="razonSocial" title="${message(code: 'proveedor.razonSocial.label', default: 'Razon Social')}" />
						<g:sortableColumn property="telefono" title="${message(code: 'proveedor.telefono.label', default: 'Telefono')}" />
						<g:sortableColumn property="direccion" title="${message(code: 'proveedor.direccion.label', default: 'Direccion')}" />
						<g:sortableColumn property="encargado" title="${message(code: 'proveedor.encargado.label', default: 'Encargado')}" />
						<g:sortableColumn property="banco" title="${message(code: 'proveedor.banco.label', default: 'Banco')}" />
					</tr>
				</thead>
				<tbody>
					<g:each in="${proveedorInstanceList}" var="proveedorInstance">
						<tr>
							<td><g:link action="show" id="${proveedorInstance.id}">${fieldValue(bean: proveedorInstance, field: "nit")}</g:link></td>
							<td>${fieldValue(bean: proveedorInstance, field: "razonSocial")}</td>
							<td>${fieldValue(bean: proveedorInstance, field: "telefono")}</td>
							<td>${fieldValue(bean: proveedorInstance, field: "direccion")}</td>
							<td>${fieldValue(bean: proveedorInstance, field: "encargado")}</td>
							<td>${fieldValue(bean: proveedorInstance, field: "banco")}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination pagination-sm">
				<g:paginate total="${proveedorInstanceCount ?: 0}" />
			</div>
		</div>

	</body>
</html>
