
<%@ page import="hogaryestilo.Bodega" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bodega.label', default: 'Bodega')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>
		<a href="#list-bodega" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><filterpane:filterButton/></li>
			</ul>
		</div>
		<div id="list-bodega" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Bodega" excludeProperties="observaciones"/>
				</p>
			</div>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="nombre" title="${message(code: 'bodega.nombre.label', default: 'Nombre')}" />

						<g:sortableColumn property="descripcion" title="${message(code: 'bodega.descripcion.label', default: 'Descripcion')}" />

						<g:sortableColumn property="encargado" title="${message(code: 'bodega.encargado.label', default: 'Encargado')}" />

						<g:sortableColumn property="telefono" title="${message(code: 'bodega.telefono.label', default: 'Telefono')}" />

						<g:sortableColumn property="observaciones" title="${message(code: 'bodega.observaciones.label', default: 'Observaciones')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${bodegaInstanceList}" status="i" var="bodegaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${bodegaInstance.id}">${fieldValue(bean: bodegaInstance, field: "nombre")}</g:link></td>

						<td>${fieldValue(bean: bodegaInstance, field: "descripcion")}</td>

						<td>${fieldValue(bean: bodegaInstance, field: "encargado")}</td>

						<td>${fieldValue(bean: bodegaInstance, field: "telefono")}</td>

						<td>${fieldValue(bean: bodegaInstance, field: "observaciones")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bodegaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
