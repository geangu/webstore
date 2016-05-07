<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido a Hogar y Estilo</title>
		<style media="screen">
			.home {
				min-height: 150px;
				margin: 2em;
			}
		</style>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<li><g:link controller="user"><i class="fa fa-user-plus"></i> Usuarios</g:link></li>
					<!-- <li><g:link controller="proveedor"><i class="fa fa-truck"></i> Proveedores</g:link></li> -->
					<li><g:link controller="categoria"><i class="fa fa-building"></i> Categoria</g:link></li>
					<li><g:link controller="producto"><i class="fa fa-clone"></i> Productos</g:link></li>
					<li><g:link controller="zona"><i class="fa fa-map-marker"></i> Zona</g:link></li>
				</sec:ifAllGranted>

				<li><g:link controller="cliente"><i class="fa fa-users"></i> Clientes</g:link></li>
				<li><g:link controller="pago"><i class="fa fa-money"></i> Pago</g:link></li>

				<sec:ifAllGranted roles="ROLE_ADMIN">
					<li><g:link controller="venta" action="detalles"><i class="fa fa-th-list"></i> Ventas </g:link></li>
				</sec:ifAllGranted>
				<sec:ifAllGranted roles="ROLE_USER">
					<li><g:link controller="venta" action="detalles"><i class="fa fa-shopping-bag"></i> Ventas </g:link></li>
				</sec:ifAllGranted>

				<li><a href="#" onclick="location.href='${createLink(controller:'logout')}';"><i class="fa fa-sign-out"></i> Salir</a></li>
			</ul>
		</div>

		<div class="home">
			<h1 class="title">Bienvenido <sec:username /></h1>
			<hr>
			<br>
			<asset:image src="home.jpeg" style="width: 100%;" />
		</div>
		<g:each var="p" in="${hogaryestilo.Producto.list()}">
			<g:if test="${p.almacen < 3}">
				<script>
					$.notify("Quedan solo ${p.almacen} unidades del producto ${p}", "warn");
				</script>
			</g:if>
		</g:each>
	</body>
</html>
