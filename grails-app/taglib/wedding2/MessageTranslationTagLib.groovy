package wedding2

class MessageTranslationTagLib {

    def springSecurityService


    def translatable = {
        attrs, body ->
        def message = g.message attrs
        final bodytext = body()
        if (message.equals(attrs.code))
        {
            message = bodytext
        }


        if (session.showTranslations)
        {
            out << "<i code='${attrs.code}' class='icon-pencil'></i><span id='${attrs.code.replaceAll("\\.", "")}' class='translatable'>$message</span>"
        }
        else
        {
            out << message
        }
    }
}
