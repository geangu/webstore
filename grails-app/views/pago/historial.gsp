<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="search" href="${createLink(action: 'index')}">Buscar</a></li>
        <g:if test="${credito.saldo > 0}">
            <li>
                <a class="save" href="${createLink(action:'buscar',params:[creditoId:credito.id])}">
                    <i class="fa fa-money"></i>  ${message(code: 'default.button.create.label')}
                </a>
            </li>
        </g:if>
    </ul>
</div>

<g:form name="name">

    <fieldset class="form">
        <input type="hidden" name="creditoId" value="${credito.id}"/>
        <div class="fieldcontain">
            <label for="credito">Número Orden</label>
            <input name="credito" value="${credito.venta.orden}" type="text" readonly="true" disabled="true"/>
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
            <th>Valor</th>
            <th>Fecha Pago</th>
            <th>Valor Pagado</th>
        </thead>
        <tbody>
            <g:each var="cuota" in="${credito.cuotas.sort{it.numero}}" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${cuota.numero}</td>
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

    <fieldset class="buttons">
        <a class="print" onclick="window.print();return;">Imprimir</button>
    </fieldset>
</g:form>
