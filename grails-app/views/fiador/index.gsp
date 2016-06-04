<%@ page import="webstore.Fiador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fiador.label', default: 'Fiador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<div class="text-right">
			<a class="btn btn-primary" href="${createLink(controller: 'cliente')}">Clientes</a>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<filterpane:filterButton class="btn btn-primary"/>
		</div>

		<div id="list-fiador" class="content scaffold-list" role="main">
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Fiador"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="documento" title="${message(code: 'fiador.documento.label', default: 'Documento')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'fiador.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="telefono" title="${message(code: 'fiador.telefono.label', default: 'Telefono')}" />
						<g:sortableColumn property="direccion" title="${message(code: 'fiador.direccion.label', default: 'Direccion')}" />
						<th><g:message code="fiador.cliente.label" default="Cliente" /></th>
						<th><g:message code="fiador.zona.label" default="Zona" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${fiadorInstanceList}" status="i" var="fiadorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${fiadorInstance.id}">${fieldValue(bean: fiadorInstance, field: "documento")}</g:link></td>
						<td>${fieldValue(bean: fiadorInstance, field: "nombre")}</td>
						<td>${fieldValue(bean: fiadorInstance, field: "telefono")}</td>
						<td>${fieldValue(bean: fiadorInstance, field: "direccion")}</td>
						<td>${fieldValue(bean: fiadorInstance, field: "cliente")}</td>
						<td>${fieldValue(bean: fiadorInstance, field: "zona")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination pagination-sm">
				<g:paginate total="${fiadorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
