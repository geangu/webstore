package hogaryestilo

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController extends grails.plugin.springsecurity.ui.UserController {
}