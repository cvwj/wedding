<g:formRemote name="translation" url="[controller: 'translate', action: 'save']" class="form-horizontal" update='${code.replaceAll("\\.", "")}' onComplete="\$('#translation').hide()">
    <div class="modal" id="translation">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>

            <h3>Translate code: <em>${code}</em></h3>
        </div>

        <div class="modal-body">
            <fieldset>
                <g:hiddenField name="code" value="${code}"/>
                <g:each in="${languages}" var="language">
                    <div class="control-group">
                        <label class="control-label" for="${language.locale.toString()}">${language.languageNameLocal} <g:img dir="images/flags" file="${language.locale.country}.png"/></label>

                        <div class="controls">
                            <textarea id="${language.locale.toString()}" name="${language.locale.toString()}" class="input-xlarge"
                                      rows="1">${messages.find {it.locale == language.locale}?.text}</textarea>

                            <p class="help-block">The translation for ${language.languageNameEnglish}</p>
                        </div>
                    </div>
                </g:each>
            </fieldset>
        </div>

        <div class="modal-footer">
            <g:submitButton name="save" value="Save changes" class="btn btn-primary"/>
            <g:submitButton name="cancel" value="Cancel" class="btn"/>
        </div>
    </div>
</g:formRemote>
