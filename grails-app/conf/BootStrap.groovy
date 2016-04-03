import hogaryestilo.Rol
import hogaryestilo.Usuario
import hogaryestilo.UsuarioRol


class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = Rol.findByAuthority('ROLE_USER') ?: new Rol(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Rol.findByAuthority('ROLE_ADMIN') ?: new Rol(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = Usuario.findByUsername('admin') ?: new Usuario(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        def user = Usuario.findByUsername('user') ?: new Usuario(
                username: 'user',
                password: 'user',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UsuarioRol.create adminUser, adminRole
        }

        if (!user.authorities.contains(userRole)) {
            UsuarioRol.create user, userRole
        }

    }
    def destroy = {
    }
}
