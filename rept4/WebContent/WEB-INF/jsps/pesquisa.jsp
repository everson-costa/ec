<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

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
	<br />
procurar perfil:
	<form name="view" onsubmit="valida()" action="<%=request.getContextPath()%>/respesquisa" method="post">
		<input type=text name="valpesquisa" id="valpesquisa" size="30px" placeholder="digite um nome para pesquisar"/>
		<input type="submit" value="ok" /><br/><br/>
	</form>

</body>
</html>

<!-- http://danielniko.wordpress.com/2012/04/17/simple-crud-using-jsp-servlet-and-mysql/ -->