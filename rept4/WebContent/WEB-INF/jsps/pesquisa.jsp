<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar perfis</title>
	<script type="text/javascript">
		function valida() {
			var urlinformada=document.forms["view"]["valpesquisa"].value;
			if (urlinformada== "" || x== null) {
				alert("informe um nome para pesquisar.");
				return false;
			}else{
				return true;
			}
		}
	</script>
</head>
<body>
	<a href="<%=request.getContextPath()%>/home" title="Pagina Inicial">rept!</a>
	<br />
	 <div align="right">
 <div class="fb-login-button" autologoutlink="true" data-show-faces="true" data-width="200" data-max-rows="1"></div>
 </div>
	<br />
procurar perfil:
	<form name="view" onsubmit="valida()" action="<%=request.getContextPath()%>/respesquisa" method="post">
		<input type=text name="valpesquisa" id="valpesquisa" size="30px" placeholder="digite um nome para pesquisar"/>
		<input type="submit" value="ok" /><br/><br/>
	</form>

</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/scrir1"></script>
</html>