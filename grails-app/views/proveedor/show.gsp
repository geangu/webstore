
<%@ page import="hogaryestilo.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proveedor">
			
				<g:if test="${proveedorInstance?.nit}">
				<li class="fieldcontain">
					<span id="nit-label" class="property-label"><g:message code="proveedor.nit.label" default="Nit" /></span>
					
						<span class="property-value" aria-labelledby="nit-label"><g:fieldValue bean="${proveedorInstance}" field="nit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.razonSocial}">
				<li class="fieldcontain">
					<span id="razonSocial-label" class="property-label"><g:message code="proveedor.razonSocial.label" default="Razon Social" /></span>
					
						<span class="property-value" aria-labelledby="razonSocial-label"><g:fieldValue bean="${proveedorInstance}" field="razonSocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="proveedor.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${proveedorInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="proveedor.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${proveedorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.encargado}">
				<li class="fieldcontain">
					<span id="encargado-label" class="property-label"><g:message code="proveedor.encargado.label" default="Encargado" /></span>
					
						<span class="property-value" aria-labelledby="encargado-label"><g:fieldValue bean="${proveedorInstance}" field="encargado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="proveedor.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:fieldValue bean="${proveedorInstance}" field="banco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.numeroCuenta}">
				<li class="fieldcontain">
					<span id="numeroCuenta-label" class="property-label"><g:message code="proveedor.numeroCuenta.label" default="Numero Cuenta" /></span>
					
						<span class="property-value" aria-labelledby="numeroCuenta-label"><g:fieldValue bean="${proveedorInstance}" field="numeroCuenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="proveedor.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${proveedorInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:proveedorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${proveedorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
