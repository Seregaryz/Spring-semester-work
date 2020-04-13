<#include "base-non-authorized.ftl"/>

<#macro title>login</#macro>

<#macro links>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/hamburgers.css">
    <link rel="stylesheet" type="text/css" href="css/animsition.css">
    <link rel="stylesheet" type="text/css" href="css/select2.css">
    <link rel="stylesheet" type="text/css" href="css/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="css/loginUtil.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <#import "spring.ftl" as spring />
</#macro>

<#macro content>
    <head>
        <meta charset="UTF-8">
        <@links/>
    </head>
    <body class="background-blue">
    <div class="limiter">
        <div class="container-login100 mt-5">
            <div class="wrap-login100 p-b-160 p-t-50">
                <form class="login100-form validate-form" action="/signIn" method="post">
					<span class="login100-form-title p-b-43">
						Login
					</span>

                    <div class="wrap-input100 rs1 validate-input" data-validate="Login or E-mail is required">
                        <input class="input100" type="text" name="email">
                        <span class="label-input100"><@spring.message 'signin.email'/></span>
                    </div>


                    <div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
                        <input class="input100" type="password" name="password">
                        <span class="label-input100"><@spring.message 'signin.password'/></span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button type="submit" class="login100-form-btn"><@spring.message 'base.element.login'/></button>
                    </div>

                    <div class="text-center w-full p-t-23">
                        <input type="checkbox" id="check" name="remember">
                        <span class="txt1"><@spring.message 'signin.remember_me'/></span>
                    </div>
                </form>
                <form>
                    <div class="text-center w-full p-t-23">
                        <a href="/signUp" class="txt1">
                            <@spring.message 'signin.reg_suggestion'/>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/animsition.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/select2.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/daterangepicker.js"></script>
    <script src="js/countdowntime.js"></script>
    <script src="js/login.js"></script>
    </body>
</#macro>

<@main/>
