<%@ page import="webstore.Categoria" %>
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

		<div id="list-categoria" class="col-sm-12">
			<div class="pull-right">
				<a class="btn btn-primary" href="${createLink(controller: 'producto')}">Productos</a>
				<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				<filterpane:filterButton class="btn btn-primary"/>
			</div>
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Categoria"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
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
			<div class="pagination pagination-sm">
				<g:paginate total="${categoriaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
