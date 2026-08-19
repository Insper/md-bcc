USE megadados;

DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Departamento;

CREATE TABLE Departamento (
  idDepartamento INT NOT NULL,
  nome VARCHAR(80) NOT NULL,
  PRIMARY KEY (idDepartamento)
);

CREATE TABLE Funcionario (
  RG INT NOT NULL,
  orgao VARCHAR(10) NOT NULL,
  nome VARCHAR(80) NOT NULL UNIQUE,
  salario FLOAT NOT NULL DEFAULT 500.0,
  telefone VARCHAR(30),
  idDepartamento INT NOT NULL,
  PRIMARY KEY (RG, orgao),
  FOREIGN KEY (idDepartamento)
    REFERENCES Departamento(idDepartamento),
  CHECK (salario >= 0)
);
