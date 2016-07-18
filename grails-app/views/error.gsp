<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development2"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development2">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<div class="well">
				<h2><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Se ha presentado un error:</h2>
				<hr>
				<ul>
					<li><span class="alert alert-danger" style="font-size: 1.5em;">Revise que los valores ingresados sean válidos (número de orden, número de venta, etc.)</span></li>
				</ul>
				<hr>
				<div class="text-center">
					<button type="button" name="button" class="btn btn-lg btn-default" onclick="window.history.back();">Volver</button>
				</div>
			</div>
		</g:else>
	</body>
</html>
