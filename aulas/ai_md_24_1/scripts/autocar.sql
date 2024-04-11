DROP SCHEMA IF EXISTS autocar;
CREATE SCHEMA autocar;

USE autocar;

DROP TABLE IF EXISTS uf;
CREATE TABLE uf (
    uf_id INT PRIMARY KEY,
    nome VARCHAR(2) NOT NULL
);

DROP TABLE IF EXISTS cidade;
CREATE TABLE cidade (
    cidade_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    uf_id INT NOT NULL,
    CONSTRAINT fk_cidade_uf FOREIGN KEY (uf_id) REFERENCES uf(uf_id)
);

DROP TABLE IF EXISTS cep;
CREATE TABLE cep (
    cep_id INT PRIMARY KEY,
    codigo VARCHAR(8) NOT NULL,
    cidade_id INT NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidade(cidade_id)
);

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    cep_id INT,
    FOREIGN KEY (cep_id) REFERENCES cep(cep_id)
);

-- Tabela de Veículos
DROP TABLE IF EXISTS marca;
CREATE TABLE marca (
    marca_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS modelo;
CREATE TABLE modelo (
    modelo_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    marca_id INT NOT NULL,
    FOREIGN KEY (marca_id) REFERENCES marca(marca_id)
);

DROP TABLE IF EXISTS veiculo;
CREATE TABLE veiculo (
    veiculo_id INT PRIMARY KEY,
    placa VARCHAR(8) NOT NULL,
    modelo_id INT NOT NULL,
    ano INT NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (modelo_id) REFERENCES modelo(modelo_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);


DROP TABLE IF EXISTS status;
CREATE TABLE status (
    status_id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);


-- Tabela de Serviços
DROP TABLE IF EXISTS servico;
CREATE TABLE servico (
    servico_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela de Peças
DROP TABLE IF EXISTS peca;
CREATE TABLE peca (
    peca_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de Funcionários
DROP TABLE IF EXISTS funcionario;
CREATE TABLE funcionario (
    funcionario_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- Tabela de Ordens de Serviço
DROP TABLE IF EXISTS ordem_de_servico;
CREATE TABLE ordem_de_servico (
    ordem_id INT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    descricao TEXT NOT NULL,
    status_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (status_id) REFERENCES status(status_id),
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(veiculo_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(funcionario_id)
);

-- Tabela de Orçamentos criada PROPOSITALMENTE de forma ERRADA!
CREATE TABLE orcamento (
    orcamento_id INT PRIMARY KEY,
    data DATE NOT NULL,
    total DECIMAL(10,2)
);

-- Tabela de Serviços Realizados
DROP TABLE IF EXISTS servico_realizado;
CREATE TABLE servico_realizado (
    servico_realizado_id INT PRIMARY KEY,
    ordem_id INT NOT NULL,
    servico_id INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (ordem_id) REFERENCES ordem_de_servico(ordem_id),
    FOREIGN KEY (servico_id) REFERENCES servico(servico_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(funcionario_id)
);

DROP TABLE IF EXISTS peca_utilizada;
CREATE TABLE peca_utilizada (
    peca_utilizada_id INT PRIMARY KEY,
    ordem_id INT NOT NULL,
    peca_id INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (ordem_id) REFERENCES ordem_de_servico(ordem_id),
    FOREIGN KEY (peca_id) REFERENCES peca(peca_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(funcionario_id)
);

INSERT INTO funcionario (funcionario_id, nome, cargo, salario) VALUES
    (1, 'Kelvin Raios', 'Mecânico', 6500),
    (2, 'Maria Souza', 'Auxiliar', 3800),
    (3, 'João Akwoi', 'Auxiliar', 2500),
    (4, 'Ana Schaws', 'Mecânico', 9500);

INSERT INTO status (status_id, nome) VALUES
    (1, 'Em Andamento'),
    (2, 'Concluído'),
    (3, 'Cancelado');

INSERT INTO uf VALUES (35, 'SP'),
    (21, 'RJ'),
    (31, 'MG'),
    (41, 'PR'),
    (51, 'RS'),
    (61, 'DF');

INSERT INTO cidade VALUES (1, 'São Paulo', 35),
    (2, 'Rio de Janeiro', 21),
    (3, 'Niterói', 21),
    (4, 'Belo Horizonte', 31),
    (5, 'Curitiba', 41),
    (6, 'Porto Alegre', 51),
    (7, 'Brasília', 61),
    (8, 'São Paulo', 35);

INSERT INTO cep VALUES (1, '01001000', 1),
    (2, '20000000', 2),
    (3, '24030000', 3),
    (4, '30120000', 4),
    (5, '80000000', 5),
    (6, '90901000', 6),
    (7, '70002970', 7),
    (8, '01002200', 8);

INSERT INTO cliente VALUES (1, 'João da Silva', '11-98765-4321', 'joao@email.com', 'Rua Ave Maria, 123', 1),
    (2, 'Maria Santos', '11-98765-4322', 'maria@email.com', 'Avenida Brasil, 500', 2),
    (3, 'José Souza', '21-99876-5432', 'jose@email.com', 'Rua do Comércio, 50', 1),
    (4, 'Pedro Pereira', '31-99874-6543', 'pedro@email.com', 'Av. Sete de Setembro, 987', 5),
    (5, 'Ana Paula', '41-99873-7654', 'ana@email.com', 'Rua João XXIII, 300', 1),
    (6, 'Carlos Almeida', '51-99875-4321', 'carlos@email.com', 'Rua Francisco Glicério, 900', 2),
    (7, 'Amanda Costa', '61-99872-4321', 'amanda@email.com', 'SQSW 105 Sul bloco D, apto 401', 7),
    (8, 'Paulo Oliveira', '11-99911-1234', 'paulo@email.com', 'Av. Paulista, 1500', 8);


INSERT INTO marca VALUES
    (1, 'Ford'),
    (2, 'Chevrolet'),
    (3, 'Fiat'),
    (4, 'VW'),
    (5, 'Honda'),
    (6, 'Toyota'),
    (7, 'Renault');

INSERT INTO modelo VALUES
    (1, 'Ka', 3),
    (2, 'Uno', 3),
    (3, 'Celta', 2),
    (4, 'Classic', 2),
    (5, 'Fox', 4),
    (6, 'Gol', 4),
    (7, 'Fit', 5),
    (8, 'HRV', 5),
    (9, 'Corolla', 6),
    (10, 'Yaris', 6),
    (11, 'Sandero', 7),
    (12, 'Logan', 7);

INSERT INTO veiculo VALUES
    (1, 'ABC1234', 1, 2015, 1),
    (2, 'CDE5678', 2, 2010, 1),
    (3, 'FGH9101', 3, 2020, 2),
    (4, 'IJK2345', 4, 2018, 2),
    (5, 'LMN6789', 5, 2016, 3),
    (6, 'OPQ0123', 6, 2014, 3),
    (7, 'RST4567', 7, 2022, 4),
    (8, 'UVW8910', 8, 2021, 4),
    (9, 'XYZ1112', 9, 2019, 5),
    (10, 'ABC1357', 10, 2017, 5),
    (11, 'CDE5689', 11, 2015, 6),
    (12, 'FGH9102', 12, 2013, 6),
    (13, 'IJK2359', 1, 2022, 7),
    (14, 'LMN6798', 4, 2020, 8),
    (15, 'OPQ0129', 9, 2018, 8);


-- Inserindo serviços
INSERT INTO servico (servico_id, nome, descricao, preco) VALUES
    (1, 'Revisão', 'Revisão geral', 150),
    (2, 'Troca de óleo', 'Troca de óleo e filtro', 120),
    (3, 'Limpeza', 'Limpeza interna e externa', 80),
    (4, 'Balanceamento', 'Balanceamento de rodas', 70);

-- Inserindo peças
INSERT INTO peca (peca_id, nome, descricao, preco, estoque) VALUES
    (1, 'Filtro de óleo', 'Filtro de óleo motor', 15, 50),
    (2, 'Pastilhas de freio', 'Conjunto de pastilhas', 75, 20),
    (3, 'Correia dentada', 'Correia dentada do alternador', 120, 10),
    (4, 'Vela de ignição', 'Vela de ignição platinada', 25, 40),
    (5, 'Bobina', 'Bobina de ignição', 100, 30),
    (6, 'Gás freio', 'Cartucho de gás do freio', 35, 15),
    (7, 'Ar condicionado', 'Filtro do ar condicionado', 30, 25),
    (8, 'Suspensão', 'Amortecedor dianteiro esquerdo', 150, 5),
    (9, 'Suspensão', 'Amortecedor traseiro esquerdo', 250, 2),
    (10, 'Bobina', 'Bobina de ignição alta performance', 400, 8);

-- Inserindo ordens
INSERT INTO ordem_de_servico (ordem_id, data_entrada, data_saida, descricao, status_id, veiculo_id, funcionario_id) VALUES
    (1, '2022-01-10', '2022-01-12', 'Troca de óleo e filtro', 2, 1, 1),
    (2, '2022-02-15', NULL, 'Revisão geral', 1, 3, 2),
    (3, '2022-03-03', '2022-03-05', 'Limpeza e balanceamento', 2, 5, 1),
    (4, '2022-04-01', NULL, 'Problema na suspensão', 1, 7, 2),
    (5, '2022-05-10', '2022-05-12', 'Troca de óleo e filtro', 2, 9, 1),
    (6, '2022-06-15', NULL, 'Revisão geral', 1, 11, 2),
    (7, '2022-07-03', '2022-07-05', 'Troca de pastilhas de freio', 2, 13, 1),
    (8, '2022-08-01', NULL, 'Problema no motor', 1, 15, 2),
    (9, '2022-09-10', '2022-09-12', 'Limpeza', 2, 5, 1),
    (10, '2022-10-15', NULL, 'Revisão geral', 1, 11, 2),
    (11, '2022-11-03', '2022-11-05', 'Troca de óleo e filtro', 2, 9, 1),
    (12, '2022-12-01', NULL, 'Problema na suspensão', 1, 7, 2),
    (13, '2022-12-15', NULL, 'Revisão geral', 1, 3, 2),
    (14, '2022-12-30', '2023-01-02', 'Limpeza e balanceamento', 2, 5, 1),
    (15, '2023-01-15', NULL, 'Problema no motor', 1, 15, 2),
    (16, '2023-02-03', NULL, 'Troca de pastilhas de freio', 1, 13, 2);

-- Inserindo serviços realizados
INSERT INTO servico_realizado (servico_realizado_id, ordem_id, servico_id, preco, funcionario_id) VALUES
    (1, 1, 2, 140, 1),
    (2, 3, 1, 150, 1),
    (3, 3, 3, 80, 1),
    (4, 3, 4, 70, 1),
    (5, 5, 2, 145, 1),
    (6, 7, 2, 115, 1),
    (7, 9, 3, 60, 1),
    (8, 11, 2, 120, 1),
    (9, 14, 1, 150, 1),
    (10, 14, 3, 85, 1),
    (11, 14, 4, 70, 1),
    (12, 4, 2, 120, 2),
    (13, 4, 1, 135, 2),
    (14, 8, 2, 130, 2),
    (15, 7, 1, 140, 2),
    (16, 12, 2, 120, 2),
    (17, 13, 1, 150, 2),
    (18, 15, 2, 125, 2),
    (19, 16, 2, 110, 2);

-- Inserindo peças utilizadas
INSERT INTO peca_utilizada (peca_utilizada_id, ordem_id, peca_id, preco, quantidade, funcionario_id) VALUES
    (1, 1, 1, 15, 1, 1),
    (2, 5, 1, 20, 1, 1),
    (3, 6, 2, 85, 4, 1),
    (4, 7, 2, 75, 2, 1),
    (5, 11, 1, 15, 1, 1),
    (6, 14, 4, 25, 2, 1),
    (7, 14, 6, 35, 1, 1),
    (8, 2, 2, 75, 2, 2),
    (9, 4, 1, 15, 1, 2),
    (10, 5, 5, 90, 2, 2),
    (11, 10, 2, 75, 3, 2),
    (12, 12, 3, 120, 1, 2),
    (13, 13, 4, 25, 2, 2),
    (14, 15, 8, 150, 1, 2),
    (15, 16, 2, 75, 4, 2);