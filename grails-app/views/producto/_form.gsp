<%@ page import="hogaryestilo.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'referencia', 'error')} required">
	<label for="referencia">
		<g:message code="producto.referencia.label" default="Referencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="referencia" required="" value="${productoInstance?.referencia}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${productoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${productoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="producto.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" type="number" value="${productoInstance.precio}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'precioCredito', 'error')} required">
	<label for="precioCredito">
		<g:message code="producto.precioCredito.label" default="Precio Credito" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioCredito" type="number" value="${productoInstance.precioCredito}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="producto.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${hogaryestilo.Categoria.list()}" optionKey="id" required="" value="${productoInstance?.categoria?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="producto.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${productoInstance?.observaciones}"/>

</div>

