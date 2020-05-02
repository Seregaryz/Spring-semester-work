let code = -1;
let isLoaded = false;

function sendFile(isRegistration) {
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
            isLoaded = true;
            if (isRegistration) {
                checkCodeAndPhoto()
            }
            let fileUrl = 'http://localhost/files/' + response;
            clearBlock('place1');
            $('#place1').append('<img src = "' + fileUrl + '" height="280" style="max-width: 450px"/>');
            $('#place2').append('<input type="hidden" name="photoPath" value="' + fileUrl + '">')
        })
        .fail(function () {
            alert('Error')
        });
}

function clearBlock(s) {
    document.getElementById(s).innerHTML = '';
}

function sendCode() {
    let formData = new FormData();
    formData.append("number", document.getElementById("number").value);

    $.ajax({
        type: "POST",
        url: "/sendCode",
        data: formData,
        processData: false,
        contentType: false
    })
        .done(function (response) {
            $('#place3').append('<p>Код отправлен</p>');
            code = response
        })
        .fail(function () {
            alert('Error')
        });
}

function checkCodeAndPhoto() {
    let userCodeInput = document.getElementById("code").value;
    if(isLoaded === true && userCodeInput === code.toString()){
        document.getElementById("signUp").disabled = false
    }
}

