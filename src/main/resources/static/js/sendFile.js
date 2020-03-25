function sendFile() {
    // данные для отправки
    let formData = new FormData();
    // забрал файл из input
    let files = ($('#photo'))[0]['files'];
    // добавляю файл в formData
    [].forEach.call(files, function (file, i, files) {
        formData.append("file", file);
    });

    $.ajax({
        type: "POST",
        url: "/files",
        data: formData,
        processData: false,
        contentType: false
    })
        .done(function (response) {
            let fileUrl = 'http://localhost/files/' + response;
            $('#place1').append('<img src = "' + fileUrl + '" width="120" height="100"/>');
            $('#place2').append('<input type="hidden" name="photoPath" value="' + fileUrl + '">')
        })
        .fail(function () {
            alert('Error')
        });
}