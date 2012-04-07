<tr data="${event.id}" class="event">
    <sec:ifLoggedIn>
        <td><i class="icon-remove"></i></td>
    </sec:ifLoggedIn>
    <td><span>${event.period}</span><input type="text" class="field" name="period" value="${event.period}"/></td>
    <td><span>${event.description}</span><input type="text" class="field" name="description" value="${event.description}"/></td>
</tr>
