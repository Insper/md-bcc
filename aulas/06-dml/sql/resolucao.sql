INSERT INTO regiao 
	(regiao, descricao) 
VALUES ('S', 'Sul'), ('NE', 'Nordeste'), ('SE', 'Sudeste'), ('CO', 'Centro-Oeste'), ('N', 'Norte');


INSERT INTO uf
    (uf, descricao, regiao)
VALUES
    ('sp', 'São Paulo', 'SE'),
    ('mg', 'Minas Gerais', 'SE'),
    ('pr', 'Paraná', 'S'),
    ('am', 'Amazonas', 'N'),
    ('ba', 'Bahia', 'NE');
    
UPDATE uf 
SET uf = UPPER(uf) 
WHERE regiao = 'SE';

DELETE FROM uf;

INSERT INTO vendinha.uf
    (uf, descricao, regiao)
VALUES
    ('SP', 'São Paulo', 'SE'),
    ('MG', 'Minas Gerais', 'SE'),
    ('PR', 'Paraná', 'S'),
    ('AM', 'Amazonas', 'N'),
    ('BA', 'Bahia', 'NE');
    
INSERT INTO vendinha.cidade
    (id, descricao, uf)
VALUES
    (20, 'São Paulo', 'SP'),
    (21, 'Campinas', 'SP'),
    (22, 'Salvador', 'BA'),
    (23, 'Manaus', 'AM'),
    (24, 'Belo Horizonte', 'MG'),
    (25, 'São Roque de Minas', 'MG');
    
    
INSERT INTO vendinha.vendedor
    (id, nome, data_nasc, data_cad, ativo)
VALUES
    (100, 'Maria Roque', '1988-01-01', '2023-06-11', 1),
    (101, 'Ana Benedita', '1970-12-09', '2023-07-15', 1),
    (102, 'Silvio Jardim', '1988-12-25', '2023-08-01', 1),
    (103, 'Bruna Fontana', '1981-07-05', '2023-09-01', 1),
    (104, 'Tulio Maravilha', '1978-09-22', '2023-08-07', 1),
    (105, 'Gino Pereira', '1964-04-03', '2023-08-25', 0),
    (106, 'Camila Oliveira', '1992-08-05', '2023-09-01', 1),
    (107, 'Mariana Souza', '1985-08-29', '2023-09-01', 1);
    

DELETE FROM vendedor 
WHERE data_cad >= '2023-08-01'
AND data_cad <= '2023-08-31';

-- INSERT INTO vendedor_vende_cidade
--	(id_vendedor, id_cidade) 
-- SELECT
--	id AS id_vend
-- FROM vendedor
-- WHERE nome = "Bruna Fontana"vendedor_vende_cidade;

INSERT INTO vendedor_vende_cidade 
    (id_vendedor, id_cidade) 
VALUES  
    (103, 20), (103, 21), (102, 20), (102, 24), (102, 25), (106, 23);
    
    
DROP TABLE IF EXISTS vendedor_ativo_dia;
CREATE TABLE vendedor_ativo_dia(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_vendedor INT NOT NULL,
    ativo TINYINT NOT NULL,
    data_registro DATE NOT NULL
);

SELECT
	id, ativo, NOW()
FROM vendedor;

INSERT INTO vendedor_ativo_dia (id_vendedor, ativo, data_registro)
SELECT 	id AS id_vendedor, ativo, DATE(NOW()) AS data_registro
FROM vendedor
WHERE ativo = 1;
