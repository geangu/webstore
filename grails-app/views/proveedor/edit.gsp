<%@ page import="webstore.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="text-right">
			<g:link class="btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div id="edit-proveedor" class="col-sm-12">
			<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${proveedorInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${proveedorInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form url="[resource:proveedorInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${proveedorInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="text-center">
					<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
