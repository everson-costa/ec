<%@page  errorPage="404.jsp"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>rept4!</title>

    </head>
    <body>
        <%@include file="../jsps/incs/header.jsp"%>
	<script type="text/javascript">
		function validaform() {
			var urlinformada=document.forms["fomu"]["username"].value;
			if (urlinformada== "" || urlinformada== null) {
				alert("voc� deve informar uma URL com username v�lido.");
				return false;
			}else{
				return true;
			}
		}
	</script>

        <table border="1">
            <tr>
                <td align="right" width="1024px">
                    <div class="fb-login-button" autologoutlink="true" data-show-faces="true" data-width="200" data-max-rows="1"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="<%=request.getContextPath()%>/home" title="p�gina inicial">rept!4</a><br/>
                        <table border="1">
                        <tr>
                            <td>
                                <form id="fomu" onsubmit="return validaform()" method="post" action="<%=request.getContextPath()%>/criarp">
                                    <legend>Cole em baixo o nome de um usu�rio:</legend><p/>
                                    <a href="#" onclick="ajuda_nome_user();" title="d�vidas sobre o nome de usu�rio?">o que � o nome de usu�rio?</a>
                                    username: <input  type="text" id="username" name="username"/>
                                    <input type="submit" value="vai!"/>
                                </form>
                            </td>
                        </tr>
                     </table>
                </td>
            </tr>
        </table>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/scrir1"></script>
</html>
