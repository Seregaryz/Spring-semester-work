<#if isAuth == true>
    <#include "base-with-authorization.ftl"/>
<#else>
    <#include "base-non-authorized.ftl"/>
</#if>

<#macro title>profile</#macro>

<#macro links>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/StyleForMain.css">
    <link rel="stylesheet" href="css/extra-styles.css">
    <#import "spring.ftl" as spring />
    <style>

        .borderImg {
            border: 2px solid #000000;
        }

        a.profile-dropdown-toggle {
            color: white;
        }

        .container-post {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .card-post {
            padding: 16px;
        }

        .card-like-button-wrap {
            display: flex;
            justify-content: flex-end;
        }

        .card-like-button {
            margin-left: 12px;
            padding: 0;
            width: 30px;
            background: transparent;
            border: 0;
        }

        .card a:hover {
            text-decoration: none;
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
        <div class="col-3">
            <div class="nav flex-column nav-pills h-100vh bg-dark" id="v-pills-tab" role="tablist"
                 aria-orientation="vertical">
                <a class="btn nav-link active text-white font-18px btn-dark" id="v-pills-home-tab" data-toggle="pill"
                   href="#v-pills-home"
                   role="tab" aria-controls="v-pills-home" aria-selected="true"><@spring.message 'profile_page.profile'/></a>
                <a class="btn nav-link text-white font-18px btn-dark" id="v-pills-profile-tab" data-toggle="pill"
                   href="#v-pills-profile"
                   role="tab" aria-controls="v-pills-profile" aria-selected="false"><@spring.message 'profile_page.debates'/></a>
            </div>
        </div>
        <div class="col-9 pl-xl-5">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                     aria-labelledby="v-pills-home-tab">
                    <div class="container">
                        <div class="row user-profile-row">
                            <div class="col-auto user-profile-col mt-5">
                                <P></P>
                                <img src="${anotherUser.getPhotoPath()}" alt="Фотография" width="200" height="255"
                                     class="img-fluid user-profile-photo mb-3">
                            </div>
                            <div class="col mt-3 ml-5">
                                <h2><@spring.message 'profile_page.profile'/></h2>
                                <div class="form-group mb-2 border border-secondary p-2"
                                     style="border-radius: 2px; width: 300px">
                                    <p><@spring.message 'profile_page.name'/></p>
                                    <p><b>${anotherUser.getName()}</b></p>
                                </div>
                                <div class="form-group mb-2 border border-secondary p-2"
                                     style="border-radius: 2px; width: 300px">
                                    <p><@spring.message 'profile_page.surname'/></p>
                                    <p><b>${anotherUser.getSurname()}</b></p>
                                </div>
                                <#--                                <div class="form-group mb-2 border border-secondary p-2"-->
                                <#--                                     style="border-radius: 2px; width: 300px">-->
                                <#--                                    <p>sex</p>-->
                                <#--                                    <p><b>${user.getSex()}</b></p>-->
                                <#--                                </div>-->
                                <div class="form-group mb-2 border border-secondary p-2"
                                     style="border-radius: 2px; width: 300px">
                                    <p><@spring.message 'profile_page.nickname'/></p>
                                    <p><b>${anotherUser.getNickname()}</b></p>
                                </div>
                                <div class="form-group mb-2 border border-secondary p-2"
                                     style="border-radius: 2px; width: 300px">
                                    <p><@spring.message 'profile_page.email'/></p>
                                    <p><b>${anotherUser.getEmail()}</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade h-100" id="v-pills-profile" role="tabpanel"
                     aria-labelledby="v-pills-profile-tab">
                    <div id="menu2" class="container">
                        <h1>DEBATES</h1>
                        <div class="col">
                            <div class="form-group">
                                <p>Vsego debatov</p>
                                <p><b>1337</b></p>
                            </div>
                            <div class="form-group">
                                <p>vigrano</p>
                                <p><b>228</b></p>
                            </div>
                            <div class="form-group">
                                <p>proigrano</p>
                                <p><b>228</b></p>
                            </div>
                            <div class="form-group">
                                <p>the best debator</p>
                                <p><b>5 times</b></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</#macro>

<@main/>