<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link controller="venta" action="cerrar" id="${venta.id}"><i class="fa fa-money"></i> Cerrar Venta </g:link></li>
        <li><g:link controller="venta" action="descartar" id="${venta.id}"><i class="fa fa-trash"></i> Descartar Venta </g:link></li>
    </ul>
</div>

<table>
    <tr>
        <td style="text-align:right;"><strong>Fecha</strong></td>
        <td>${venta.fecha.format('yyyy-MM-dd')}</td>
    </tr>
    <tr>
        <td style="text-align:right;"><strong>Cliente</strong></td>
        <td>${venta.cliente}</td>
    </tr>
    <tr>
        <td style="text-align:right;"><strong>Total</strong></td>
        <td>
            <g:formatNumber number="${venta.total}" format="\$###,##0" />
        </td>
    </tr>
</table>

<g:form controller="venta" action="anadir" id="${venta.id}">
    <table>
        <thead>
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <g:select name="productoId" from="${hogaryestilo.Producto.list()}"
                        optionKey="id" class="many-to-one" noSelection="['null': '']"/>
                </td>
                <td>
                    <input type="number" name="cantidad">
                </td>
                <td>
                    <input type="submit" value="Añadir">
                </td>
            </tr>
        </tbody>
    </table>
</g:form>

<table>
    <thead>
        <tr>
            <th>Item</th>
            <th>Producto</th>
            <th>Precio unitario</th>
            <th>Cantidad</th>
            <th>Total</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <g:each var="d" in="${venta.detalles}" status="i">
            <g:set var="precio">${venta.tipo=='Contado'?d.producto.precio:d.producto.precioCredito}</g:set>
            <tr>
                <td>${i+1}</td>
                <td>${d.producto}</td>
                <td>
                    <g:formatNumber number="${Long.parseLong(precio.toString())}" format="\$###,##0" />
                </td>
                <td>${d.cantidad}</td>
                <td>
                    <g:formatNumber number="${Long.parseLong(precio.toString()) * d.cantidad}" format="\$###,##0" />
                </td>
                <td>
                    <g:link action="quitar" id="${venta.id}" params="[productoId: d.producto.id]">Quitar</g:link>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
