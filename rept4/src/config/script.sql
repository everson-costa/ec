DROP DATABASE IF NOT EXISTS test;  
  
CREATE DATABASE test;  
  
USE test;  
  
CREATE TABLE test.`usuario` (
  `usuario_id`MEDIUMINT NOT NULL AUTO_INCREMENT,
  `usuario_id_fb` varchar(20) DEFAULT NULL,
  `usuario_nome_fb` varchar(50) DEFAULT NULL,
  `usuario_username_fb` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



CREATE TABLE test.`perfil` (
  `usidfb` varchar(20),
  `perlikes` int default null,
  `perdeslikes` int default null,
  `ratio` double (7,2),
   FOREIGN KEY (usidfb) 
        REFERENCES usuario(usuario_id_fb)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


update test.perfil set perlikes = perlikes +1 where usidfb like '221005259400074';
select * from test.perfil;


update test.perfil set ratio = perlikes-perdeslikes where usidfb like '221005259400074';
select * from test.perfil order by ratio desc;