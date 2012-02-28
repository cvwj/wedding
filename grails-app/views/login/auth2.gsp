<g:formRemote name="loginForm" id="loginForm" url="[uri:postUrl]" method="POST" onSuccess="handleSuccess(data)">
    <div class="modal" id="logindialog">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>

            <h3>Login</h3>
        </div>

        <div class="modal-body">
            <fieldset>
                <div id='loginMessage'></div>

                <div class="control-group">
                    <label class="control-label" for="username">Username</label>

                    <div class="controls">
                        <input type='text' name='j_username' id='username' class="input-xlarge"/>

                        <p class="help-block">Your wedding site username</p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="password">Password</label>

                    <div class="controls">
                        <input type='password' name='j_password' id='password'/>

                        <p class="help-block">Your wedding site password</p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="remember_me">Remember my login</label>

                    <label class="checkbox">
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                    </label>
                </div>
            </fieldset>
        </div>

        <div class="modal-footer">
            <g:submitButton name="save" value="Login" class="btn btn-primary" update="login_message" onSuccess="\$('#logindialog').hide()" onFailure="alert('failed')"/>
            <input type="button" name="cancel" value="Cancel" class="btn" onclick="$('#logindialog').hide()"/>
        </div>
    </div>
</g:formRemote>
<script type="text/javascript">

    function handleSuccess(data) {
//        var responseText = data.responseText || '[]';
        var json = eval(data);
        if (json.success) {
            $('#login').html('Logged in as ' + json.username +
                    ' (<%=link(controller: 'logout') { 'Logout' }%>)');
            $('#logindialog').hide()
        }
        else if (json.error) {
            $('#loginMessage').html( "<span class='errorMessage'>" +
                    json.error + '</error>');
        }
        else {
            $('#loginMessage').html(data);
        }
    }
    ;
</script>