<%@page import="model.Usuario" %>
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    <title>rept!</title>  
    </head>  
    <body>
    <%@include file="../jsps/incs/header.jsp"%>
       <h3>página bem vindo</h3>     
<!--        <form action="EnviarDados?cmd=cadastrar" method="post">   -->
<!--           ID (): <input type="text" name="usuario_id_fb" />   -->
<!--           <br /> -->
<!--           Nome do Usuário (): <input type="text" name="usuario_nome_fb" id="usuario_nome_fb" />   -->
<!--           <br /> -->
<!--           Username (): <input type="text" name="usuario_username_fb" /> -->
<!--           <br /><br />   -->
<!--           <input type="submit" value="Cadastrar Pessoa" />   -->
<!--        </form> -->
       <a href="<%=request.getContextPath()%>/criar">criar um perfil</a>  
       <br /><br />  
       ${msg}<br/><br/>
       pesquisar usuarios:
       
       <a href="<%=request.getContextPath()%>/respesquisa">link pesquisa</a>      
    </body>  
    </html>
<!--   teste 2nd commit em master   -->