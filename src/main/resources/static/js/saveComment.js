function saveComment(user) {
    let formData = new FormData();
    let form = ($('#comment'))[0]['commentForm'];
    [].forEach.call(form, function (file, i, commentForm) {
        formData.append("form", file);
    });
    $.ajax({
        type: "POST",
        url: "/addComment",
        data: formData,
        processData: false,
        contentType: false
    })
        .done(function (response) {
            $('#place1').append(' <li class="media"><img src="' + document.forms["comment"].elements[""] +
                '" alt="avatar" class="mr-3 img-fluid media-author-photo img-circle" style="width: 50px; height: 50px;">' +
                ' <div class="media-body"><form action="/profileOfUser" method="get"> <input name="id" value="' + user.id +
                '" type="hidden"> <button type="submit" class="btn btn-link text-dark"> <p class="mt-0 mb-1">' + user.getNickname());


        })
        .fail(function () {
            alert('Error')
        });
}

function clearBlock(s) {
    document.getElementById(s).innerHTML = '';
}