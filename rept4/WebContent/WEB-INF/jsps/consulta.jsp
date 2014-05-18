<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar perfis</title>
</head>
<body>
	<a href="<%=request.getContextPath()%>/home" title="Pagina Inicial">rept!</a>
	<br />
	<br />

	<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>

	<form name="view" action="<%=request.getContextPath()%>/CntUser"
		method="get">
		<table border="1">
			<tr>
				<td>id</td>
				<td>nome</td>
				<td>username</td>
			</tr>
			<c:forEach items="${usuario_nome_fb}" var="usu">
				<tr>
					<td>${usu.usuario_id_fb}</td>
					<td>${usu.usuario_nome_fb}</td>
					<td>${usu.usuario_username_fb}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="listar" />
	</form>
</body>
</html>

<!-- http://danielniko.wordpress.com/2012/04/17/simple-crud-using-jsp-servlet-and-mysql/ -->