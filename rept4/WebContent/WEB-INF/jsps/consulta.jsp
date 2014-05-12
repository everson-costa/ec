<%@page import="model.Usuario"%>
<%@page import="persistence.UsuarioDao"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pesquisa de usuarios</title>
</head>
<body>

<%
//UserBean user = new UserBean();
UsuarioDao usu = new UsuarioDao();
List<Usuario> listausuario = usu.cnt();

%>

	
</body>
</html>