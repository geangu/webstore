
<%@ page import="hogaryestilo.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-compra" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="orden" title="${message(code: 'compra.orden.label', default: 'Orden')}" />
						<g:sortableColumn property="fecha" title="${message(code: 'compra.fecha.label', default: 'Fecha')}" />
						<th><g:message code="compra.proveedor.label" default="Proveedor" /></th>
						<g:sortableColumn property="total" title="${message(code: 'compra.total.label', default: 'Total')}" />
						<g:sortableColumn property="numeroCuotas" title="${message(code: 'compra.numeroCuotas.label', default: 'Numero Cuotas')}" />
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${compraInstanceList}" status="i" var="compraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${compraInstance.orden}</td>
						<td>${compraInstance.fecha.format('dd-MM-yyyy')}</td>
						<td>${fieldValue(bean: compraInstance, field: "proveedor")}</td>
						<td>${fieldValue(bean: compraInstance, field: "total")}</td>
						<td>${fieldValue(bean: compraInstance, field: "numeroCuotas")}</td>
						<td>
							<g:link action="show" id="${compraInstance.id}">Ver</g:link>
							<g:link action="pagar" id="${compraInstance.id}">Pagar</g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compraInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
