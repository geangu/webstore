<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>

<table>
    <thead>
        <th>Cliente</th>
    </thead>
    <tbody>
        <tr>
            <td>${cliente}</td>
        </tr>
    </tbody>
</table>
<hr>
<table>
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
                    <a href="${createLink(controller:'pago', action:'buscar', params:[creditoId:credito.id])}">Ver</a>
                    <a class="home" href="${createLink(controller:'pago', action:'historial', params:[creditoId:credito.id])}">Historial</a>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
