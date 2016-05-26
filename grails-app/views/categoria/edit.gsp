<%@ page import="hogaryestilo.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-categoria" class="content scaffold-edit" role="main">
			<h3><g:message code="default.edit.label" args="[entityName]" /></h3>
			<hr>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${categoriaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${categoriaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:categoriaInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${categoriaInstance?.version}" />
				<g:render template="form"/>
				<button type="submit" class="btn waves-effect right">
					<i class="fa fa-floppy-o" aria-hidden="true"></i> ${message(code: 'default.button.update.label', default: 'Update')}
				</button>
			</g:form>
		</div>
		<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
			<g:link action="index" class="btn-floating waves-effect btn-large red"><i class="fa fa-list" aria-hidden="true"></i></g:link>
		</div>
	</body>
</html>
