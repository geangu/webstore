<meta name="layout" content="main">

<div class="text-right">
    <a class="btn btn-primary" href="${createLink(action: 'index')}">Buscar por número de orden o cédula de cliente</a>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>

<h2>Listado de créditos</h2>
<hr>
<div class="form-group">
    <label>Cliente</label>
    <g:textField name="cliente" value="${cliente}" class="form-control" readonly="true"/>
</div>
<hr>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Numero Orden</th>
            <th>Fecha</th>
            <th>Saldo</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <g:each var="credito" in="${creditos}">
            <tr>
                <td>${credito.venta.orden}</td>
                <td>${credito.fecha}</td>
                <td>${credito.saldo}</td>
                <td>
                    <a class="btn btn-sm btn-default" href="${createLink(controller:'pago', action:'buscar', params:[creditoId:credito.id])}">Pagar</a>
                    <a class="btn btn-sm btn-default" href="${createLink(controller:'pago', action:'historial', params:[creditoId:credito.id])}">Historial</a>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
