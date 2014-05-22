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



--INSERT INTO test.usuario (usuario_id_fb)
--SELECT * FROM (SELECT '333858585') as temp
--WHERE NOT EXISTS (
--    SELECT * FROM test.usuario WHERE usuario_id_fb = '333858585'
--) LIMIT 1;