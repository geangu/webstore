<meta name="layout" content="main">

<div class="pull-right">
    <a class="btn btn-primary" href="${createLink(action: 'index')}">Buscar por número de orden o cédula de cliente</a>
    <g:if test="${credito.saldo > 0}">
        <a class="btn btn-primary" href="${createLink(action:'buscar',params:[creditoId:credito.id])}">
            Pagar Orden ${credito.venta.orden}
        </a>
    </g:if>
</div>

<h2>Historial Orden ${credito.venta.orden}</h2>
<hr>

<g:form name="name">

    <fieldset class="form">
        <input type="hidden" name="creditoId" value="${credito.id}"/>
        <div class="form-group">
            <label for="cliente">Cliente</label>
            <input name="cliente" value="${credito.venta.cliente}" type="text" readonly="true" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="total">Total Credito</label>
            <input name="total" value="${credito.total}" type="number" readonly="true" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="saldo">Saldo Pendiente</label>
            <input name="saldo" value="${credito.saldo}" type="number" readonly="true" class="form-control"/>
        </div>
    </fieldset>
    <hr>

    <table class="table table-striped table-hover">
        <thead>
            <th>Cuota</th>
            <th>Recibo</th>
            <th>Fecha Cuota</th>
            <th>Valor</th>
            <th>Fecha Pago</th>
            <th>Valor Pagado</th>
        </thead>
        <tbody>
            <g:each var="cuota" in="${credito.cuotas.sort{it.numero}}" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${cuota.numero}</td>
                    <td>${cuota.recibo}</td>
                    <td>${cuota.fecha.format('yyyy-MM-dd')}</td>
                    <td><g:formatNumber number="${cuota.valor}" format="\$###,##0" /></td>
                    <td>${cuota.fechaPago?.format('yyyy-MM-dd')}</td>
                    <td style="text-align: right;">
                        <g:formatNumber number="${cuota.valorPago}" format="\$###,##0" />
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <div class="text-center">
        <a class="btn btn-primary" onclick="window.print();return;">Imprimir</a>
    </div>
</g:form>
