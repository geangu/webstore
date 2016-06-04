
<%@ page import="webstore.Fiador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fiador.label', default: 'Fiador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fiador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fiador" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fiador">
			
				<g:if test="${fiadorInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="fiador.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${fiadorInstance?.cliente?.id}">${fiadorInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fiadorInstance?.documento}">
				<li class="fieldcontain">
					<span id="documento-label" class="property-label"><g:message code="fiador.documento.label" default="Documento" /></span>
					
						<span class="property-value" aria-labelledby="documento-label"><g:fieldValue bean="${fiadorInstance}" field="documento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fiadorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="fiador.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${fiadorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fiadorInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="fiador.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${fiadorInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fiadorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="fiador.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${fiadorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fiadorInstance?.zona}">
				<li class="fieldcontain">
					<span id="zona-label" class="property-label"><g:message code="fiador.zona.label" default="Zona" /></span>
					
						<span class="property-value" aria-labelledby="zona-label"><g:link controller="zona" action="show" id="${fiadorInstance?.zona?.id}">${fiadorInstance?.zona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:fiadorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${fiadorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
