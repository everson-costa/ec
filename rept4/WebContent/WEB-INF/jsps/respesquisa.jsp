<%@page import="model.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
// 	window.onload = function() {
// 		document.forms['flista'].submit();
// 	}
</script>


</head>
<body>
 <a href="<%=request.getContextPath()%>/home" title="página inicial">rept!4</a><br/>

	<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>
		<br>
		 <div align="right">
 <div class="fb-login-button" autologoutlink="true" data-show-faces="true" data-width="200" data-max-rows="1"></div>
 </div>
		
	<form name="flista" action="<%=request.getContextPath()%>/CntUser" method="get">
			
		buscar no banco:<input type="text" name="vpesq" id="vpesq"/>
				 
		<input type="submit" value="ok" /><br/><br/>
		
		<table border="1">
			<tr>
				<td>id</td>
				<td>nome</td>
				<td>username</td>
				<td>rt</td>
			</tr>
			<c:forEach items="${usuario_nome_fb}" var="usu">
				<tr>
					<td>${usu.usuario_id_fb}</td>
					<td><a href="<%=request.getContextPath()%>/perf?per=${usu.usuario_id_fb}">${usu.usuario_nome_fb}</a></td>
					<td>${usu.usuario_username_fb}</td>
					<td>${usu.ratio}</td>
				</tr>
			</c:forEach>
		</table>
	
	</form>

</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/scrir1"></script>

</html>

<!-- http://danielniko.wordpress.com/2012/04/17/simple-crud-using-jsp-servlet-and-mysql/ -->