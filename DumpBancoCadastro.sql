DROP TABLE IF EXISTS `setor`;

CREATE TABLE `setor` (
  `idsetor` int NOT NULL AUTO_INCREMENT,
  `nomesetor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsetor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `setor` WRITE;

INSERT INTO `setor` VALUES (6,'bebidas'),(7,'Limpeza'),(8,'Alimentos');

UNLOCK TABLES;

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `idprodutos` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `fk_setor` int DEFAULT NULL,
  PRIMARY KEY (`idprodutos`),
  KEY `setor_idx` (`fk_setor`),
  CONSTRAINT `setor` FOREIGN KEY (`fk_setor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `produtos` WRITE;

INSERT INTO `produtos` VALUES (4,'Refri 660 ML',20,5.5,6),(7,'Água Sanitária',100,13.50,7);

UNLOCK TABLES;

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `usuarios`: WRITE;

INSERT INTO `usuarios` VALUES (3,'adm','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),(4,'user1','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5');

DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_listaProdutos"()
BEGIN
	select idprodutos,nome,quantidade,preco, setor.nomesetor
    from produtos
	INNER JOIN setor 
			on produtos.fk_setor = idsetor;
    
END;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_insereProduto"(nome varchar(45), quantidade int,preco double, setor int)
BEGIN
INSERT INTO produtos
(
`nome`,
`quantidade`,
`preco`,
`fk_setor`)
VALUES
(
nome,
quantidade,
preco,
setor);

END;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_listaSetor"()
BEGIN
	select * from setor;
END;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_alteraProduto"(idproduto int, nome varchar(45), quantidade int, preco double, setor int)
BEGIN
UPDATE `produtos`
SET
`nome` = nome,
`quantidade` = quantidade,
`preco` = preco,
`fk_setor` = setor
WHERE `idprodutos` = idproduto;

END;;
DELIMITER;

DELIMITER;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_consultaLogin"(usuario varchar(100), senha varchar(100))
BEGIN
Select * from usuarios where usuarios.nome = usuario and usuarios.senha = senha;
END;;
DELIMITER;

DELIMITER;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_insereSetor"(nomeSetor varchar(45))
BEGIN
INSERT INTO `setor`
(`nomesetor`)
VALUES
(nomeSetor);

END;;
DELIMITER;

DELIMITER;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_removeProduto"(idproduto int)
BEGIN
	delete from produtos where idprodutos = idproduto;
END;;
DELIMITER;
