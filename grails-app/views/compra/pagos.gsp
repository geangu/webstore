<meta name="layout" content="main">

<div class="text-right">
    <g:link class="btn btn-primary" action="index">Compras</g:link>
    <g:if test="${compra.saldo > 0}">
        <g:link class="btn btn-primary" action="pagar" id="${compra.id}">Pagar</g:link>
    </g:if>
</div>

<div>
    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <h2>Detalles compra ${compra?.orden}</h2>
    <hr>
    <form>
        <div class="form-group">
            <label id="fecha-label" class="property-label"><g:message code="compra.fecha.label" default="Fecha Compra" /></label>
            <input class="form-control" readonly="true" value="${compra?.fecha?.format('dd-MM-yyyy')}" />
        </div>
        <div class="form-group">
            <label id="proveedor-label" class="property-label"><g:message code="compra.proveedor.label" default="Proveedor" /></label>
            <input class="form-control" readonly="true" value="${compra?.proveedor}" />
        </div>
        <div class="form-group">
            <label id="total-label" class="property-label"><g:message code="compra.total.label" default="Total" /></label>
            <input class="form-control" readonly="true" value="${compra?.total}" />
        </div>
        <div class="form-group">
            <label id="saldo-label" class="property-label"><g:message code="compra.saldo.label" default="Saldo" /></label>
            <input class="form-control" readonly="true" value="${compra?.saldo}" />
        </div>
        <g:if test="${compra.observaciones}">
            <div class="form-group">
                <label id="observaciones-label" class="property-label"><g:message code="compra.observaciones.label" default="Observaciones" /></label>
                <input class="form-control" readonly="true" value="${compra?.observaciones}" />
            </div>
        </g:if>
    </form>
</div>

<table class="table table-striped table-hover">
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
