import org.springframework.web.servlet.i18n.SessionLocaleResolver
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

// Place your Spring DSL code here
beans = {
    messageSource(DatabaseMessageSource)
    localeResolver(SessionLocaleResolver) {
        defaultLocale = CH.config.language.default.locale
        Locale.setDefault (CH.config.language.default.locale)
    }

}
