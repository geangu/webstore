<%@ page import="hogaryestilo.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<div class="text-right">
			<a class="btn btn-primary" href="${createLink(controller: 'proveedor')}">Proveedores</a>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<filterpane:filterButton class="btn btn-primary"/>
		</div>

		<div id="list-compra" class="content scaffold-list" role="main">
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Compra" excludeProperties="fecha,observaciones"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="orden" title="${message(code: 'compra.orden.label', default: 'Orden')}" />
						<g:sortableColumn property="fecha" title="${message(code: 'compra.fecha.label', default: 'Fecha')}" />
						<th><g:message code="compra.proveedor.label" default="Proveedor" /></th>
						<g:sortableColumn property="total" title="${message(code: 'compra.total.label', default: 'Total')}" />
						<g:sortableColumn property="saldo" title="${message(code: 'compra.saldo.label', default: 'Saldo')}" />
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
						<td>${fieldValue(bean: compraInstance, field: "saldo")}</td>
						<td>${fieldValue(bean: compraInstance, field: "numeroCuotas")}</td>
						<td>
							<g:link action="pagos" class="btn btn-default btn-sm" id="${compraInstance.id}">Detalles</g:link>
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
