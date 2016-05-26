<!doctype html>
<html class="no-js" lang="">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		<s2ui:stylesheet src='spring-security-ui'/>
		<asset:stylesheet src="main.css"/>
		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner">
			<a href="${resource(file:'/')}"><asset:image src="grails_logo.png" alt="Hogar y Estilo"/></a>
		</div>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="user" action="search"><g:message code="default.list.label" args="['Usuario']" /></g:link></li>
				<li><g:link class="create" controller="user" action="create"><g:message code="default.new.label" args="['Usuario']" /></g:link></li>
			</ul>
		</div>
		<div>
			<div>
				<div id='s2ui_header_body'>
					<div id='s2ui_header_title'><g:message code='spring.security.ui.defaultTitle'/></div>
					<g:render template='/includes/ajaxLogin'/>
				</div>
			</div>
			<div id="s2ui_main">
				<div id="s2ui_content">
					<g:layoutBody/>
				</div>
			</div>
		</div>
		<asset:javascript src='spring-security-ui.js'/>
		<s2ui:showFlash/>
		<s2ui:deferredScripts/>
		<hr>
		<div class="footer" role="contentinfo">
			Developed by
			<a href="http://twitter.com/geangu">@geangu</a> 2016©
		</div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
