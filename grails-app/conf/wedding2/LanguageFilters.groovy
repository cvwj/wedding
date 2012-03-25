package wedding2
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class LanguageFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if (!session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
                {
                    session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'] = grailsApplication.config.language.default.locale
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
