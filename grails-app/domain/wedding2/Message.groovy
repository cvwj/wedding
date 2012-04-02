package wedding2

class Message {
    String code
    Locale locale
    String text

    static mapping = {
        cache true
    }

    static constraints = {
        locale( nullable: true)
        text( nullable: true, maxSize: 65535)
    }

}
