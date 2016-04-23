<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="search" href="${createLink(action: 'index')}">Buscar</a></li>
    </ul>
</div>

<g:form name="name">

    <fieldset class="form">
        <input type="hidden" name="creditoId" value="${credito.id}"/>
        <div class="fieldcontain">
            <label for="credito">Número Credito</label>
            <input name="credito" value="${credito.id}" type="text" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="cliente">Cliente</label>
            <input name="cliente" value="${credito.venta.cliente}" type="text" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="total">Total Credito</label>
            <input name="total" value="${credito.total}" type="number" readonly="true" disabled="true"/>
        </div>
        <div class="fieldcontain">
            <label for="saldo">Saldo Pendiente</label>
            <input name="saldo" value="${credito.saldo}" type="number" readonly="true" disabled="true"/>
        </div>
    </fieldset>

    <table style="width: 90%; margin: 1em auto; border: 1px solid lightgray;">
        <thead>
            <th>Item</th>
            <th>Fecha</th>
            <th>Tipo Pago</th>
            <th>Valor</th>
        </thead>
        <tbody>
            <g:each var="pago" in="${credito.pagos.sort{it.fecha}}" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${i+1}</td>
                    <td>${pago.fecha.format('yyyy-MM-dd HH:mm:ss a')}</td>
                    <td>${pago.tipoPago}</td>
                    <td style="text-align: right;"><g:formatNumber number="${pago.valor}" format="\$###,##0" /></td>
                </tr>
            </g:each>
        </tbody>
    </table>

    <fieldset class="buttons">
        <a class="print" onclick="window.print();return;">Imprimir</button>
    </fieldset>
</g:form>
