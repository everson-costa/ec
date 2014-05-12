<%@page  errorPage="404.jsp"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>rept4!</title>

    </head>
    <body>
   
                <script type="text/javascript">(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=608680442496976"; //VERIFICAR ESSA ID (É MINHA APLICÇÃO REPUTEIXON)
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
        <center>
        <table border="1">
            <tr>
                <td align="right" width="1024px">
                    <div class="fb-login-button" autologoutlink="true" data-show-faces="true" data-width="200" data-max-rows="1"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="<%=request.getContextPath()%>/home" title="página inicial"><h1>REPUTEICHON V10</h1></a><br/>
                        <table border="1">
                        <tr>
                            <td>
                                <form id="fomu" method="post" action="<%=request.getContextPath()%>/criarp" >
                                    <legend>Cole em baixo o nome de um usuário:</legend><p/>
                                    <a href="#" onclick="ajuda_nome_user();" title="dúvidas sobre o nome de usuário?"><h6>o que é o nome de usuário?</h6></a>
                                    username: <input  type="text" id="username" name="username"/>
                                    <input type="submit" value="vai!"/>
                                </form>
                            </td>
                        </tr>
                     </table>
                </td>
            </tr>
        </table>
    </center>
</body>
</html>
