<#include "base-with-authorization.ftl"/>

<#macro title>Edit profile</#macro>

<#macro links>
    <style>
        .form-width {
            max-width: 45rem;
        }

        .has-float-label {
            position: relative;
        }

        .has-float-label label {
            position: absolute;
            top: 0;
            cursor: text;
            font-size: 75%;
            opacity: 1;
            -webkit-transition: all .2s;
            transition: all .2s;
            left: 0.75rem;
            z-index: 3;
            line-height: 1;
            padding: 0 1px;
        }

        .has-float-label label::after {
            content: " ";
            display: block;
            position: absolute;
            background: white;
            height: 2px;
            top: 50%;
            left: -.2em;
            right: -.2em;
            z-index: -1;
        }

        .has-float-label .form-control::-webkit-input-placeholder {
            opacity: 1;
            -webkit-transition: all .2s;
            transition: all .2s;
        }

        .has-float-label .form-control:placeholder-shown:not(:focus)::-webkit-input-placeholder {
            opacity: 0;
        }

        .has-float-label .form-control:placeholder-shown:not(:focus) + label {
            font-size: 150%;
            opacity: .5;
            top: .3em;
        }

        .input-group .has-float-label {
            display: table-cell;
        }

        .input-group .has-float-label .form-control {
            border-radius: 0.25rem;
        }

        .input-group .has-float-label:not(:last-child) .form-control {
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
        }

        .input-group .has-float-label:not(:first-child) .form-control {
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
            margin-left: -1px;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/hamburgers.css">
    <link rel="stylesheet" type="text/css" href="css/animsition.css">
    <link rel="stylesheet" type="text/css" href="css/select2.css">
    <link rel="stylesheet" type="text/css" href="css/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="css/loginUtil.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <#import "spring.ftl" as spring />
</#macro>

<#macro content>
    <head>
        <@links/>
    </head>
    <body>
    <div class="limiter">
        <div class="container-login100 mt-4">
            <div class="row w-100">
                <div class="col mt-4">
                    <@spring.bind "profileForm"/>
                    <form class="card card-block m-x-auto bg-faded form-width" action="/profileRedaction" method="post">
                        <legend class="m-b-1 text-xs-center">Edit profile</legend>
                        <div class="form-group text-center">
                            <div class="form-group input-group mt-3">
						<span class="has-float-label">
                            <label class="ml-5" for="name"><h5>Name</h5></label>
                            <br>
							<@spring.formInput "profileForm.name"/>
                            <@spring.showErrors "<br>"/>
						</span>
                            </div>
                            <div class="form-group input-group mt-3">
						<span class="has-float-label">
                            <label class="ml-5" for="surname"><h5>Surname</h5></label>
                            <br>
							<@spring.formInput "profileForm.surname"/>
                            <@spring.showErrors "<br>"/>
						</span>
                            </div>
                            <div class="form-group input-group mt-3">
						<span class="has-float-label">
                            <label class="ml-5" for="nickname"><h5>Nickname</h5></label>
                            <br>
							<@spring.formInput "profileForm.nickname"/>
                            <@spring.showErrors "<br>"/>
						</span>
                            </div>
                            <div class="form-group input-group mt-3">
						<span class="has-float-label">
                            <label class="ml-5" for="email"><h5>E-mail</h5></label>
                            <br>
							 <@spring.formInput "profileForm.email"/>
                            <@spring.showErrors "<br>"/>
						</span>
                            </div>
                            <div class="form-group input-group mt-3">
						<span class="has-float-label">
                            <label class="ml-5" for="number"><h5>Number</h5></label>
                            <br>
							<@spring.formInput "profileForm.number"/>
                            <@spring.showErrors "<br>"/>
						</span>
                            </div>
                            <#--                                <div class="form-group input-group mt-1">-->
                            <#--						<span class="has-float-label">-->
                            <#--							  <div class="container-login100-form-btn">-->
                            <#--                                <button type="button" class="login100-form-btn" onclick="sendCode()">Send code</button>-->
                            <#--                            </div>-->
                            <#--						</span>-->
                            <#--                                </div>-->
                            <#--                            <div class="form-group input-group">-->
                            <#--						<span class="has-float-label">-->
                            <#--								<input class="form-control" id="code" type="text" placeholder="code" name="code"/>-->
                            <#--							<label for="code">Code</label>-->
                            <#--						</span>-->
                            <#--                            </div>-->
<#--                            <div class="form-group input-group mt-1">-->
<#--						<span class="has-float-label">-->
<#--							  <div class="container-login100-form-btn">-->
<#--                                <button type="button" class="login100-form-btn" onclick="checkCodeAndPhoto()">Confirm code</button>-->
<#--                            </div>-->
<#--						</span>-->
<#--                            </div>-->
                            <div class="container-login100-form-btn mt-3">
                                <button type="submit" id="signUp" class="login100-form-btn w-50">Edit</button>
                            </div>
                        </div>
                    </form>
                </div>
<#--                <div class="col-5 mt-5">-->
<#--                    <div class="my-2 mx-auto">-->
<#--                        <label for="my-file-selector" style="font-size: 20px">Аватар</label>-->
<#--                        <div class="input_file">-->
<#--                            <input type="file" name="photo" id="photo">-->
<#--                            <div class="fake_file">-->
<#--                                <input type="text" class="fake_file_input">-->
<#--                                <input type="button" value="Выбрать" class="fake_file_btn">-->
<#--                            </div>-->
<#--                        </div>-->
<#--                        &lt;#&ndash;                           data-classButton="login100-form-btn"&ndash;&gt;-->
<#--                        &lt;#&ndash;                           data-classIcon="icon-plus"&ndash;&gt;-->
<#--                        &lt;#&ndash;                           data-buttonText="Выбрать файлы" multiple accept="image/*,image/jpeg">&ndash;&gt;-->
<#--                        <div class="dis-flex" id="place1" style="height: 285px">-->
<#--                        </div>-->
<#--                        <div class="container-login100-form-btn mt-1 w-75">-->
<#--                            <button class="login100-form-btn" onclick="sendFile(true)">Загрузить фото</button>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                    <script>-->
<#--                        $('.input_file input[type=file]').change(function () {-->
<#--                            var t = $(this).val();-->
<#--                            if (t.indexOf('C:\\fakepath\\') + 1)-->
<#--                                t = t.substr(12);-->
<#--                            var e = $(this).next().find('.fake_file_input');-->
<#--                            e.val(t);-->
<#--                        });-->
<#--                    </script>-->
<#--                </div>-->
            </div>
        </div>
    </div>
    </body>
</#macro>

<@main/>