DROP DATABASE IF NOT EXISTS test;  
  
CREATE DATABASE test;  
  
USE test;  
  
CREATE TABLE test.`usuario` (
  `usuario_id_fb` varchar(20),
  `usuario_nome_fb` varchar(50) DEFAULT NULL,
  `usuario_username_fb` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usuario_id_fb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE test.`perfil` (
  `usidfb` varchar(20),
  `perlikes` int default null,
  `perdeslikes` int default null,
  `ratio` double (7,2),
   FOREIGN KEY (usidfb) 
        REFERENCES usuario(usuario_id_fb)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
--update test.perfil set perlikes = perlikes +1 where usidfb like '221005259400074';
--select * from test.perfil;
--
--
--update test.perfil set ratio = perlikes-perdeslikes where usidfb like '221005259400074';
--select * from test.perfil order by ratio desc;


--DELIMITER $$
--CREATE PROCEDURE test.criaperfil(id VARCHAR(20))
--     BEGIN
--       insert into test.perfil (usidfb,perlikes,perdeslikes,ratio) values (id,0,1,0);
--     END$$
--
--
--CALL `test`.`criaperfil`('100001988701789');

--DELIMITER $$
--CREATE PROCEDURE test.deslaique(id VARCHAR(20))
--     BEGIN
--       update test.perfil set perdeslikes = perdeslikes +1, ratio = perlikes/perdeslikes where usidfb like id;
--     END$$

--CALL `test`.`deslaique`('100001988701789');




----------------------------------------------------------------------------------------------------------------------
--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
--    pageEncoding="ISO-8859-1"%>
--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
--<html>
--<head>
--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
--<title>Insert title here</title>
--<script type="text/javascript">
--function enable() {
--	var x = document.getElementById("reload");
--	x.value = "Reload";
--	x.disabled = false;
--	}
--
--	function disable() {
--	var x = document.getElementById("reload");
--
--	// do whatever is required when button clicked
--
--	x.value = "Disabled";
--	x.disabled = true;
--	setTimeout('enable()', 15000);
--	}
--
--</script>
--</head>
--<body onload="setTimeout('enable()', 15000)">
--home
--<br/>
--<form action="formu.jsp" method="post">
--<input type="text" id="t1" name="t1"/>
--<input type = "submit" id = "reload" value = "Disabled" onclick = "disable()" disabled>
--</form>
--
--</body>
--</html>
----------------------------------------------------------------------------------------------------
--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
--    pageEncoding="ISO-8859-1"%>
--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
--<html>
--<head>
--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
--</head>
--<body>
--<%@include file="home.jsp" %><br/><br/>
--val:<%=request.getParameter("t1")%>
--</body>
--</html>
