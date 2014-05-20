<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
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
        <title>rept4!</title>
    </head>
    <body>
        <%
        	String nomedeusuario;
        	String urlinformada = "";
        	String idapp = "608680442496976";
        	String secretkey = "32fae65ab04b2cb861b3ca0ebcd2ae6b";
            String chavetoken = "";
            
            nomedeusuario = request.getParameter("username");
            
             //setiver .com/ remove string nome entre .com/ e o ?
            if(nomedeusuario.contains(".com/")){
        	   System.out.print(nomedeusuario+"possui '.com/' ");
        	  String trecho = nomedeusuario.substring(nomedeusuario.lastIndexOf(".com/")+5);
        	  
        	  if(trecho.contains("?")){ //setiver ?, pega entre .com e '?'
        		  String trechofinal = trecho.substring(0, trecho.lastIndexOf("?"));
            	  System.out.println("trecho: "+trechofinal);
            	  nomedeusuario = trechofinal;
            	  
        	  }else if(trecho.contains("photos_all")){  //se tiver photos all, recebe entre .com e /photos
        		  String nomeusuarioaux2 = trecho.substring(0,trecho.lastIndexOf("/photos_all"));
        	  	nomedeusuario = nomeusuarioaux2;
        	  }else{
        		  nomedeusuario = trecho;  //se nao tiver nem ? nem photos all  , mas tem .com  
        	  }
           } //senao tem .com continua com o username parmetro
           
           
             AccessToken acessoChave = new DefaultFacebookClient().obtainAppAccessToken(idapp, secretkey);
             chavetoken= acessoChave.toString();
             String tokenPura = chavetoken.substring(24,67);
             System.out.println("token pura:"+tokenPura);
             
//              AccessToken token_extend = new DefaultFacebookClient().obtainExtendedAccessToken(idapp, secretkey, tokenPura);
//              String token_extendida_strng = token_extend.toString();
//              System.out.println("token extendida: "+token_extendida_strng);
            
          FacebookClient cliente = new DefaultFacebookClient(tokenPura);
          
          String id="";
          String username= "";
          String nome = "";
          String sexo = "";
          String nacionalidade = "";
          String perfil = "";
          String aniversario ="" ;
          String estcivil = "";
          
          try{
          User usuario = cliente.fetchObject(nomedeusuario,User.class);
          id = usuario.getId();
		  username = usuario.getUsername();
          nome = usuario.getName();
          sexo = usuario.getGender();
          nacionalidade = usuario.getLocale();
          perfil = usuario.getLink();
          aniversario = usuario.getBirthday();
          estcivil = usuario.getRelationshipStatus();
          
          }catch (Exception erro){
  		   System.out.println("username: "+nomedeusuario+" não encontrado. verifique se está correto."+erro);
  		   request.getRequestDispatcher("WEB-INF/jsps/erro.jsp").forward(request,response);  
          }
           

            //trata sexo - trata sexo - trata sexo - trata sexo - trata sexo - trata sexo - trata sexo - 

// System.out.println(nome);
// System.out.println(username);
// System.out.println(sexo);
// System.out.println(nacionalidade);
// System.out.println(perfil);
// System.out.println(aniversario);
// System.out.println(estcivil);
            
//             if(sexo.equalsIgnoreCase("male")){
            	
//             	 if (nacionalidade.equals("pt_BR")) {
//                         nacionalidade = "Brasileiro";
//             	 }
//             		sexo = "masculino";
            	
//             	if(estcivil.equalsIgnoreCase("Single")){
//             		estcivil = "Solteiro";
//             		}else if(estcivil.equalsIgnoreCase("married")){
//             			estcivil = "Casado";
//             		}else if(estcivil.equalsIgnoreCase("In a relationship")){
//      				estcivil = "Namorando";
//      				}
            	
//             }else{
            	
//             	 if (nacionalidade.equals("pt_BR")) {
//                      nacionalidade = "Brasileira";
//          	 }
//          		sexo = "femenino";
         	
// 	         	if(estcivil.equalsIgnoreCase("Single")){
// 	         		estcivil = "solteira";
// 	         		}else if(estcivil.equalsIgnoreCase("married")){
// 	         			estcivil = "Casada";
// 	         		}else if(estcivil.equalsIgnoreCase("In a relationship")){
// 	     			estcivil = "Namorando";
// 	     			}
//             }
            
        %>
        <h3>Dados obtidos:</h3><br/>

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
           <br/>
           <form action="<%=request.getContextPath()%>/processamento?par=<%=username%>" method="post">
           <input type="submit" value="ok"/> 
           </form>
           
                 
      
</body>
</html>
