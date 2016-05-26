<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<asset:stylesheet src="application.css"/>
		<asset:stylesheet src="select2.min.css"/>
		<asset:javascript src="application.js"/>
		<style media="screen">
			select, textarea {
				width: 100%;
			}
			.brand-logo {
				padding: 0 1em !important;
			}
			.button-collapse {
				padding: 0 1em;
			}
		</style>
		<g:layoutHead/>
	</head>
	<body>

		<div class="navbar-fixed">
			<nav class="green darken-2">
				<a href="${resource(file:'/')}" class="brand-logo">Hogar y Estilo</a>

				<ul class="right hide-on-med-and-down">
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<li><g:link controller="user"><i class="fa fa-user-plus"></i> Usuarios</g:link></li>
						<li><g:link controller="proveedor"><i class="fa fa-truck"></i> Proveedores</g:link></li>
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

				<ul id="slide-out" class="side-nav">
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<li><g:link controller="user"><i class="fa fa-user-plus"></i> Usuarios</g:link></li>
						<li><g:link controller="proveedor"><i class="fa fa-truck"></i> Proveedores</g:link></li>
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

				<a href="#" data-activates="slide-out" class="button-collapse">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</a>
			</nav>
		</div>

		<div class="container">
			<br>
			<g:layoutBody/>
			<br>
		</div>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
		<asset:javascript src="select2.min.js"/>
		<asset:javascript src="zebra_datepicker.js"/>
		<script>
			$('select').select2();
			$('input[type="date"]').Zebra_DatePicker();
			$(".button-collapse").sideNav();
		</script>
	</body>
</html>
