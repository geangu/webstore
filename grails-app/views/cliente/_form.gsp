<%@ page import="hogaryestilo.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'documento', 'error')} ">
	<label for="documento">
		<g:message code="cliente.documento.label" default="Documento" />
		
	</label>
	<g:textField name="documento" value="${clienteInstance?.documento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${clienteInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${clienteInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="cliente.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${clienteInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'zona', 'error')} ">
	<label for="zona">
		<g:message code="cliente.zona.label" default="Zona" />
		
	</label>
	<g:select id="zona" name="zona.id" from="${hogaryestilo.Zona.list()}" optionKey="id" value="${clienteInstance?.zona?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

