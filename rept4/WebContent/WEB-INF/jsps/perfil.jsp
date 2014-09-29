<%@page import="java.sql.Time"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body onload="corrk(),inputs(),checaLogado()">
 <a href="<%=request.getContextPath()%>/home" title="página inicial">rept!4</a><br/>
 <div align="right">
<!--  <div class="fb-login-button" autologoutlink="true" data-show-faces="true" data-width="200" data-max-rows="1"></div> -->
  <br/>
  
<input type="button" id="btlogin" name="btlogin" onclick="loginFB()" value="Entrar"/>
 <br/>
<input type="button" id="btlogout" name="btlogout" onclick="sairFB()" value="Sair"/>
 </div>
<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>
	Pessoal<br/>
			<c:forEach items="${usuario_nome_fb}" var="usu">
					<h6>id:<span id="idfb" name="idfb">${usu.usuario_id_fb}</span></h6><br/>
					<h3>${usu.usuario_nome_fb}</h3>Rank:<h2><span id="rk" name="rk">${usu.ratio}</span></h2><br/>
					username: ${usu.usuario_username_fb}<br/>
<%-- 					<img src="http://graph.facebook.com/${usu.usuario_id_fb}/picture?type=large"/><br/> --%>
					
					<form onsubmit="return verIdLogado()" action="<%=request.getContextPath()%>/Laique" method="post" name="fr1" id="fr1">
						<input type="hidden" id="laique" name="laique"/>
						<input type="text" id="meuid" name="meuid"/>
						<input id="r1" name="r1" type="submit" value="+R!" onclick="desativa();"/>
					</form>
					
					<form onsubmit="return verIdLogado()" action="<%=request.getContextPath()%>/DesLaique" method="post">
						<input type="hidden" id="deslai" name="deslai" />
						<input type="text" id="meuid2" name="meuid2"/>
						<input type="submit" value="-R!"/>
					</form>
			</c:forEach>
			
				<input type="button" onclick="getIDfb()" value="mostrar"/>
				<br/>
				<center>
				Suas informações:<br/>
				Nome de usuário (Facebook):<input type="text" id="meuidinfo" name="meuidinfo" />
				ID(Facebook):<input type="text" id="auxnomefb" name="auxnomefb" />??????
				</center>
				
		
${idf}naaaaaada
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/scrir1"></script>
		
<%

//Cookie mycookie = new Cookie("idlogado","dede11111111111111111");
//response.addCookie(mycookie);
//System.out.println(mycookie.getValue());

%>


</html>