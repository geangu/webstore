<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <g:if test="${venta.id}">
            <li><g:link controller="venta" action="descartar" id="${venta.id}"><i class="fa fa-trash"></i> Descartar Venta </g:link></li>
        </g:if>
    </ul>
</div>


<g:form controller="credito" action="crear">

    <input type="hidden" name="venta.id" value="${venta.id}" />
    <input type="hidden" name="fecha" value="${venta.fecha}" />
    <input type="hidden" name="saldo" value="${venta.total}" />

    <fieldset class="form">

        <div class="fieldcontain required">
            <label for="fecha">
                <g:message code="venta.fecha.label" default="Fecha" />
            </label>
            <g:textField name="fechas" value="${formatDate(number: venta.fecha, format:'yyyy-MM-dd')}" />
        </div>

        <div class="fieldcontain required">
            <label for="total">
                <g:message code="venta.total.label" default="Total" />
            </label>
            <input name="total" value="${venta.total}" type="number"/>
        </div>

        <div class="fieldcontain required">
            <label for="valorCuota">
                <g:message code="venta.valorCuota.label" default="Valor Cuota" />
                <span class="required-indicator">*</span>
            </label>
            <input id="valorCuota" name="valorCuota" value="${venta.total/12}" readonly="true" type="number"/>
        </div>

        <div class="fieldcontain required">
            <label for="cuotas">
                <g:message code="venta.cuotas.label" default="Cuotas" />
                <span class="required-indicator">*</span>
            </label>
            <input name="cuotas" value="12" onkeyup="$('#valorCuota').val(${venta.total}/this.value);" type="number"/>
        </div>

    </fieldset>

    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>

</g:form>
