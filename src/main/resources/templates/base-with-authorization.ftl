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
        <link rel="stylesheet" type="text/css" href="css/bootstrap-grid.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-reboot.css">
        <script src="js/jquery-3.4.1.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.js"></script>
        <#import "spring.ftl" as spring />
        <@links/>
    </head>
    <body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a href="/newsList" class="navbar-brand"><@spring.message 'base.element.title'/></a>
        <div class="collapse navbar-collapse text-white" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/newsList"><@spring.message 'base.element.news'/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/debates"><@spring.message 'base.element.debates'/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/addPost"><@spring.message 'base.element.add_new'/></a>
                </li>
            </ul>

            <form class="form-inline my-2 my-lg-0 mr-2" action="/searchNews" method="post">
                <input class="form-control mr-sm-2" type="text" placeholder="<@spring.message 'base.element.search_placeholder'/>" aria-label="Search"
                       name="q" id="q">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><@spring.message 'base.element.search_button'/></button>
            </form>
            <ul class="navbar-nav mr-0">
                <li class="nav-item mx-1">
                    <a class="nav-link" href="/profile">${user.getNickname()}</a>
                </li>
                <li class="nav-item mx-1">
                    <a class="nav-link" href="/logout"><@spring.message 'base.element.logout'/></a>
                </li>
            </ul>
        </div>
    </nav>
    <@content/>
    </body>
    </html>
</#macro>