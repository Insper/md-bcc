DROP DATABASE IF EXISTS `af_md_23_2`;
CREATE DATABASE `af_md_23_2`;

USE `af_md_23_2`;

DROP TABLE IF EXISTS `mensagens`;

CREATE TABLE `mensagens` (
  `id` int PRIMARY KEY NOT NULL,
  `col1` varchar(100) NOT NULL,
  `col2` varchar(100) NOT NULL,
  `col3` varchar(100) NOT NULL,
  `mensagem` text
);

INSERT INTO af_md_23_2.`mensagens` (id,col1,col2,col3,mensagem) VALUES
	 (1,'ANA','SILVA','ABACATE','Oi, bom dia'),
	 (2,'MARIA','PEREIRA','PERA','Me liga quando puder'),
	 (3,'JOSE','FERREIRA','ABACATE','Cade vc?'),
	 (4,'ANTONIO','SILVA','MACA','Qual o status do pedido?'),
	 (5,'CAMILA','WOK','PERA','Conseguiu analisar?'),
	 (6,'DANILO','SCHINLE','MACA','Tudo certo pro jantar, vc vem?'),
	 (7,'PEDRO','PACKEL','BANANA','Complicado, vai ter que conferir com ela'),
	 (8,'MANOELA','NANTES','PERA','O lugar era lindo'),
	 (9,'CELSO','ALIVERRI','ABACATE','A visao eh adequada'),
	 (10,'ELLEN','WETLKS','UVA','Vamos juntos');
