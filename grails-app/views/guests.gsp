<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <r:require module="tablesorter" />
    <r:script>
        $(function () {
            $("#guestsearcher").bind("keyup", filterGuests)
            $(".tablesorter").tablesorter({sortList: [[0,0]]});
        })

        function filterGuests(event) {

            var val = $("#guestsearcher").val().toLowerCase()
            $("table tbody tr").each(function (row) {
                var hide = val.length > 0
                if (hide) {
                    $(this).children().each(function (index) {
                        if ($(this).text().toLowerCase().indexOf(val) >= 0) {
                            hide = false
                            return false
                        }
                    })
                }
                $(this).css("display", hide ? "none" : "table-row")

            })
        }
    </r:script>
</head>

<body>
<div class="row">
    <div class="span10">
        <h1><g:translatable code="frontpage.welcome.header">Bryllupsgæsterne</g:translatable></h1>

        <p>
            <g:translatable code="frontpage.welcome.body">
                I nedenstående tabel har vi listet alle vore de personer, der er inviterede til brylluppet. På den måde har vi også selv et overblik :-)
            </g:translatable>

        <p>
            <g:translatable code="guestlist.searcher">Find en gæst</g:translatable> <input id="guestsearcher" class="search-query" type="text">
        </p>
        <table class="table-striped table-bordered table-condensed tablesorter">
            <thead>
            <tr>
                <th><g:translatable code="guesttable.name">Navne</g:translatable></th>
                <th><g:translatable code="guesttable.country">Land</g:translatable></th>
                <th><g:translatable code="guesttable.relation">Relation</g:translatable></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Jonna og Christian</td>
                <td>Danmark</td>
                <td>De skal giftes</td>
            </tr>
            <tr>
                <td>Ronja</td>
                <td>Danmark</td>
                <td>Hun er Christians datter</td>
            </tr>
            </tbody>
        </table>

    </p>
    </div>

</div>
</body>
</html>
