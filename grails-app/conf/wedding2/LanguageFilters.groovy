package wedding2
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class LanguageFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                
                def locale = RCU.getLocale(request)
                if (!grailsApplication.config.languages.collect{it.locale}.contains(locale))
                {
                    locale = grailsApplication.config.language.default.locale
                    session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'] = locale

                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
