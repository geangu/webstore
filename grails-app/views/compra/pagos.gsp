<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Pagos</g:link></li>
        <li><g:link class="create" action="pagar" id="${compra.id}">Pagar</g:link></li>
    </ul>
</div>

<div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list compra">
        <li class="fieldcontain">
            <label id="orden-label" class="property-label"><g:message code="compra.orden.label" default="Orden" /></label>
            <span class="property-value" aria-labelledby="orden-label">${compra?.orden}</span>
        </li>
        <li class="fieldcontain">
            <label id="fecha-label" class="property-label"><g:message code="compra.fecha.label" default="Fecha Compra" /></label>
            <span class="property-value" aria-labelledby="fecha-label">${compra?.fecha?.format('dd-MM-yyyy')}</span>
        </li>
        <li class="fieldcontain">
            <label id="proveedor-label" class="property-label"><g:message code="compra.proveedor.label" default="Proveedor" /></label>
            <span class="property-value" aria-labelledby="proveedor-label">${compra?.proveedor}</span>
        </li>
        <li class="fieldcontain">
            <label id="total-label" class="property-label"><g:message code="compra.total.label" default="Total" /></label>
            <span class="property-value" aria-labelledby="total-label">${compra?.total}</span>
        </li>
        <li class="fieldcontain">
            <label id="saldo-label" class="property-label"><g:message code="compra.saldo.label" default="Saldo" /></label>
            <span class="property-value" aria-labelledby="saldo-label">${compra?.saldo}</span>
        </li>
        <g:if test="${compra.observaciones}">
            <li class="fieldcontain">
                <label id="observaciones-label" class="property-label"><g:message code="compra.observaciones.label" default="Observaciones" /></label>
                <span class="property-value" aria-labelledby="observaciones-label">${compra?.observaciones}</span>
            </li>
        </g:if>
    </ol>
</div>

<table>
    <thead>
        <tr>
            <th>Número</th>
            <th>Fecha</th>
            <th>Valor</th>
            <th>Fecha Pago</th>
            <th>Valor Pago</th>
        </tr>
    </thead>
    <tbody>
        <g:each var="pago" in="${compra.pagos.sort{it.numero}}">
            <tr>
                <td>${pago.numero}</td>
                <td>${pago.fecha.format('dd-MM-yyyy')}</td>
                <td>${pago.valor}</td>
                <td>${pago.fechaPago?.format('dd-MM-yyyy')}</td>
                <td>${pago.valorPago}</td>
            </tr>
        </g:each>
    </tbody>
</table>
