DROP DATABASE IF EXISTS senhor_aneis;
CREATE DATABASE senhor_aneis;
USE senhor_aneis;

DROP TABLE IF EXISTS personagens;

CREATE TABLE personagens (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    raca VARCHAR(50),
    nivel INT,
    valor_receber DECIMAL(10,2)
);

DROP TABLE IF EXISTS missoes;

CREATE TABLE missoes (
    id INT PRIMARY KEY,
    descricao VARCHAR(255),
    valor_diaria DECIMAL(10,2),
    qtde_dias INT,
    id_personagem INT,
    FOREIGN KEY (id_personagem) REFERENCES personagens(id)
);

INSERT INTO personagens (id, nome, raca, nivel, valor_receber)
VALUES (50, 'Frodo Baggins', 'Hobbit', 1, 100.00),
       (51, 'Aragorn', 'Human', 1, 200.00),
       (52, 'Legolas', 'Elf', 1, 3000.00),
       (53, 'Gimli', 'Dwarf', 1, 4000.00),
       (54, 'Gandalf', 'Maia', 1, 5000.00);

INSERT INTO missoes (id, descricao, valor_diaria, qtde_dias, id_personagem)
VALUES (100, 'Levar o Anel para Mordor', 100.0, 180, 50),
       (101, 'Defender Helms Deep', 250.0, 7, 51),
       (102, 'Explorar Fangorn', 300.0, 14, 52),
       (103, 'Ajudar na defesa de Minas Tirith', 500.0, 30, 51),
       (104, 'Buscar ajuda dos Ents', 200.0, 10, 52),
       (105, 'Atacar Isengard', 280.0, 20, 53),
       (106, 'Guiar a Sociedade através de Moria', 400.0, 15, 54),
       (107, 'Convencer Theoden a lutar', 400.0, 5, 51);

