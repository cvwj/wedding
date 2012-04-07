<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>

    <r:script>
        $(function () {

            $(document).on("click", ".event td", function (event) {
                $(this).children("span").hide()
                $(this).children(".field").show().focus()
            })
            $(document).on("focusout", ".event .field", function (event) {
                $(this).prev().html($(this).val())
                $(this).hide().prev().show().focus()
                save($(this).parent().parent())
            })
            $(document).on("click", ".icon-remove", mydelete)
            $(document).on("click", "#eventlist .icon-ok", createNew)

        });

        function mydelete(event)
        {
             var row = $(event.target).parent().parent()
             if ($(row).attr("data"))
             {
             $.ajax( {
               type: "POST",
               url: "${createLink(controller: 'event', action: 'delete')}/" + $(row).attr("data"),
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
           url: "${createLink(controller: 'event', action: 'save')}",
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
        var row = $('#newEvent');
        save(row)
        $(row).children().children("input").each(function() {$(this).val("")})

    }


    function prepareNew() {
        var row = $("#eventlist tr:first-child")
        var newRow = $(row).clone().attr("data", "").attr("id", "newEvent").removeClass("event").insertBefore(row)
        $(newRow).children().children("span").hide()
        $(newRow).children().children(".field").val("").show()
        $("<i class='icon-ok'/>").insertAfter($(newRow).children().children(".icon-remove"))
        $(newRow).children().children(".field:first-child").focus()

    }


    </r:script>
    <style>
    tbody tr input {
        display: none;
    }
    </style>

</head>

<body>
<g:translatable code="timetable.welcome">
    <h1>Tidstabel for brylluppet</h1>
</g:translatable>
<sec:ifLoggedIn>
    <p>
        <button class="btn" onclick="prepareNew()">New Event</button>
    </p>
</sec:ifLoggedIn>

<table class="table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <sec:ifLoggedIn>
            <th>Action</th>
        </sec:ifLoggedIn>
        <th><g:translatable code="timetable.timeheader"/></th>
        <th><g:translatable code="timetable.descheader"/></th>
    </tr>
    </thead>
    <tbody id="eventlist">
    <g:each in="${events}" var="event">
        <g:render template="/event/eventrow" model="[event: event]"/>
    </g:each>
    </tbody>
</table>

</body>
</html>
