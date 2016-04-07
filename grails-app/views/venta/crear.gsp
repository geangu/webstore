<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link controller="cliente"><i class="fa fa-users"></i> Clientes</g:link></li>
    </ul>
</div>

<g:form controller="venta" action="guardar">

    <fieldset class="form">
        <div class="fieldcontain required">
            <label for="tipo">
                <g:message code="venta.tipo.label" default="Tipo" />
                <span class="required-indicator">*</span>
            </label>
            <g:select name="tipo" from="${venta?.constraints?.tipo?.inList}" value="${venta?.tipo}"/>
        </div>

        <div class="fieldcontain required">
        	<label for="cliente">
        		<g:message code="venta.cliente.label" default="Cliente" />
        		<span class="required-indicator">*</span>
        	</label>
        	<g:select id="cliente" name="clienteId" from="${hogaryestilo.Cliente.list()}" optionKey="id" required="" value="${venta?.cliente?.id}" class="many-to-one"/>
        </div>

        <div class="fieldcontain ">
        	<label for="observaciones">
        		<g:message code="venta.observaciones.label" default="Observaciones" />
        	</label>
        	<g:textArea name="observaciones" value="${venta?.observaciones}"/>
        </div>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>

</g:form>
