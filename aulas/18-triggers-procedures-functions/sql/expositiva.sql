USE musica;

SELECT COUNT(*)
FROM MUSICA m
WHERE m.Nome_Musica LIKE '%a%';









-- Query para contar músicas com palavra

DROP FUNCTION IF EXISTS conta_musica_tem_string;

DELIMITER //
CREATE FUNCTION conta_musica_tem_string(palavra VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
	DECLARE qtde INT;
    
    SELECT COUNT(*) INTO qtde
	FROM MUSICA m
	WHERE m.Nome_Musica LIKE CONCAT('%',palavra,'%');
    
    RETURN qtde;    
END //
DELIMITER ;


-- Testar funcao
SELECT conta_musica_tem_string('xyz');


SELECT * FROM MUSICA;

-- Como transformar todas as músicas para MAIUSCULO?

SELECT * FROM MUSICA;
UPDATE MUSICA SET Nome_Musica = UPPER(Nome_Musica);
SELECT * FROM MUSICA;








DROP PROCEDURE IF EXISTS transforma_musica;

DELIMITER //
CREATE PROCEDURE transforma_musica ()
BEGIN
	UPDATE MUSICA SET Nome_Musica = UPPER(Nome_Musica);
END //
DELIMITER ;






SELECT * FROM MUSICA;
-- Codigo AQUI! para testar procedure
SELECT * FROM MUSICA;
CALL transforma_musica();
SELECT * FROM MUSICA;

INSERT INTO MUSICA (Codigo_Musica, Nome_Musica, Duracao)
VALUES (1002, 'Hoje programei no MySQL!!!', 200);
SELECT * FROM MUSICA ORDER BY Codigo_Musica DESC;


-- Como inserir uma musica?

-- Como retornar as músicas ordenadas por id desc
SELECT * FROM MUSICA
ORDER BY Codigo_Musica DESC;







DROP TRIGGER IF EXISTS up_case_mus;

DELIMITER //
CREATE TRIGGER up_case_mus BEFORE INSERT ON MUSICA
FOR EACH ROW
BEGIN
	SET NEW.Nome_Musica = UPPER(NEW.Nome_Musica);
END //
DELIMITER ;
