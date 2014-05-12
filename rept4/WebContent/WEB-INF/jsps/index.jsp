    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
        pageEncoding="ISO-8859-1"%>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
    <title>rept!</title>  
    </head>  
    <body>
    <a href="<%=request.getContextPath()%>/home" title="Página Inicial">rept!</a><br/><br/>
      
       <h3>Inserir usuário no rept!</h3>     
       <form action="EnviarDados?cmd=cadastrar" method="post">  
         
          ID (): <input type="text" name="usuario_id_fb" />  
          <br />
          Nome do Usuário (): <input type="text" name="usuario_nome_fb" />  
          <br />
          Username (): <input type="text" name="usuario_username_fb" />
          <br /><br />  
          <input type="submit" value="Cadastrar Pessoa" />  
            
       </form>
       <a href="<%=request.getContextPath()%>/criar">criar</a>  
       <br /><br />  
       ${msg}<br/><br/>
       pesquisar usuarios:
        <form action="EnviarDados?cmd=cadastrar" method="post">  
         
          ID (Facebook): <input type="text" name="usuario_id_fb" />  
          <br />
          Nome do Usuário (Facebook): <input type="text" name="usuario_nome_fb" />  
          <br />
          Username (Facebook): <input type="text" name="usuario_username_fb" />
          <br /><br />  
          <input type="submit" value="Cadastrar Pessoa" />  
            
       </form>      
    </body>  
    </html>
<!--   teste 2nd commit em master   -->