package wedding2

import grails.plugins.springsecurity.Secured

class EventController {

    def list() {
        render view: "/timetable", model: [events: Event.list([sort: "period"])]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def event
        if (params.id)
        {
            event = Event.get(Long.parseLong(params.id))
            event.properties = params
            event.save()
        }
        else
        {
            event = new Event(params).save()
        }
        render template: "eventrow", model: [event: event]
    }

    @Secured(['ROLE_ADMIN'])
    def delete() {
        if (params.id)
        {
            def event = Event.get(Long.parseLong(params.id))
            event.delete()
        }
        render "ok"

    }

}
