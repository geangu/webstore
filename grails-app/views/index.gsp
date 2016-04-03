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
				<li><g:link controller="proveedor"><i class="fa fa-truck"></i> Proveedores</g:link></li>
				<li><g:link controller="categoria"><i class="fa fa-building"></i> Categoria</g:link></li>
				<li><g:link controller="producto"><i class="fa fa-th-list"></i> Productos</g:link></li>
				<li><g:link controller="cliente"><i class="fa fa-user"></i> Clientes</g:link></li>
				<li><g:link controller="salir"><i class="fa fa-sign-out"></i> Salir</g:link></li>
			</ul>
		</div>

		<div class="home">
			<h1 class="title">Hogar y Estilo</h1>
			<hr>
			<br>
			<asset:image src="home.jpeg" style="width: 100%;" />
		</div>

	</body>
</html>
