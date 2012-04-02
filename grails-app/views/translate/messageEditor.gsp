<g:formRemote name="translation" url="[controller: 'translate', action: 'save']" class="form-horizontal" update='${code.replaceAll("\\.", "")}' onComplete="\$('#translation').hide()">
    <g:hiddenField name="code" value="${code}"/>
    <div class="modal" id="translation">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>

            <h3>Translate code: <em>${code}</em></h3>
        </div>


        <div class="modal-body">
            <ul class="nav nav-tabs">
                <g:each in="${languages}" var="language">
                    <li class="translationtab"><a href="#${language.locale}" data-toggle="tab" class="${language.locale}">${language.languageNameLocal} <g:img dir="images/flags" file="${language.locale.country}.png"/></a></li>
                </g:each>

            </ul>

            <div class="tab-content">
                    <g:each in="${languages}" var="language">
                        <div class="tab-pane" id="${language.locale}">
                            <div class="control-group">

                                <textarea id="${language.locale.toString()}" name="${language.locale.toString()}" class="input-xlarge translation"
                                          rows="1">${messages.find {it.locale == language.locale}?.text}</textarea>

                                <p class="help-block">The translation for ${language.languageNameEnglish}</p>
                            </div>
                        </div>
                    </g:each>
            </div>
        </div>

        <div class="modal-footer">
            <g:submitButton name="save" value="Save changes" class="btn btn-primary"/>
            <g:submitButton name="cancel" value="Cancel" class="btn"/>
        </div>
    </div>
</g:formRemote>

<script type="text/javascript">
    CKEDITOR.config.toolbar_Basic =
            [
                ['Format', 'Source', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', '-']
            ];
    //    CKEDITOR.config.toolbar = 'Basic'
    $(".translation").each(function (index, textarea) {

        var id = $(textarea).attr("id")
        var instance = CKEDITOR.instances[id];
        if (instance) {
            instance.destroy(true);
        }

        $(textarea).ckeditor({toolbar:"Basic"})

    })
    $(".${currentLocale}").tab('show')
</script>