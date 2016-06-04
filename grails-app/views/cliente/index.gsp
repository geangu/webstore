<%@ page import="webstore.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<div class="text-right">
			<a class="btn btn-primary" href="${createLink(controller: 'fiador')}">Fiadores</a>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<filterpane:filterButton class="btn btn-primary"/>
		</div>

		<div id="list-cliente" class="col-sm-12">
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Cliente"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="documento" title="${message(code: 'cliente.documento.label', default: 'Documento')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'cliente.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="telefono" title="${message(code: 'cliente.telefono.label', default: 'Telefono')}" />
						<g:sortableColumn property="direccion" title="${message(code: 'cliente.direccion.label', default: 'Direccion')}" />
						<th><g:message code="cliente.zona.label" default="Zona" /></th>
						<th><g:message code="cliente.fiador.label" default="Fiador" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "documento")}</g:link></td>
						<td>${fieldValue(bean: clienteInstance, field: "nombre")}</td>
						<td>${fieldValue(bean: clienteInstance, field: "telefono")}</td>
						<td>${fieldValue(bean: clienteInstance, field: "direccion")}</td>
						<td>${fieldValue(bean: clienteInstance, field: "zona")}</td>
						<td>${fieldValue(bean: clienteInstance, field: "fiador")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination pagination-sm">
				<g:paginate total="${clienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
