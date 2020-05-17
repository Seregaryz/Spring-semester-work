<#macro content>
</#macro>

<#macro title></#macro>
<#macro links></#macro>

<#macro main>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title><@title/></title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script src="js/jquery-3.4.1.js"></script>
        <script src="js/bootstrap.js"></script>
        <#import "spring.ftl" as spring />
        <@links/>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a href="#" class="navbar-brand"><@spring.message 'base.element.title'/></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/newsList"><@spring.message 'base.element.news'/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/signUp"><@spring.message 'base.element.registration'/><span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/signIn"><@spring.message 'base.element.login'/><span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0 mr-2" action="/searchNews" method="post">
                <input class="form-control mr-sm-2" type="text" placeholder="<@spring.message 'base.element.search_placeholder'/>" aria-label="Search" name="q" id="q">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><@spring.message 'base.element.search_button'/></button>
            </form>
        </div>
    </nav>
    <@content/>
    </body>
    </html>
</#macro>