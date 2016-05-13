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
            <th>Cuota</th>
            <th>Fecha Cuota</th>
            <th>Fecha Pago</th>
            <th>Valor</th>
        </thead>
        <tbody>
            <g:each var="cuota" in="${credito.cuotas.sort{it.numero}}" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${cuota.numero}</td>
                    <td>${cuota.fecha.format('yyyy-MM-dd')}</td>
                    <td>${cuota.fechaPago?.format('yyyy-MM-dd')}</td>
                    <td style="text-align: right;">
                        <g:formatNumber number="${cuota.valor}" format="\$###,##0" />
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>

    <fieldset class="buttons">
        <a class="print" onclick="window.print();return;">Imprimir</button>
    </fieldset>
</g:form>
