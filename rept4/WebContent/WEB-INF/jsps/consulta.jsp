<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pesquisa de usuarios</title>
</head>
<body>
    <a href="<%=request.getContextPath()%>/home" title="Página Inicial">rept!</a><br/><br/>

daods?
    <table border=1>
        <thead>
            <tr>
                <th>Id</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaUsuarios}" var="usuario">
                <tr>
                    <td><c:out value="${usuario.usuario_id_fb}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>