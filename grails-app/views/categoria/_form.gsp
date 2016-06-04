<%@ page import="webstore.Categoria" %>

<div class="form-group ${hasErrors(bean: categoriaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="categoria.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nombre" required="" value="${categoriaInstance?.nombre}"/>
</div>

<div class="form-group ${hasErrors(bean: categoriaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="categoria.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descripcion" required="" value="${categoriaInstance?.descripcion}"/>
</div>
