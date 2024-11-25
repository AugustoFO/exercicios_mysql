-- Criação do banco de dados
CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

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
('Ferramentas', 'Ferramentas manuais e elétricas para construção e reparos.'),
('Hidráulica', 'Produtos para encanamentos e sistemas de água.'),
('Elétrica', 'Materiais e componentes elétricos.'),
('Tintas', 'Tintas e acessórios para pintura.'),
('Construção', 'Materiais básicos como cimento, tijolos e areia.');

-- Inserção de registros na tabela tb_produtos
INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, estoque_produto, id_categoria)
VALUES
('Martelo', 'Martelo de aço com cabo de madeira.', 50.00, 25, 1),
('Furadeira', 'Furadeira elétrica de 500W.', 200.00, 15, 1),
('Canos PVC', 'Canos de PVC de 1 metro.', 25.00, 100, 2),
('Torneira', 'Torneira de cozinha em inox.', 80.00, 30, 2),
('Fio Elétrico 10mm', 'Rolo de 100 metros de fio elétrico.', 120.00, 20, 3),
('Interruptor Simples', 'Interruptor branco simples.', 20.00, 50, 3),
('Tinta Acrílica', 'Tinta acrílica branca 18L.', 150.00, 10, 4),
('Cimento 50kg', 'Saco de cimento para construção.', 40.00, 100, 5);

-- SELECT produtos com valor maior que R$ 100,00
SELECT nome_produto, preco_produto 
FROM tb_produtos
WHERE preco_produto > 100.00;

-- SELECT produtos com valor entre R$ 70,00 e R$ 150,00
SELECT nome_produto, preco_produto 
FROM tb_produtos
WHERE preco_produto BETWEEN 70.00 AND 150.00;

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

-- SELECT com INNER JOIN para produtos de uma categoria específica (ex: Hidráulica)
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
    c.nome_categoria = 'Hidráulica';
