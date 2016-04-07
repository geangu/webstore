<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link controller="venta" action="crear"><i class="fa fa-money"></i> Crear Venta </g:link></li>
    </ul>
</div>

<table>
    <thead>
        <tr>
            <th>
                Vendedor
            </th>
            <th>
                Cliente
            </th>
            <th>
                Tipo
            </th>
            <th>
                Total
            </th>
        </tr>
    </thead>
    <g:each var="venta" in="${ventas}">
        <tr>
            <td>
                ${venta.vendedor.username}
            </td>
            <td>
                ${venta.cliente}
            </td>
            <td>
                ${venta.tipo}
            </td>
            <td>
                ${venta.total}
            </td>
        </tr>
    </g:each>
</table>
