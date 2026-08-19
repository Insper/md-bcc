USE megadados;

ALTER TABLE Funcionario
  ADD COLUMN (
    RG_mentor INT,
    orgao_mentor INT
  );

ALTER TABLE Funcionario
  MODIFY COLUMN
    orgao_mentor VARCHAR(10);

ALTER TABLE Funcionario
  ADD FOREIGN KEY (RG_mentor,orgao_mentor)
    REFERENCES Funcionario(RG, orgao);
