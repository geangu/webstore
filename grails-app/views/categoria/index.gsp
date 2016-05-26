<%@ page import="hogaryestilo.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<filterpane:filterButton/>

		<div id="list-categoria" class="content scaffold-list" role="main">
			<h3><g:message code="default.list.label" args="[entityName]" /></h3>
			<hr>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div>
				<filterpane:filterPane domain="Categoria"/>
			</div>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="nombre" title="${message(code: 'categoria.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="descripcion" title="${message(code: 'categoria.descripcion.label', default: 'Descripcion')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "nombre")}</g:link></td>
						<td>${fieldValue(bean: categoriaInstance, field: "descripcion")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>

			<div class="pagination">
				<g:paginate total="${categoriaInstanceCount ?: 0}" />
			</div>

		</div>

		<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
			<g:link class="btn-floating btn-large red waves-effect" action="create">
				<i class="fa fa-plus" aria-hidden="true"></i>
			</g:link>
		</div>

	</body>
</html>
