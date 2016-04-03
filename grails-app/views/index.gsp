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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	</head>
	<body>

		<div class="nav" role="navigation">
			<ul>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<li><g:link controller="user"><i class="fa fa-user-plus"></i> Usuarios</g:link></li>
					<li><g:link controller="proveedor"><i class="fa fa-truck"></i> Proveedores</g:link></li>
					<li><g:link controller="categoria"><i class="fa fa-building"></i> Categoria</g:link></li>
				</sec:ifAllGranted>
				<li><g:link controller="venta"><i class="fa fa-th-list"></i> Ventas </g:link></li>
				<li><g:link controller="producto"><i class="fa fa-th-list"></i> Productos</g:link></li>
				<li><g:link controller="cliente"><i class="fa fa-users"></i> Clientes</g:link></li>
				<li><a href="#" onclick="location.href='${createLink(controller:'logout')}';"><i class="fa fa-sign-out"></i> Salir</a></li>
			</ul>
		</div>

		<div class="home">
			<h1 class="title">Bienvenido <sec:username /></h1>
			<hr>
			<br>
			<asset:image src="home.jpeg" style="width: 100%;" />
		</div>

	</body>
</html>
