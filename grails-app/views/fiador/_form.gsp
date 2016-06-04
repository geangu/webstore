<%@ page import="webstore.Fiador" %>

<div class="form-group ${hasErrors(bean: fiadorInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="fiador.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" class="form-control" name="cliente.id" from="${webstore.Cliente.list()}" optionKey="id" required="" value="${fiadorInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="form-group ${hasErrors(bean: fiadorInstance, field: 'documento', 'error')} required">
	<label for="documento">
		<g:message code="fiador.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="documento" required="" value="${fiadorInstance?.documento}"/>

</div>

<div class="form-group ${hasErrors(bean: fiadorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="fiador.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nombre" required="" value="${fiadorInstance?.nombre}"/>

</div>

<div class="form-group ${hasErrors(bean: fiadorInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="fiador.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="telefono" required="" value="${fiadorInstance?.telefono}"/>

</div>

<div class="form-group ${hasErrors(bean: fiadorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="fiador.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="direccion" required="" value="${fiadorInstance?.direccion}"/>

</div>

<div class="form-group ${hasErrors(bean: fiadorInstance, field: 'zona', 'error')} ">
	<label for="zona">
		<g:message code="fiador.zona.label" default="Zona" />

	</label>
	<g:select id="zona" class="form-control" name="zona.id" from="${webstore.Zona.list()}" optionKey="id" value="${fiadorInstance?.zona?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>
