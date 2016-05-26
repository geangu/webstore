<%@ page import="hogaryestilo.Categoria" %>



<div class="row">
	<div class="input-field col s12">
		<g:textField name="nombre" class="validate" required="" value="${categoriaInstance?.nombre}"/>
		<label for="nombre">
			<g:message code="categoria.nombre.label" default="Nombre" />
			<span class="required-indicator">*</span>
		</label>
	</div>
</div>


<div class="row">
	<div class="input-field col s12">
		<g:textField name="descripcion" class="validate" required="" value="${categoriaInstance?.descripcion}"/>
		<label for="descripcion">
			<g:message code="categoria.descripcion.label" default="Descripcion" />
		</label>
	</div>
</div>
