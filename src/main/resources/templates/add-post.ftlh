<#if isAuth == true>
    <#include "base-with-authorization.ftl"/>
<#else>
    <#include "base-non-authorized.ftl"/>
</#if>

<#macro title>add news</#macro>

<#macro links>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/sendFile.js"></script>
    <#import "spring.ftl" as spring />
    <style>
        a.profile-dropdown-toggle {
            color: white;
        }

        .container-post {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .post-photo {
            max-width: 400px;
        }

        .post-photo-upload {
            margin-top: 20px;
        }
    </style>
</#macro>
<#macro content>
    <head>
        <meta charset="UTF-8">
        <@links/>
    </head>
    <body>
    <div class="row w-100">
        <#--            <div class="col-auto ml-5 mt-5">-->
        <#--                <img src="/img/poster.jpg" alt="Пост" class="img-fluid post-photo">-->
        <#--                <input type="file" class="form-control-file post-photo-upload" name="img">-->
        <#--            </div>-->
        <div class="col-7 mx-5 mt-5">
            <form action="/addPost" method="post">
                <h2><@spring.message 'base.element.add_new'/></h2>
                <div class="form-group">
                    <label for="place"><@spring.message 'add_post.add_header'/></label>
                    <input type="text" class="form-control" id="place" name="header">
                </div>
                <div class="form-group">
                    <label for="time"><@spring.message  'add_post.add_preview'/></label>
                    <input type="text" class="form-control" id="time" name="preview">
                </div>
                <div class="form-group">
                    <label for="desc"><@spring.message  'add_post.add_text'/></label>
                    <textarea class="form-control" id="desc" rows="3" name="text"></textarea>
                </div>
                <div id="place2">
                </div>
                <button type="submit" class="btn btn-dark"><@spring.message  'add_post.add_publish'/></button>
            </form>
        </div>
        <div class="col-4 mt-5">
            <div class="my-2 mx-auto">
                <label for="photo" style="font-size: 20px"><@spring.message  'add_post.add_photo'/></label>
                <input type="file" name="photo" class="filestyle" id="photo">
                <#--                           data-classButton="login100-form-btn"-->
                <#--                           data-classIcon="icon-plus"-->
                <#--                           data-buttonText="Выбрать файлы" multiple accept="image/*,image/jpeg">-->
                <div class="mt-5">
                    <button class="btn btn-dark" onclick="sendFilePost()"><@spring.message  'add_post.add_load'/></button>
                </div>
            </div>
            <div class="mt-5" id="place1">
            </div>
        </div>
    </div>
    </body>
</#macro>

<@main/>
