<html>
	<head>
		<meta name="layout" content="main"/>
		<s2ui:title messageCode='spring.security.ui.user.search'/>
	</head>
	<body>
		<div>
			<div class="text-right">
				<g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="['User']" /></g:link>
			</div>
			<s2ui:formContainer type='search' beanType='user'>
				<s2ui:searchForm colspan='4'>
					<table class="table table-striped table-hover">
						<tr>
							<td>
								<g:message code='user.username.label' default='Username'/>:
							</td>
							<td colspan="3">
								<g:textField class="form-control" name='username' size='50' maxlength='255' autocomplete='off' value='${username}'/>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><g:message code='spring.security.ui.search.true'/></td>
							<td><g:message code='spring.security.ui.search.false'/></td>
							<td><g:message code='spring.security.ui.search.either'/></td>
						</tr>
						<tr>
							<td><g:message code='user.enabled.label' default='Enabled'/>:</td>
							<g:radioGroup name='enabled' labels="['','','']" values='[1,-1,0]' value='${enabled ?: 0}'>
							<td><%=it.radio%></td>
							</g:radioGroup>
						</tr>
						<tr>
							<td><g:message code='user.accountExpired.label' default='Account Expired'/>:</td>
							<g:radioGroup name='accountExpired' labels="['','','']" values='[1,-1,0]' value='${accountExpired ?: 0}'>
							<td><%=it.radio%></td>
							</g:radioGroup>
						</tr>
						<tr>
							<td><g:message code='user.accountLocked.label' default='Account Locked'/>:</td>
							<g:radioGroup name='accountLocked' labels="['','','']" values='[1,-1,0]' value='${accountLocked ?: 0}'>
							<td><%=it.radio%></td>
							</g:radioGroup>
						</tr>
						<tr>
							<td><g:message code='user.passwordExpired.label' default='Password Expired'/>:</td>
							<g:radioGroup name='passwordExpired' labels="['','','']" values='[1,-1,0]' value='${passwordExpired ?: 0}'>
							<td><%=it.radio%></td>
							</g:radioGroup>
						</tr>
					</table>
				</s2ui:searchForm>
			</s2ui:formContainer>
			<g:if test='${searched}'>
				<hr>
				<table class="table table-striped table-hover">
					<thead>
					<tr>
						<s2ui:sortableColumn property='username' titleDefault='Username'/>
						<s2ui:sortableColumn property='enabled' titleDefault='Enabled'/>
						<s2ui:sortableColumn property='accountExpired' titleDefault='Account Expired'/>
						<s2ui:sortableColumn property='accountLocked' titleDefault='Account Locked'/>
						<s2ui:sortableColumn property='passwordExpired' titleDefault='Password Expired'/>
					</tr>
					</thead>
					<tbody>
						<g:each in='${results}' status='i' var='user'>
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
								<td><g:link action='edit' id='${user.id}'>${uiPropertiesStrategy.getProperty(user, 'username')}</g:link></td>
								<td><s2ui:formatBoolean bean='${user}' name='enabled'/></td>
								<td><s2ui:formatBoolean bean='${user}' name='accountExpired'/></td>
								<td><s2ui:formatBoolean bean='${user}' name='accountLocked'/></td>
								<td><s2ui:formatBoolean bean='${user}' name='passwordExpired'/></td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<s2ui:paginate total='${totalCount}'/>
			</g:if>
		</div>
		<s2ui:ajaxSearch paramName='username'/>
		<script>
			$("#searchButton_submit").addClass("btn btn-primary center");
			$("#searchButton_submit").val("Buscar");
			$("#searchButton").hide();
			$("#searchButton_submit").css({
				'width': '120px',
				'margin': '0 auto',
				'display':'block'
			});
			$(".ui-dialog-title").css({
				'font-size': '30px',
				'font-family': '"Helvetica Neue",Helvetica,Arial,sans-serif',
				'font-weight': '500',
				'line-height': '1.2',
				'color': '#317eac'
			});
		</script>
	</body>
</html>
