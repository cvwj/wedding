<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <r:require module="tablesorter"/>
    <r:script>
        $(function () {

            $("#guestsearcher").bind("keyup", filterGuests)
            $(".tablesorter").tablesorter({sortList:[
                [0, 0]
            ]});
            $(document).on("click", ".guest td", function (event) {
                $(this).children("span").hide()
                $(this).children(".field").show().focus()
            })
            $(document).on("focusout", ".guest .field", function (event) {
                $(this).prev().html($(this).val())
                $(this).hide().prev().show().focus()
                save($(this).parent().parent())
            })
            $(document).on("click", ".icon-remove", mydelete)
            $(document).on("click", "#guestlist .icon-ok", createNew)

        });

        function mydelete(event)
        {
             var row = $(event.target).parent().parent()
             if ($(row).attr("data"))
             {
             $.ajax( {
               type: "POST",
               url: "${createLink(controller: 'guest', action: 'delete')}/" + $(row).attr("data"),
                  success: function( response ) {
                    console.log( response );
                    $(row).remove()
                  }
                } )
             }
             else
             {
                $(row).remove()
             }
        }




    function save(row)
    {
         var data = {}
         if ($(row).attr("data"))
         {
            data['id'] = $(row).attr("data")
         }
         $(row).children().children(".field").each(function (idx, input) {
             data[$(input).attr("name")] = $(input).val()
         })

         $.ajax( {
           type: "POST",
           url: "${createLink(controller: 'guest', action: 'save')}",
                  data: $.param(data),
                  success: function( response ) {
                    console.log( response );
                    $(response).insertAfter(row)
                    $(row).remove()
                  }
                } )
      }


    function createNew()
    {
        var row = $('#newGuest');
        save(row)
        $(row).children().children("input, textarea").each(function() {$(this).val("")})

    }


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


        function prepareNew() {
            var row = $("#guestlist tr:first-child")
            var newRow = $(row).clone().attr("data", "").attr("id", "newGuest").removeClass("guest").insertBefore(row)
            $(newRow).children().children("span").hide()
            $(newRow).children().children(".field").val("").show()
            $("<i class='icon-ok'/>").insertAfter($(newRow).children().children(".icon-remove"))
            $(newRow).children().children(".field:first-child").focus()

        }
    </r:script>
    <style>
    #guestlist .field {
        display: none;
    }
    </style>
</head>

<body>
<g:translatable code="guests.welcome">
    <h1>Bryllupsgæsterne</h1>

    <p>
        I nedenstående tabel har vi listet alle vore de personer, der er inviterede til brylluppet. På den måde har vi også selv et overblik :-)
    </p>
</g:translatable>
<p>
    <g:translatable code="guestlist.searcher">Find en gæst</g:translatable> <input id="guestsearcher" class="search-query" type="text">
</p>
<sec:ifLoggedIn>
    <p>
        <button class="btn" onclick="prepareNew()">New Guest</button>
    </p>
</sec:ifLoggedIn>
<table class="table-striped table-bordered tablesorter">
    <thead>
    <tr>
        <sec:ifLoggedIn>
            <th>Action</th>
        </sec:ifLoggedIn>
        <th><g:translatable code="guesttable.name">Navne</g:translatable></th>
        <th><g:translatable code="guesttable.country">Land</g:translatable></th>
        <th><g:translatable code="guesttable.relation">Relation</g:translatable></th>
        <sec:ifLoggedIn>
            <th><g:translatable code="guesttable.address">Adresse</g:translatable></th>
            <th><g:translatable code="guesttable.email">Email</g:translatable></th>
            <th><g:translatable code="guesttable.phone">Telefon</g:translatable></th>
        </sec:ifLoggedIn>
    </tr>
    </thead>
    <tbody id="guestlist">
    <g:each in="${guests}" var="guest">
        <g:render template="/guest/guestrow" model="[guest: guest]"/>
    </g:each>
    </tbody>
</table>
</body>
</html>
