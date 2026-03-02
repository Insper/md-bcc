USE torneio;

ALTER TABLE jogador
    DROP FOREIGN KEY fk_equipe;

ALTER TABLE jogador
    ADD CONSTRAINT fk_equipe 
        FOREIGN KEY (nome_equipe) 
        REFERENCES equipe (nome)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
