<%@ page import="webstore.Zona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'zona.label', default: 'Zona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<div class="text-right">
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<filterpane:filterButton class="btn btn-primary"/>
		</div>

		<div id="list-zona" class="content scaffold-list" role="main">
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Zona"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="nombre" title="${message(code: 'zona.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="detalles" title="${message(code: 'zona.detalles.label', default: 'Detalles')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${zonaInstanceList}" status="i" var="zonaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${zonaInstance.id}">${fieldValue(bean: zonaInstance, field: "nombre")}</g:link></td>
						<td>${fieldValue(bean: zonaInstance, field: "detalles")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination pagination-sm">
				<g:paginate total="${zonaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
