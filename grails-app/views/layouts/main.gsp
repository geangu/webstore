<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title><g:layoutTitle default="WebStore"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">

	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<asset:stylesheet src="select2.min.css"/>

	<asset:javascript src="application.js"/>
	<style media="screen">
		select, textarea{
			width: 100%;
		}
		.navbar-brand>img {
		    display: inline-block;
		}
	</style>
	<g:layoutHead/>
</head>
<body>

	<div class="container">
		<h1 class="title"><asset:image src="favicon.png" width="48"/>&nbsp;&nbsp;&nbsp;WebStore</h1>
	</div>

	<sec:ifLoggedIn>
		<nav class="navbar navbar-default navbar-transparent">
			<div class="container">
				<div class="collapse navbar-collapse" id="navbar-main">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-main">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse" id="navbar-main">
						<ul class="nav navbar-nav navbar-right">
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<li><g:link controller="user"><i class="fa fa-user-plus"></i> Usuarios</g:link></li>
								<li><g:link controller="proveedor"><i class="fa fa-truck"></i> Proveedores</g:link></li>
								<li><g:link controller="categoria"><i class="fa fa-building"></i> Categoria</g:link></li>
								<li><g:link controller="producto"><i class="fa fa-clone"></i> Productos</g:link></li>
								<li><g:link controller="zona"><i class="fa fa-map-marker"></i> Zona</g:link></li>
							</sec:ifAllGranted>

							<li><g:link controller="cliente"><i class="fa fa-users"></i> Clientes</g:link></li>
							<li><g:link controller="pago"><i class="fa fa-money"></i> Pago</g:link></li>
							<li><g:link controller="venta" action="detalles"><i class="fa fa-shopping-bag"></i> Ventas </g:link></li>
							<li><a href="#" onclick="location.href='${createLink(controller:'logout')}';"><i class="fa fa-sign-out"></i> Salir</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		</sec:ifLoggedIn>

		<div class="container">
			<g:layoutBody/>
			<div class="text-center">
				Developed by <a href="http://twitter.com/geangu">@geangu</a> 2016©
			</div>
		</div>

		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<asset:javascript src="select2.min.js"/>
		<asset:javascript src="zebra_datepicker.js"/>
		<script>
			$('select').select2();
			$('input[type="date"]').Zebra_DatePicker();
		</script>
	</body>
</html>
