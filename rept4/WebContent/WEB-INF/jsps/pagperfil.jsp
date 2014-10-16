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
 <a href="<%=request.getContextPath()%>/home" title="página inicial">rept!4</a><br/>

	<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>
	<%String idfbload = request.getParameter("per");%>
	<%String meuid = request.getParameter("meuid");%>
	<%String meuid2 = request.getParameter("meuid2");%>
	
	<form name="perf" action="<%=request.getContextPath()%>/LoadProfile" method="get">
			<input type="hidden" name="loadperfil" id="loadperfil" value="<%=idfbload%>"/>
			<input type="hidden" name="meuid" id="meuid" value="<%=meuid%>"/>
			<input type="hidden" name="meuid2" id="meuid2" value="<%=meuid2%>"/>
		<input type="submit" value="ok" /><br/><br/>

	</form>
</body>
</html>