USE exerciciosgeneration;

CREATE TABLE tb_estudantes (
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    nota DECIMAL(3, 1) NOT NULL, 
    matricula INT NOT NULL PRIMARY KEY 
);

INSERT INTO tb_estudantes (nome, idade, cidade, nota, matricula)
VALUES 
('Ana Silva', 16, 'São Paulo', 8.5, 1001),
('Carlos Pereira', 17, 'Rio de Janeiro', 6.0, 1002),
('Maria Oliveira', 15, 'Belo Horizonte', 9.0, 1003),
('João Santos', 18, 'Porto Alegre', 7.5, 1004),
('Lucas Costa', 16, 'Curitiba', 5.5, 1005),
('Fernanda Alves', 17, 'Recife', 8.0, 1006),
('Pedro Souza', 16, 'Salvador', 10.0, 1007),
('Julia Lima', 15, 'Fortaleza', 6.8, 1008);


SELECT nome, nota
FROM tb_estudantes
WHERE nota > 7.0;

SELECT nome, nota
FROM tb_estudantes
WHERE nota < 7.0;

UPDATE tb_estudantes
SET nota = 7.5
WHERE matricula = 1002;
