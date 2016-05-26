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
					<filterpane:filterPane domain="Producto" excludeProperties="precioCompra,precioContado,precioCredito,observaciones,almacen,vendidos"/>
				</p>
			</div>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="referencia" title="${message(code: 'producto.referencia.label', default: 'Referencia')}" />
						<g:sortableColumn property="categoria" title="${message(code: 'producto.categoria.label', default: 'Categoria')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="almacen" title="${message(code: 'producto.almacen.label', default: 'Almacen')}" />
						<g:sortableColumn property="vendidos" title="${message(code: 'producto.vendidos.label', default: 'Vendidos')}" />
						<!-- <g:sortableColumn property="precioCompra" title="${message(code: 'producto.precioCompra.label', default: 'Precio Compra')}" />
						<g:sortableColumn property="precioContado" title="${message(code: 'producto.precioContado.label', default: 'Precio Contado')}" />
						<g:sortableColumn property="precioCredito" title="${message(code: 'producto.precioCredito.label', default: 'Precio Credito')}" /> -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${productoInstanceList}" status="i" var="productoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${productoInstance.id}">${fieldValue(bean: productoInstance, field: "referencia")}</g:link></td>
						<td>${fieldValue(bean: productoInstance, field: "categoria")}</td>
						<td>${fieldValue(bean: productoInstance, field: "nombre")}</td>
						<td>${fieldValue(bean: productoInstance, field: "almacen")}</td>
						<td>${fieldValue(bean: productoInstance, field: "vendidos")}</td>
						<!-- <td>${fieldValue(bean: productoInstance, field: "precioCompra")}</td>
						<td>${fieldValue(bean: productoInstance, field: "precioContado")}</td>
						<td>${fieldValue(bean: productoInstance, field: "precioCredito")}</td> -->
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
