<%@ page import="hogaryestilo.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>
		<a href="#list-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><filterpane:filterButton/></li>
			</ul>
		</div>
		<div id="list-producto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Producto" excludeProperties="precio,precioCredito,observaciones"/>
				</p>
			</div>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="referencia" title="${message(code: 'producto.referencia.label', default: 'Referencia')}" />

						<g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />

						<g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" />

						<g:sortableColumn property="precio" title="${message(code: 'producto.precio.label', default: 'Precio')}" />

						<g:sortableColumn property="precioCredito" title="${message(code: 'producto.precioCredito.label', default: 'Precio Credito')}" />

						<g:sortableColumn property="categoria" title="${message(code: 'producto.categoria.label', default: 'Categoria')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${productoInstanceList}" status="i" var="productoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${productoInstance.id}">${fieldValue(bean: productoInstance, field: "referencia")}</g:link></td>

						<td>${fieldValue(bean: productoInstance, field: "nombre")}</td>

						<td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>

						<td>${fieldValue(bean: productoInstance, field: "precio")}</td>

						<td>${fieldValue(bean: productoInstance, field: "precioCredito")}</td>

						<td>${fieldValue(bean: productoInstance, field: "categoria")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
