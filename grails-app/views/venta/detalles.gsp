<meta name="layout" content="main">

<div class="pull-right">
    <g:if test="${venta.id}">
        <g:if test="${venta.tipo=='Contado'}">
            <g:link class="btn btn-primary" controller="venta" action="cerrar" id="${venta.id}"><i class="fa fa-money"></i> Cerrar Venta </g:link>
        </g:if>
        <g:if test="${venta.tipo=='Crédito'||venta.tipo=='Credicontado'}">
            <g:link class="btn btn-primary" controller="venta" action="credito" id="${venta.id}"><i class="fa fa-money"></i> Crear Crédito </g:link>
        </g:if>
        <g:link class="btn btn-danger" controller="venta" action="descartar" id="${venta.id}"><i class="fa fa-trash"></i> Descartar Venta </g:link>
    </g:if>
    <g:else>
        <g:link class="btn btn-danger" controller="venta" action="lista"><i class="fa fa-list"></i> Lista </g:link>
        <a class="btn btn-primary" onclick="crearExcelVentasDia()">Reporte Ventas del día</a>
    </g:else>
</div>

<h2>Detalles de Venta ${venta.orden}</h2>
<hr>

<g:if test="${venta.id}">
    <table class="table table-striped table-hover">
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

    <g:form controller="venta" action="anadir" id="${venta.id}">
        <table class="table table-striped table-hover">
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
                        <g:select class="form-control" name="productoId" from="${webstore.Producto.list()}"
                            optionKey="id" class="many-to-one" noSelection="['null': '']"/>
                    </td>
                    <td>
                        <input class="form-control" type="number" name="cantidad">
                    </td>
                    <td>
                        <input class="btn btn-success" type="submit" value="Añadir">
                    </td>
                </tr>
            </tbody>
        </table>
    </g:form>

    <table class="table table-striped table-hover">
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
                <g:set var="precio">${venta.tipo=='Contado' || venta.tipo=='Credicontado'?d.producto.precioContado:d.producto.precioCredito}</g:set>
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
                        <g:link class="btn btn-sm btn-default" action="quitar" id="${venta.id}" params="[productoId: d.producto.id]">Quitar</g:link>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>

</g:if>
<g:else>
    <g:form controller="venta" action="guardar">
        <fieldset class="form">

            <div class="form-group">
                <label for="orden">
                    <g:message code="venta.orden.label" default="Orden" />
                    <span class="required-indicator">*</span>
                </label>
                <input class="form-control" type="number" name="orden">
            </div>

            <div class="form-group">
                <label for="fecha">
                    <g:message code="venta.fecha.label" default="Fecha" />
                    <span class="required-indicator">*</span>
                </label>
                <input class="form-control" type="date" name="fecha" value="${new Date().format('yyyy-MM-dd')}">
            </div>

            <div class="form-group">
                <label for="tipo">
                    <g:message code="venta.tipo.label" default="Tipo" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select class="form-control" name="tipo" from="${venta?.constraints?.tipo?.inList}" value="${venta?.tipo}"/>
            </div>

            <div class="form-group">
                <label for="cliente">
                    <g:message code="venta.cliente.label" default="Cliente" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select class="form-control" id="cliente" name="clienteId" from="${webstore.Cliente.list()}" optionKey="id" required="" value="${venta?.cliente?.id}" class="many-to-one"/>
            </div>

            <div class="form-group ">
                <label for="observaciones">
                    <g:message code="venta.observaciones.label" default="Observaciones" />
                </label>
                <g:textArea class="form-control" name="observaciones" value="${venta?.observaciones}"/>
            </div>
        </fieldset>
        <fieldset class="text-center">
            <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</g:else>
<g:render template="crearExcelVentasDiaScript" />
