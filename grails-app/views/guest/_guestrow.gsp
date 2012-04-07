<tr data="${guest.id}" class="guest">
    <sec:ifLoggedIn>
        <td><i class="icon-remove"></i></td>
    </sec:ifLoggedIn>

    <td><span>${guest.name}</span><input type="text" class="field" name="name" value="${guest.name}"/></td>
    <td><span>${guest.language}</span><input type="text" class="field" name="language" value="${guest.language}"/></td>
    <td><span>${guest.relation}</span><input type="text" class="field" name="relation" value="${guest.relation}"/></td>
    <sec:ifLoggedIn>
        <td><span>${guest.address}</span><textarea rows="3" cols="20" class="field" name="address" >${guest.address}</textarea></td>
        <td><span>${guest.email}</span><input type="text" class="field" name="email" value="${guest.email}"/></td>
        <td><span>${guest.phone}</span><input type="text" class="field" name="phone" value="${guest.phone}"/></td>
    </sec:ifLoggedIn>
</tr>
