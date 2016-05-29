<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido a Hogar y Estilo</title>
	</head>
	<body>

		<div class="col-sm-12">
			<h3 class="title">Bienvenido <sec:username /></h3>
			<hr>
			<asset:image src="home.jpeg" style="width: 100%;" />
		</div>

		<g:each var="p" in="${hogaryestilo.Producto.list()}">
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
