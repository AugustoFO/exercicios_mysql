-- Criação do banco de dados
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

-- Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    descricao_produto VARCHAR(255) NOT NULL,
    preco_produto DECIMAL(7,2) NOT NULL,
    estoque_produto INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Carnes Bovinas', 'Cortes de carne bovina.'),
('Carnes Suínas', 'Cortes de carne suína.'),
('Frangos', 'Cortes e produtos derivados de frango.'),
('Peixes e Frutos do Mar', 'Peixes e frutos do mar frescos.'),
('Outros', 'Produtos complementares e especiais.');

-- Inserção de registros na tabela tb_produtos
INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, estoque_produto, id_categoria)
VALUES
('Picanha', 'Corte premium de carne bovina.', 120.00, 20, 1),
('Costela', 'Costela bovina para churrasco.', 50.00, 30, 1),
('Lombo Suíno', 'Corte suculento de carne suína.', 45.00, 25, 2),
('Filé de Frango', 'Filé de peito de frango.', 25.00, 50, 3),
('Camarão Grande', 'Camarão fresco, ideal para pratos especiais.', 80.00, 15, 4),
('Bacon', 'Carne suína defumada.', 60.00, 40, 2),
('Asas de Frango', 'Ideal para churrasco e assados.', 20.00, 100, 3),
('Salmão', 'Filé fresco de salmão.', 150.00, 10, 4);

-- SELECT produtos com valor maior que R$ 50,00
SELECT nome_produto, preco_produto 
FROM tb_produtos
WHERE preco_produto > 50.00;

-- SELECT produtos com valor entre R$ 50,00 e R$ 150,00
SELECT nome_produto, preco_produto 
FROM tb_produtos
WHERE preco_produto BETWEEN 50.00 AND 150.00;

-- SELECT produtos com a letra 'C' no nome
SELECT nome_produto 
FROM tb_produtos
WHERE nome_produto LIKE '%C%';

-- SELECT com INNER JOIN unindo tb_produtos e tb_categorias
SELECT 
    p.id_produto,
    p.nome_produto,
    p.descricao_produto,
    p.preco_produto,
    p.estoque_produto,
    c.nome_categoria,
    c.descricao_categoria
FROM 
    tb_produtos p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN para produtos de uma categoria específica (ex: Frangos)
SELECT 
    p.id_produto,
    p.nome_produto,
    p.descricao_produto,
    p.preco_produto,
    p.estoque_produto,
    c.nome_categoria,
    c.descricao_categoria
FROM 
    tb_produtos p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria
WHERE 
    c.nome_categoria = 'Frangos';
