
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
		<a href="#list-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><filterpane:filterButton/></li>
			</ul>
		</div>
		<div id="list-proveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Proveedor" excludeProperties="observaciones"/>
				</p>
			</div>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="nit" title="${message(code: 'proveedor.nit.label', default: 'Nit')}" />

						<g:sortableColumn property="razonSocial" title="${message(code: 'proveedor.razonSocial.label', default: 'Razon Social')}" />

						<g:sortableColumn property="telefono" title="${message(code: 'proveedor.telefono.label', default: 'Telefono')}" />

						<g:sortableColumn property="direccion" title="${message(code: 'proveedor.direccion.label', default: 'Direccion')}" />

						<g:sortableColumn property="encargado" title="${message(code: 'proveedor.encargado.label', default: 'Encargado')}" />

						<g:sortableColumn property="observaciones" title="${message(code: 'proveedor.observaciones.label', default: 'Observaciones')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${proveedorInstanceList}" status="i" var="proveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${proveedorInstance.id}">${fieldValue(bean: proveedorInstance, field: "nit")}</g:link></td>

						<td>${fieldValue(bean: proveedorInstance, field: "razonSocial")}</td>

						<td>${fieldValue(bean: proveedorInstance, field: "telefono")}</td>

						<td>${fieldValue(bean: proveedorInstance, field: "direccion")}</td>

						<td>${fieldValue(bean: proveedorInstance, field: "encargado")}</td>

						<td>${fieldValue(bean: proveedorInstance, field: "observaciones")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proveedorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
