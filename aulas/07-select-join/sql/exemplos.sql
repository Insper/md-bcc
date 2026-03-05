USE senhor_aneis;
SHOW TABLES;

SELECT * FROM personagens;
SELECT * FROM missoes;
SELECT SUM(valor_diaria * qtde_dias) FROM missoes;

SELECT p.id, p.nome, p.raca, m.*
FROM personagens AS p, missoes AS m
WHERE p.id = m.id_personagem
ORDER BY p.nome;


INSERT INTO `senhor_aneis`.`personagens`
(`id`,`nome`,`raca`,`nivel`,`valor_receber`)
VALUES
(500, 'Alex do Reino', 'Human', 2, 0),
(501, 'Thais das Flores', 'Human', 3, 0);


SELECT p.id, p.nome, p.raca, m.*
FROM personagens AS p
LEFT JOIN missoes AS m ON p.id = m.id_personagem
WHERE m.id_personagem is null
ORDER BY p.nome;


USE cartracking;
SELECT COUNT(*) AS qtde FROM cliente;
SELECT * FROM cliente;
SELECT * FROM automovel WHERE idcliente = 4;
SELECT c.idcliente, a.ano, c.nome FROM cliente AS c, automovel AS a;
SELECT c.*, a.* FROM cliente AS c, automovel AS a
WHERE c.idcliente = a.idcliente
ORDER BY c.idcliente;

SELECT c.*, a.*
FROM cliente AS c INNER JOIN automovel AS a ON c.idcliente = a.idcliente
ORDER BY c.idcliente;

SELECT 
    c.*, a.*
FROM
    automovel AS a
        RIGHT OUTER JOIN
    cliente AS c ON c.idcliente = a.idcliente
ORDER BY c.idcliente;