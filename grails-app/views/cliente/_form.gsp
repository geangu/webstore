<%@ page import="webstore.Cliente" %>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'documento', 'error')} required">
	<label for="documento">
		<g:message code="cliente.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="documento" required="" value="${clienteInstance?.documento}"/>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nombre" required="" value="${clienteInstance?.nombre}"/>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="telefono" required="" value="${clienteInstance?.telefono}"/>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="cliente.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="direccion" required="" value="${clienteInstance?.direccion}"/>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'zona', 'error')} required">
	<label for="zona">
		<g:message code="cliente.zona.label" default="Zona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="zona" class="form-control" name="zona.id" from="${webstore.Zona.list()}" optionKey="id" required="" value="${clienteInstance?.zona?.id}" class="many-to-one"/>
</div>

<div class="form-group ${hasErrors(bean: clienteInstance, field: 'fiador', 'error')} required">
	<label for="fiador">
		<g:message code="cliente.fiador.label" default="Fiador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fiador" class="form-control" name="fiador.id" from="${webstore.Fiador.list()}" optionKey="id" value="${clienteInstance?.fiador?.id}" class="many-to-one"
		noSelection="['0':'Seleccione']" />
</div>
