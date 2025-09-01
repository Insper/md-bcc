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