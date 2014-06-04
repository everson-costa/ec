<%@page import="com.sun.org.apache.xml.internal.security.c14n.helper.C14nHelper"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="dt" class="java.util.Date"></jsp:useBean>
<jsp:useBean id="dt2" class="java.util.Date"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
Long ctimes = dt.getTime();
//Cookie c1 = new Cookie("cd1",codtime.toString());
%>
<script type="text/javascript">
function corrk(){
	var val = parseFloat(document.getElementById("rk").innerHTML);
		if(val < 1){
			document.getElementById("rk").style.color="#FF0000";
		}else{
			document.getElementById("rk").style.color="#00FF00";		
		}
	}
	
	function inputs(){
		var idf = document.getElementById("idfb").innerHTML;
		document.getElementById("laique").value=idf;
		document.getElementById("deslai").value=idf;
	}
	
	function checa(){
		<%
		int aux = dt2.getMinutes();
		//int antigo = ctimes;
		//antigo += 1;
		%>
		
		var aux1 = <%=aux%>
<%-- 		var antigoo = <%=antigo%> --%>
// 		document.getElementById("texto1").value=aux1;
		
		if(aux1 > antigoo){
			alert("AUX1:"+aux1+"__"+"TEXTATUAL: "+textaual);
// 		}else{
		alert("menor ainda não------AUX1:"+aux1+"__"+"TEXTATUAL: "+textaual);
		}
		}
	
</script>

</head>
<%-- antigo+1:<%=antigo%> --%>
<br/>
atual<%=aux%><br/>
<body onload="corrk(),inputs()">
 <a href="<%=request.getContextPath()%>/home" title="página inicial">rept!4</a><br/>

	<jsp:useBean id="dao" class="persistence.UsuarioDao"></jsp:useBean>
	Pessoal<br/>
		
			<c:forEach items="${usuario_nome_fb}" var="usu">
					<h6>id:<span id="idfb" name="idfb">${usu.usuario_id_fb}</span></h6><br/>
					<h3>${usu.usuario_nome_fb}</h3>Rank:<h2><span id="rk" name="rk">${usu.ratio}</span></h2><br/>
					username: ${usu.usuario_username_fb}<br/>
<%-- 					<img src="http://graph.facebook.com/${usu.usuario_id_fb}/picture?type=large"/><br/> --%>
					
					<form action="<%=request.getContextPath()%>/Laique" method="post">
						<input type="hidden" id="laique" name="laique" />
						<input type="submit" value="+R!"/>
						<input type="text" id="num1" name="num1" value="<%=ctimes%>" />
					</form>
					
						<form action="<%=request.getContextPath()%>/DesLaique" method="post">
						<input type="hidden" id="deslai" name="deslai" />
						<input type="submit" value="-R!"/>
					</form>
					
			</c:forEach>
</body>
</html>