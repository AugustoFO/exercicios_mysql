CREATE DATABASE exercicioseneration;
USE exerciciosgeneration;

CREATE TABLE tb_colaboradores(
	nome VARCHAR(255) NOT NULL,
	telefone BIGINT NOT NULL,
    cep INT NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    numeroMatricula INT NOT NULL PRIMARY KEY,
    salario DECIMAL(10, 2)
);

INSERT INTO tb_colaboradores (nome, telefone, cep, cidade, numeroMatricula, salario)
VALUES 
('Bruna Portocarrero', 11987654321, 12345678, 'São Paulo', 1001, 3500.00),
('Emanuelly Ferreira', 21987654322, 22334455, 'Rio de Janeiro', 1002, 4000.00),
('Bruno Honorato', 31987654323, 33445566, 'Belo Horizonte', 1003, 3500.00),
('Elon Musk', 41987654324, 44556677, 'Porto Alegre', 1004, 1500.00),
('Tyler Okonma', 51987654325, 55667788, 'Curitiba', 1005, 2800.00);

select nome, salario 
from tb_colaboradores 
where salario > 2000;

select nome, salario 
from tb_colaboradores 
where salario < 2000;

UPDATE tb_colaboradores
SET salario = 10
WHERE numeroMatricula = 1004;
