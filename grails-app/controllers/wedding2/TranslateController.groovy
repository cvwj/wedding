package wedding2

import org.springframework.web.servlet.support.RequestContextUtils
import grails.plugins.springsecurity.Secured

class TranslateController {

    @Secured(['ROLE_ADMIN'])
    def showMessageEditor = {
        def messages = Message.findAllByCode(params.code, [sort: "locale"])
        render view: "messageEditor", model: [code: params.code, languages: grailsApplication.config.languages, messages: messages]
    }

    @Secured(['ROLE_ADMIN'])
    def save = {
        String code = params.code
        def currentLocale = RequestContextUtils.getLocale(request)
        println "In save() with $params"
        grailsApplication.config.languages.collect{it.locale}.each {
            locale ->
            log.debug("locale: $locale")
            String translation = params[locale.toString()]
            log.debug("Translation: $translation")
            Message m = Message.findByCodeAndLocale(code, locale)
            if (m == null)
            {
                m = new Message(code:  code, locale: locale) 
            }
            
            m.text = translation
            m.save()
        }

        render text: Message.findByCodeAndLocale(code, currentLocale).text
        

    }

    def changeLang = {
        def locale = grailsApplication.config.languages.collect{it.locale}.find {it.country == params.id}
        if (grailsApplication.config.languages.collect{it.locale}.contains(locale))
        {
            session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'] = locale
            log.debug "Changed language to $locale"
        }
        render view: "../index"
    }

}
