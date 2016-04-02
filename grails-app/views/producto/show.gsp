
<%@ page import="hogaryestilo.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-producto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list producto">
			
				<g:if test="${productoInstance?.referencia}">
				<li class="fieldcontain">
					<span id="referencia-label" class="property-label"><g:message code="producto.referencia.label" default="Referencia" /></span>
					
						<span class="property-value" aria-labelledby="referencia-label"><g:fieldValue bean="${productoInstance}" field="referencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="producto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="producto.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${productoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="producto.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productoInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.precioCredito}">
				<li class="fieldcontain">
					<span id="precioCredito-label" class="property-label"><g:message code="producto.precioCredito.label" default="Precio Credito" /></span>
					
						<span class="property-value" aria-labelledby="precioCredito-label"><g:fieldValue bean="${productoInstance}" field="precioCredito"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="producto.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${productoInstance}" field="categoria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="producto.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${productoInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
