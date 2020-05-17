<#include "base-with-authorization.ftl"/>

<#macro title>debates</#macro>
<#macro links>

</#macro>
<#macro content>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/chat.css" />
    </head>
    <body>
    <noscript>
        <h2><@spring.message 'debates_page.error'/></h2>
    </noscript>
    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title"><@spring.message 'debates_page.type_username'/></h1>
            <form id="usernameForm" name="usernameForm">
                <div class="form-group">
                    <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit"><@spring.message 'debates_page.start_chatting'/></button>
                </div>
            </form>
        </div>
    </div>
    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2><@spring.message 'debates_page.title'/></h2>
            </div>
            <div class="connecting">
                <@spring.message 'debates_page.connection'/>
            </div>
            <ul id="messageArea">
            </ul>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="<@spring.message 'debates_page.type_message'/>" autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary"><@spring.message 'debates_page.send_message'/></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="js/chat.js"></script>
    </body>
</#macro>
<@main/>