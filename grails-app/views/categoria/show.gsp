
<%@ page import="hogaryestilo.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-categoria" class="content scaffold-show" role="main">
			<h3><g:message code="default.show.label" args="[entityName]" /></h3>
			<hr>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list categoria">

				<g:if test="${categoriaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="categoria.nombre.label" default="Nombre" /></span>

						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${categoriaInstance}" field="nombre"/></span>

				</li>
				</g:if>

				<g:if test="${categoriaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="categoria.descripcion.label" default="Descripcion" /></span>

						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${categoriaInstance}" field="descripcion"/></span>

				</li>
				</g:if>

			</ol>
		</div>

		<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
			<a class="btn-floating waves-effect btn-large red">
				<i class="fa fa-cog" aria-hidden="true"></i>
			</a>
			<ul>
				<li>
					<g:form url="[resource:categoriaInstance, action:'delete']" method="DELETE">
						<button type="submit" class="btn-floating red" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></button>
					</g:form>
				</li>
				<li><g:link action="edit" resource="${categoriaInstance}" class="btn-floating blue"><i class="fa fa-pencil" aria-hidden="true"></i></g:link></li>
				<li><g:link action="index" class="btn-floating yellow darken-1"><i class="fa fa-list" aria-hidden="true"></i></g:link></li>
			</ul>
		</div>
	</body>
</html>
