<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>

    <style>
    </style>
</head>

<body>
<h1>Translations</h1>

<p>
    Here are all translatable keys
</p>
<table class="table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>Code</th>
        <th>Lang</th>
        <th>Translation</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${messages}" var="msg">
        <tr>
            <td>${msg.code}</td>
            <td><g:img dir="images/flags" file="${msg.locale.country}.png"/></td>
            <td><g:translatable code="${msg.code}" locale="${msg.locale}"></g:translatable> </td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
