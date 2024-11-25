-- Criação do banco de dados
CREATE DATABASE db_pizzaria;
USE db_pizzaria;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(20) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

-- Criação da tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(30) NOT NULL,
    descricao_pizza VARCHAR(255) NOT NULL,
    preco_pizza DECIMAL(5,2) NOT NULL,
    tempo_preparo_minutos INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Doce', 'Pizzas feitas com recheios doces.'),
('Salgada', 'Pizzas tradicionais com recheios salgados.'),
('Especial', 'Pizzas com ingredientes premium.'),
('Vegetariana', 'Pizzas feitas sem carne, com opções vegetarianas.'),
('Apimentada', 'Pizzas com sabores picantes.');

-- Inserção de registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, descricao_pizza, preco_pizza, tempo_preparo_minutos, id_categoria)
VALUES
('Calabresa', 'Pizza tradicional com calabresa e cebola.', 45.00, 20, 2),
('Quatro Queijos', 'Pizza especial com mistura de quatro queijos.', 60.00, 25, 3),
('Margherita', 'Pizza clássica com molho de tomate e manjericão.', 50.00, 15, 2),
('Chocolate', 'Pizza doce com creme de chocolate e morango.', 35.00, 20, 1),
('Veggie Delight', 'Pizza vegetariana com brócolis, cogumelos e pimentões.', 55.00, 20, 4),
('Frango com Catupiry', 'Pizza salgada com frango desfiado e catupiry.', 48.00, 25, 2),
('Mexicana', 'Pizza apimentada com carne moída, cheddar e jalapeños.', 65.00, 30, 5),
('Banana com Canela', 'Pizza doce de banana com canela e açúcar.', 38.00, 15, 1);

-- SELECT pizzas com valor maior que R$ 45,00
SELECT nome_pizza, preco_pizza 
FROM tb_pizzas
WHERE preco_pizza > 45.00;

-- SELECT pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT nome_pizza, preco_pizza 
FROM tb_pizzas
WHERE preco_pizza BETWEEN 50.00 AND 100.00;

-- SELECT pizzas com a letra 'M' no nome
SELECT nome_pizza 
FROM tb_pizzas
WHERE nome_pizza LIKE '%M%';

-- SELECT com INNER JOIN unindo tb_pizzas e tb_categorias
SELECT 
    p.id_pizza,
    p.nome_pizza,
    p.descricao_pizza,
    p.preco_pizza,
    c.nome_categoria,
    c.descricao_categoria
FROM 
    tb_pizzas p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN para pizzas de uma categoria específica (ex: Doce)
SELECT 
    p.id_pizza,
    p.nome_pizza,
    p.descricao_pizza,
    p.preco_pizza,
    c.nome_categoria,
    c.descricao_categoria
FROM 
    tb_pizzas p
INNER JOIN 
    tb_categorias c
ON 
    p.id_categoria = c.id_categoria
WHERE 
    c.nome_categoria = 'Doce';
