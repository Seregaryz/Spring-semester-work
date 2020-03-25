<#include "base-non-authorized.ftl"/>

<#macro title>registration</#macro>

<#macro links>
    <style>
        .form-width {
            max-width: 25rem;
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
    <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
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
    <script src="js/sendFile.js"></script>
</#macro>

<#macro content>
    <div class="container-login100">
    <div class="row w-100">
        <div class="col-7 ">
            <form class="card card-block m-x-auto bg-faded form-width" action="/signUp" method="post">
                <legend class="m-b-1 text-xs-center">Registration</legend>
                <div class="form-group input-group">
						<span class="has-float-label">
							<input class="form-control" id="name" type="text" placeholder="name" name="name"/>
							<label for="name">Name</label>
						</span>
                    <span class="has-float-label">
							<input class="form-control" id="surname" type="text" placeholder="surname" name="surname"/>
							<label for="surname">Surname</label>
						</span>
                </div>
                <div class="form-group text-center">
                    <div class="form-group input-group">
						<span class="has-float-label">
							<input class="form-control" id="nickname" type="text" placeholder="nickname"
                                   name="nickname"/>
							<label for="nickname">Nickname</label>
						</span>
                    </div>
                    <div class="form-group input-group mt-1">
						<span class="has-float-label">
							<input class="form-control" id="email" type="email" placeholder="name@example.com"
                                   name="email"/>
							<label for="email">E-mail</label>
						</span>
                    </div>
                    <div id="place2">
                    </div>
                    <div class="form-group has-float-label">
                        <input class="form-control" id="password" type="password" placeholder="••••••••"
                               name="password"/>
                        <label for="password">Password</label>
                    </div>
                    <div class="container-login100-form-btn">
                        <button type="submit" class="login100-form-btn">Sign up</button>
                    </div>
                    <p>
                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn">
                            <a href="/signIn">have an account? login</a>
                        </button>
                    </div>
                </div>

            </form>
        </div>
        <div class="col-4 mt-5">
            <div class="my-2 mx-auto">
                <label for="my-file-selector" style="font-size: 20px">Аватар</label>
                <input type="file" name="photo" class="filestyle" id="photo">
                <#--                           data-classButton="login100-form-btn"-->
                <#--                           data-classIcon="icon-plus"-->
                <#--                           data-buttonText="Выбрать файлы" multiple accept="image/*,image/jpeg">-->
                <div class="dis-flex" id="place1">
                </div>
                <div class="container-login100-form-btn mt-5">
                    <button class="login100-form-btn" onclick="sendFile()">Загрузить фото</button>
                </div>
            </div>

        </div>
    </div>
    </div>
</#macro>

<@main/>
