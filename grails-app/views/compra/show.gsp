
<%@ page import="hogaryestilo.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-compra" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list compra">

				<g:if test="${compraInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="compra.orden.label" default="Orden" /></span>

						<span class="property-value" aria-labelledby="orden-label">${compraInstance?.orden}</span>

				</li>
				</g:if>

				<g:if test="${compraInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="compra.fecha.label" default="Fecha" /></span>

						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${compraInstance?.fecha}" /></span>

				</li>
				</g:if>

				<g:if test="${compraInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="compra.proveedor.label" default="Proveedor" /></span>

						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${compraInstance?.proveedor?.id}">${compraInstance?.proveedor?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${compraInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="compra.total.label" default="Total" /></span>

						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${compraInstance}" field="total"/></span>

				</li>
				</g:if>

				<g:if test="${compraInstance?.numeroCuotas}">
				<li class="fieldcontain">
					<span id="numeroCuotas-label" class="property-label"><g:message code="compra.numeroCuotas.label" default="Numero Cuotas" /></span>

						<span class="property-value" aria-labelledby="numeroCuotas-label"><g:fieldValue bean="${compraInstance}" field="numeroCuotas"/></span>

				</li>
				</g:if>

				<g:if test="${compraInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="compra.observaciones.label" default="Observaciones" /></span>

						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${compraInstance}" field="observaciones"/></span>

				</li>
				</g:if>

			</ol>
			<!-- <g:form url="[resource:compraInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${compraInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form> -->
		</div>
	</body>
</html>
