package wedding2

import grails.plugins.springsecurity.Secured

class MenuController {

    def home() {
        session.activemenu='home'
        render view: "/index"
    }
    def weddingofficials() {
        session.activemenu='weddingofficials'
        render view: "/weddingofficials"
    }
    def places() {
        session.activemenu='places'
        render view: "/places"
    }
    def timetable() {
        session.activemenu='timetable'
        redirect(controller: "event", action: "list")
    }
    def guests() {
        session.activemenu='guests'
        redirect(controller: "guest", action: "showGuests")
    }
    def wishlist() {
        session.activemenu='wishlist'
        render view: "/wishlist"
    }
    def dresscode() {
        session.activemenu='dresscode'
        render view: "/dresscode"
    }
    def speeches() {
        session.activemenu='speeches'
        render view: "/speeches"
    }

    @Secured(['ROLE_ADMIN'])
    def translations() {
        session.activemenu='translations'
        forward controller: "translate", action: "showTranslations"
    }
    @Secured(['ROLE_ADMIN'])
    def toggleTranslation() {
        forward controller: "translate", action: "toggleTranslations"
    }
}
