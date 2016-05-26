<%@ page import="hogaryestilo.Cliente" %>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'documento', 'error')} required">
	<label for="documento">
		<g:message code="cliente.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="documento" required="" value="${clienteInstance?.documento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${clienteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${clienteInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="cliente.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${clienteInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'zona', 'error')} required">
	<label for="zona">
		<g:message code="cliente.zona.label" default="Zona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="zona" name="zona.id" from="${hogaryestilo.Zona.list()}" optionKey="id" required="" value="${clienteInstance?.zona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'fiador', 'error')} required">
	<label for="fiador">
		<g:message code="cliente.fiador.label" default="Fiador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fiador" name="fiador.id" from="${hogaryestilo.Fiador.list()}" optionKey="id" required="" value="${clienteInstance?.fiador?.id}" class="many-to-one"/>
</div>
