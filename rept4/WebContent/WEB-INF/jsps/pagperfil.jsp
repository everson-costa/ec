<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
  	window.onload = function() { 
		document.forms['perf'].submit(); 
  	} 
 </script> 

</head>
<body>
 <a href="<%=request.getContextPath()%>/home" title="p�gina inicial">rept!4</a><br/>

	<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>
	<%String idfbload = request.getParameter("per");%>
	
	<form name="perf" action="<%=request.getContextPath()%>/LoadProfile" method="get">
			<input type="hidden" name="loadperfil" id="loadperfil" value="<%=idfbload%>"/>
		<input type="submit" value="ok" /><br/><br/>

	</form>
</body>
</html>

<!-- http://danielniko.wordpress.com/2012/04/17/simple-crud-using-jsp-servlet-and-mysql/ -->