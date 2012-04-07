package wedding2

import grails.plugins.springsecurity.Secured

class GuestController {

    def showGuests() {
        def guests = Guest.list([sort: "name"])
        render view:  "/guests", model: [guests: guests]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def guest
        if (params.id)
        {
            guest = Guest.get(Long.parseLong(params.id))
            guest.properties = params
            guest.save()
        }
        else
        {
            guest = new Guest(params).save()
        }
        render template: "guestrow", model: [guest: guest]
    }

    @Secured(['ROLE_ADMIN'])
    def delete() {
        if (params.id)
        {
            def guest = Guest.get(Long.parseLong(params.id))
            guest.delete()
        }
        render "ok"

    }
}
