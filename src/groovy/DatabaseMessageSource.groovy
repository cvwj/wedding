import org.springframework.context.support.AbstractMessageSource
import java.text.MessageFormat
import wedding2.Message
/**
 * Created by IntelliJ IDEA.
 * User: csj
 * Date: 18/01/2012
 * Time: 6:41 PM
 * To change this template use File | Settings | File Templates.
 */
class DatabaseMessageSource extends AbstractMessageSource {
    @Override
    protected java.text.MessageFormat resolveCode(String code, Locale locale) {
        Message msg = Message.findByCodeAndLocale(code, locale)
        def format
        if(msg) {
            format = new MessageFormat(msg.text, msg.locale)
        }
        else {
            format = new MessageFormat(code, locale )
        }
        return format;
    }
}
