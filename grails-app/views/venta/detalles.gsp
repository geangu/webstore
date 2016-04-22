<meta name="layout" content="main">

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <g:if test="${venta.id}">
            <g:if test="${venta.tipo=='Contado'}">
                <li><g:link controller="venta" action="cerrar" id="${venta.id}"><i class="fa fa-money"></i> Cerrar Venta </g:link></li>
            </g:if>
            <g:if test="${venta.tipo=='Crédito'}">
                <li><g:link controller="venta" action="credito" id="${venta.id}"><i class="fa fa-money"></i> Crear Crédito </g:link></li>
            </g:if>
            <li><g:link controller="venta" action="descartar" id="${venta.id}"><i class="fa fa-trash"></i> Descartar Venta </g:link></li>
        </g:if>
    </ul>
</div>

<g:if test="${venta.id}">

    <table>
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

</g:if>
<g:else>
    <g:form controller="venta" action="guardar">
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="tipo">
                    <g:message code="venta.tipo.label" default="Tipo" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select name="tipo" from="${venta?.constraints?.tipo?.inList}" value="${venta?.tipo}"/>
            </div>

            <div class="fieldcontain required">
                <label for="cliente">
                    <g:message code="venta.cliente.label" default="Cliente" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="cliente" name="clienteId" from="${hogaryestilo.Cliente.list()}" optionKey="id" required="" value="${venta?.cliente?.id}" class="many-to-one"/>
            </div>

            <div class="fieldcontain ">
                <label for="observaciones">
                    <g:message code="venta.observaciones.label" default="Observaciones" />
                </label>
                <g:textArea name="observaciones" value="${venta?.observaciones}"/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</g:else>
