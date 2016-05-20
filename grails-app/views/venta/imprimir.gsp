<p style="font-size: 1.3em; text-align: center;">
    Su número para pagos es: <strong>${credito?.id}</strong>
</p>
<br>
<br>
<table style="width: 100">
    <tr>
        <td style="text-align:right;"><strong>Fecha</strong></td>
        <td>${venta.fecha.format('yyyy-MM-dd')}</td>
    </tr>
    <tr>
        <td style="text-align:right;"><strong>Tipo</strong></td>
        <td>${venta.tipo}</td>
    </tr>
    <tr>
        <td style="text-align:right;"><strong>Cliente</strong></td>
        <td>${venta.cliente}</td>
    </tr>
    <g:if test="${venta.observaciones}">
        <tr>
            <td style="text-align:right;"><strong>Observaciones</strong></td>
            <td>${venta.observaciones}</td>
        </tr>
    </g:if>
    <tr>
        <td style="text-align:right;"><strong>Total</strong></td>
        <td>
            <g:formatNumber number="${venta.total}" format="\$###,##0" />
        </td>
    </tr>
</table>

<table>
    <thead>
        <tr>
            <th>Item</th>
            <th>Producto</th>
            <th>Precio unitario</th>
            <th>Cantidad</th>
            <th>Total</th>
        </tr>
    </thead>
    <tbody>
        <g:each var="d" in="${venta.detalles}" status="i">
            <g:set var="precio">${venta.tipo=='Contado'?d.producto.precioContado:d.producto.precioCredito}</g:set>
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
            </tr>
        </g:each>
    </tbody>
</table>
