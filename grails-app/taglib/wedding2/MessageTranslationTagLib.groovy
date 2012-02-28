package wedding2

class MessageTranslationTagLib {

    def springSecurityService


    def translatable = {
        attrs ->
        def message = g.message attrs
        if (springSecurityService.isLoggedIn())
        {
            out << "<i code='${attrs.code}' class='icon-pencil'></i><span id='${attrs.code.replaceAll("\\.", "")}' class='translatable'>$message</span>"
        }
        else
        {
            out << message
        }
    }
}
