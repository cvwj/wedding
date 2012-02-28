<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:layoutTitle default="Grails"/></title>
    <g:layoutHead/>
    <r:require modules="bootstrap"/>
    <r:layoutResources/>
    <style>
    #logo {
        background: url("<g:resource dir='images' file='img03.jpg'/>") repeat-x;
        height: 220px;
        /*width: 940px;*/
    }

    #logo div {
        /*text-align: center;*/
        text-indent: 200px;
        height: 90px;
        position: relative;
        top: 110px;
        text-transform: lowercase;
        font-style: italic;
        font-size: 5em;
    }

    .changeLang {
        display: inline;
    }

    #login:hover {
        cursor: pointer;
    }
    </style>

    <script type="text/javascript">
        var dialog
        var logindialog
        $(function () {
            $(".icon-pencil").bind('click', function () {
                var code = $(this).attr("code");
                var url = "${createLink(controller: 'translate', action: 'showMessageEditor')}?code=" + code;
                if (dialog == null) {
                    dialog = $("<div></div>")
                }
                dialog.load(url)
                dialog.modal({backdrop:false}).show()

            });

            $("#login").bind('click', function () {
                var url = "${createLink(controller: 'login', action: 'auth')}"
                if (logindialog == null) {
                    logindialog = $("<div></div>")
                }
                logindialog.load(url)
                logindialog.modal({backdrop:false}).show()

            })
        })

    </script>
</head>

<body>
<div class="container" id="logo">
    <div>Jonna & Christian</div>
</div>

<div class="container">
    <div class="row">
        <div class="span2">
            <div class="well sidebar-nav">
                <g:each in="${grailsApplication.config.languages}" var="language">
                    <g:link controller="translate" action="changeLang" id="${language.locale.country}" class="changeLang"><g:img dir="images/flags" file="${language.locale.country}.png"/></g:link>
                </g:each>
                <ul class="nav nav-list">
                    <li class="active">
                        <a href="#" class="btn-danger">Home</a>
                    </li>
                    <li><a href="#">Places</a></li>
                    <li><a href="#">Timetable</a></li>
                </ul>
                <sec:ifLoggedIn>
                    Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <span id="login"><i class="icon-lock"></i>Login</span>
                    <g:if test='${flash.message}'>
                        <div class='login_message'>${flash.message}</div>
                    </g:if>
                </sec:ifNotLoggedIn>
            </div>
        </div>

        <div class="span10">
            <g:layoutBody/>
        </div>
    </div>

</div>

<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>