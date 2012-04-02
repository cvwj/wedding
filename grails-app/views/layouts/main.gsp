<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:layoutTitle default="Jonna & Christian"/></title>
    <g:layoutHead/>
    <r:require modules="bootstrap, ckeditor-adaptor"/>
    <r:layoutResources/>
    <style>
    body, p, li {
        color: #808080;
    }

    h1, h2, h3, h4, h5, h6 {
        color: #b94a48;
    }
    h1 {
        margin-bottom: 20px;
    }
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

    .loginlogout {
        border-top: 1px solid white;
        font-size: smaller;
    }

    .selectedLang {
        border-width: 2px 2px 0 2px;
        border-color: #fa63f6;
        border-style: solid;
    }

    .nav > li > a:hover {
        text-decoration: none;
        background-color: #eeeeee;
    }
    </style>

    <script type="text/javascript">
        var CKEDITOR_BASEPATH = '${g.resource(dir: "ckeditor")}/';
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
                    <g:if test="${session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'] == language.locale}">
                        <g:link controller="translate" action="changeLang" id="${language.locale.country}" class="changeLang">
                            <img class="selectedLang" src="<g:resource dir='images' file='flags/${language.locale.country}.png'/>">
                        </g:link>
                    </g:if>
                    <g:else>
                        <g:link controller="translate" action="changeLang" id="${language.locale.country}" class="changeLang"><img src="<g:resource dir='images' file='flags/${language.locale.country}.png'/>"></g:link>
                    </g:else>
                </g:each>
                <ul class="nav nav-list">
                    <g:mainmenuentry name="home" label="Home"/>
                    <g:mainmenuentry name="weddingofficials" label="Wedding 'Officials'"/>
                    <g:mainmenuentry name="places" label="Places"/>
                    <g:mainmenuentry name="timetable" label="Timetable"/>
                    <g:mainmenuentry name="guests" label="Guests"/>
                    <g:mainmenuentry name="wishlist" label="Wish list"/>
                    <g:mainmenuentry name="speeches" label="Speeches"/>
                    <g:mainmenuentry name="dresscode" label="Dress code"/>
                </ul>
                <sec:ifLoggedIn>
                    <div id="login" class="loginlogout">Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)</div>
                    <ul class="nav nav-list">
                        <g:mainmenuentry name="translations" label="Translations"/>
                    </ul>

                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <div id="login" class="loginlogout">Login</div>
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