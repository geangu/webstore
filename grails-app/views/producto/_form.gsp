<%@ page import="webstore.Producto" %>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'referencia', 'error')} required">
	<label for="referencia">
		<g:message code="producto.referencia.label" default="Referencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="referencia" required="" value="${productoInstance?.referencia}"/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nombre" required="" value="${productoInstance?.nombre}"/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />

	</label>
	<g:textField class="form-control" name="descripcion" value="${productoInstance?.descripcion}"/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'precioCompra', 'error')} required">
	<label for="precioCompra">
		<g:message code="producto.precioCompra.label" default="Precio Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="precioCompra" type="number" value="${productoInstance.precioCompra}" required=""/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'precioContado', 'error')} required">
	<label for="precioContado">
		<g:message code="producto.precioContado.label" default="Precio Contado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="precioContado" type="number" value="${productoInstance.precioContado}" required=""/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'precioCredito', 'error')} required">
	<label for="precioCredito">
		<g:message code="producto.precioCredito.label" default="Precio Credito" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="precioCredito" type="number" value="${productoInstance.precioCredito}" required=""/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="producto.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" class="form-control" name="categoria.id" from="${webstore.Categoria.list()}" optionKey="id" required="" value="${productoInstance?.categoria?.id}" class="many-to-one"/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="producto.observaciones.label" default="Observaciones" />

	</label>
	<g:textField class="form-control" name="observaciones" value="${productoInstance?.observaciones}"/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'almacen', 'error')} required">
	<label for="almacen">
		<g:message code="producto.almacen.label" default="Almacen" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="almacen" type="number" value="${productoInstance.almacen}" required=""/>

</div>

<div class="form-group ${hasErrors(bean: productoInstance, field: 'vendidos', 'error')} required">
	<label for="vendidos">
		<g:message code="producto.vendidos.label" default="Vendidos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="vendidos" type="number" value="${productoInstance.vendidos}" required=""/>

</div>
