<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <a href="<%=request.getContextPath()%>/home" title="p�gina inicial">rept!4</a><br/>

	<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>
	Pessoal<br/>
		
			<c:forEach items="${usuario_nome_fb}" var="usu">
			
					<h6>id: ${usu.usuario_id_fb}</h6><br/>
					<h3>${usu.usuario_nome_fb}</h3><br/>
					username: ${usu.usuario_username_fb}
				
<!-- 				<script type="text/javascript"> -->
<%--  				alert("${usu.usuario_nome_fb}"); --%>
<!-- 				</script> -->
				
				
			</c:forEach>
		
		
		

	
</body>
</html>