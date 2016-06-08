<%@ page import="webstore.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>

		<div id="list-venta" class="col-sm-12">
			<div class="pull-right">
                <g:link class="btn btn-primary" action="detalles"><i class="fa fa-plus"></i> Nueva Venta</g:link>
				<filterpane:filterButton class="btn btn-primary"/>
			</div>
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<div>
				<p>
					<filterpane:filterPane domain="Venta" excludeProperties="fecha,total,cerrada,observaciones"/>
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
                        <g:sortableColumn property="orden" title="${message(code: 'venta.orden.label', default: 'Orden')}" />
                        <g:sortableColumn property="fecha" title="${message(code: 'venta.fecha.label', default: 'Fecha')}" />
                        <g:sortableColumn property="tipo" title="${message(code: 'venta.tipo.label', default: 'Tipo')}" />
                        <g:sortableColumn property="total" title="${message(code: 'venta.total.label', default: 'Total')}" />
                        <g:sortableColumn property="cliente.id" title="${message(code: 'venta.cliente.label', default: 'Cliente')}" />
                        <th>Acciones</th>
					</tr>
				</thead>
				<tbody>
    				<g:each in="${ventaInstanceList}" status="i" var="ventaInstance">
    					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${ventaInstance.orden}</td>
                            <td>${ventaInstance.fecha.format('dd-MM-yyyy')}</td>
                            <td>${ventaInstance.tipo}</td>
							<td>${ventaInstance.total}</td>
                            <td>${ventaInstance.cliente.nombre}</td>
                            <td>
								<g:link class="btn btn-xs btn-default" action="detalle" id="${ventaInstance.id}">
                                    <i class="fa fa-eye"></i> Detalles
                                </g:link>
                                <g:link class="btn btn-xs btn-danger" action="borrar" id="${ventaInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                    <i class="fa fa-remove"></i> Borrar
                                </g:link>
                            </td>
                        </tr>
    				</g:each>
				</tbody>
			</table>
			<div class="pagination pagination-sm">
				<g:paginate total="${ventaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
