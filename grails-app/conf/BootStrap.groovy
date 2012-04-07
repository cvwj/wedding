import wedding2.security.UserRole
import wedding2.security.Role
import wedding2.security.User
import wedding2.Guest
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import wedding2.Event



class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'me', enabled: true, password: 'password')
        testUser.save(flush: true)

        UserRole.create testUser, adminRole, true

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

        new Guest(name: "Jonna & Christian", language: "Dansk", email: "jonnavw@gmail.com", relation: "They are getting married", address: "Ægirsgade 50, stth, 2200 København N, Danmark", phone: "+4531171007").save()
        new Guest(name: "Ronja", language: "Dansk", email: "ronja.jensen@gmail.com", relation: "The daughter of Christian", address: "Ægirsgade 50, stth, 2200 København N, Danmark", phone: "+4531171007").save()

        new Event(period: "10:00-11:00", description: "Frisør").save()
        new Event(period: "10:45-11:45", description: "Børnene til Frisør").save()
    }
    def destroy = {
    }
}
