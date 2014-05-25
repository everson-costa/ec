<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>opa...</title>
</head>
<body>
O username que você usou possui um ID que já está cadastrado no sistema.<br/>
${lnkperfil} ou <a href="<%=request.getContextPath()%>/criar" title="voltar e tentar novamente dessa vez com um username correto.">voltar</a>
para criar usando um username diferente.<br/>
<a href="<%=request.getContextPath()%>/home"><u>página inicial</u></a> do rept4!.<br/>

</body>
</html>