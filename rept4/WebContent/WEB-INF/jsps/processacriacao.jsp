<%@page import="com.restfb.FacebookClient.AccessToken"%>
<%@page import="com.restfb.DefaultWebRequestor"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="com.restfb.*"%>
<%@page import="com.restfb.types.*" %>
<%@page import="com.restfb.DefaultFacebookClient" %>
<%@page import="model.Usuario" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>rept4! processa criacao de perfil</title>
        
        <script type="text/javascript">
        window.onload = function(){
        	  document.forms['formcria'].submit();

        	}
        </script>
    </head>
    <body>
        <%
        	String nomedeusuario;
        	String idapp = "608680442496976";
        	String secretkey = "32fae65ab04b2cb861b3ca0ebcd2ae6b";
            String chavetoken = "";
            nomedeusuario = request.getParameter("par");
           
             AccessToken acessoChave = new DefaultFacebookClient().obtainAppAccessToken(idapp, secretkey);
             chavetoken= acessoChave.toString();
             String tokenPura = chavetoken.substring(24,67);
             //System.out.println("token pura:"+tokenPura);
             
//              AccessToken token_extend = new DefaultFacebookClient().obtainExtendedAccessToken(idapp, secretkey, tokenPura);
//              String token_extendida_strng = token_extend.toString();
//              System.out.println("token extendida: "+token_extendida_strng);
            
          FacebookClient cliente = new DefaultFacebookClient(tokenPura);
          User usuarioproc = cliente.fetchObject(nomedeusuario,User.class);
          
	        String id = usuarioproc.getId();
			String username = usuarioproc.getUsername();
            String nome = usuarioproc.getName();
            String sexo = usuarioproc.getGender();
            String nacionalidade = usuarioproc.getLocale();
            String perfil = usuarioproc.getLink();
            String aniversario = usuarioproc.getBirthday();
            String estcivil = usuarioproc.getRelationshipStatus();

            
        %>
        <h1>Dados obtidos:</h1><br/>

        <table border="1">
            <tr>
                <td> ID:    </td><td><%=id%></td>
            </tr>
            <tr>
                <td>   USERNAME:         </td><td><%=nomedeusuario%></td>
            </tr>
            <tr>
                <td>    NOME:       </td><td><%=nome%></td>
            </tr>
            <tr>
                <td> SEXO:         </td><td><%=sexo%></td>
            </tr>
            <tr>
                <td>       NACIONALIDADE:</td><td><%=nacionalidade%></td>
            </tr>
            <tr>
                <td>ANIVERSÁRIO:    </td><td><%=aniversario%></td>
            </tr>
            <tr>
                <td>STATUS DE RELACIONAMENTO:    </td><td><%=estcivil%></td>
            </tr>            
            <tr>
                <td>LINK DO PERFIL ():</td><td><a href="<%=perfil%>" title="clique para acessar o perfil de <%=nome%>" target="_blank"><%=perfil%></a></td>
            </tr>
            <tr>
                <td>Foto do perfil:</td><td><img title="<%=nome%>" src="http://graph.facebook.com/<%=id%>/picture?type=large"/></td>
            </tr> 
        </table>
        <br/>
         <form action="EnviarDados?cmd=cadastrar" method="post" name="formcria" id="formcria">  
         
          ID ():
          <input type="text" name="idfb" id="idfb" value="<%=id%>" readonly="readonly"/>
          <input type="hidden" name="usuario_id_fb" id="usuario_id_fb" value="<%=id%>" readonly="readonly"/>  
          <br />
          Nome do Usuário ():
          <input type="text" name="nome" id="nome" value="<%=nome%>" readonly="readonly"/>  
          <input type="hidden" name="usuario_nome_fb" id="usuario_nome_fb" value="<%=nome%>" readonly="readonly"/>
          <br />
          Username ():
          <input type="text" name="username" id="username" value="<%=username%>" readonly="readonly" />
          <input type="hidden" name="usuario_username_fb" id="usuario_username_fb" value="<%=username%>" readonly="readonly" />
          
          <br /><br />
            
          <input type="submit" value="Cadastrar Perfil" />
            
       </form>
</body>
</html>
