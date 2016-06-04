<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido a Hogar y Estilo</title>
	</head>
	<body>

		<div class="col-sm-12">
			<h3>Bienvenido <sec:username /></h3>
			<hr>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div id="homeCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#homeCarousel" data-slide-to="1"></li>
							<li data-target="#homeCarousel" data-slide-to="2"></li>
							<li data-target="#homeCarousel" data-slide-to="3"></li>
					    </ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<asset:image src="home.jpeg" style="width: 100%;" />
							</div>
							<div class="item">
								<asset:image src="home-2.jpeg" style="width: 100%;" />
							</div>
							<div class="item">
								<asset:image src="home-3.jpeg" style="width: 100%;" />
							</div>
							<div class="item">
								<asset:image src="home-4.jpeg" style="width: 100%;" />
							</div>
		    			</div>
						<a class="left carousel-control" href="#homeCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#homeCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>

		</div>

		<g:each var="p" in="${webstore.Producto.list()}">
			<g:if test="${p.almacen < 3}">
				<script>
					$.notify("Quedan solo ${p.almacen} unidades del producto ${p}", "warn");
				</script>
			</g:if>
		</g:each>
		<g:set var="pagosMora"><g:include controller="compra" action="pagosMora"/></g:set>
		<g:if test="${pagosMora!='0'}">
			<script>
				$.notify("A la fecha se presentan ${pagosMora} pagos a proveedores en mora", "error");
			</script>
		</g:if>
		<g:set var="clientesMora"><g:include controller="cliente" action="clientesMora"/></g:set>
		<g:if test="${clientesMora!='0'}">
			<script>
				$.notify("A la fecha se presentan ${clientesMora} clientes en mora", "error");
			</script>
		</g:if>

	</body>
</html>
