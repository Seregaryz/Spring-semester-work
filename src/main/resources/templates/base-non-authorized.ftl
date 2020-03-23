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
        <script src="js/bootstrap.js"></script>
        <@links/>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a href="#" class="navbar-brand">POLITIS</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/signUp">Registration <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/signIn">Login <span class="sr-only">(current)</span></a>
                </li>
            </ul>

<#--            <form class="form-inline my-2 my-lg-0 mr-2" action="/searchNews" method="get">-->
<#--                <input class="form-control mr-sm-2" type="search" placeholder="Search news..." aria-label="Search" name="pattern">-->
<#--                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>-->
<#--            </form>-->
        </div>
    </nav>
    <@content/>
    </body>
    </html>
</#macro>