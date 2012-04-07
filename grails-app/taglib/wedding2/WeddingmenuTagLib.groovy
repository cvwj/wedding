package wedding2

class WeddingmenuTagLib {

    def mainmenuentry = {
        attrs ->
        def transcode = "menu." + attrs.name
        if (session.activemenu == attrs.name)
        {
            out << "<li class='active'>"
            out << g.link (controller:'menu', action:attrs.name, class:'btn-danger', {translatable(code: transcode, {attrs.label})})
            out << "</li>"
        }
        else
        {
            out << "<li>"
            out << g.link (controller:'menu', action:attrs.name, {translatable(code: transcode, {attrs.label})})
            out << "</li>"
        }
    }


}
