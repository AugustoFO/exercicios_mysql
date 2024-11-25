-- Criação do banco de dados
CREATE DATABASE db_farmacia;
USE db_farmacia;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(20) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

-- Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(30) NOT NULL,
    descricao_produto VARCHAR(255) NOT NULL,
    preco_produto DECIMAL(5,2) NOT NULL,
    estoque_produto INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Medicamentos', 'Produtos destinados ao tratamento de doenças.'),
('Vitaminas', 'Suplementos vitamínicos para a saúde.'),
('Cosméticos', 'Produtos para cuidados pessoais e estética.'),
('Infantil', 'Produtos destinados ao público infantil.'),
('Higiene', 'Itens para higiene pessoal.');

-- Inserção de registros na tabela tb_produtos
INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, estoque_produto, id_categoria)
VALUES
('Paracetamol', 'Medicamento para febre e dor.', 12.00, 100, 1),
('Vitamina C', 'Suplemento para fortalecer a imunidade.', 25.00, 50, 2),
('Creme Hidratante', 'Hidrata e nutre a pele.', 35.00, 30, 3),
('Fralda G', 'Fralda descartável para bebês.', 55.00, 200, 4),
('Sabonete Líquido', 'Sabonete para cuidados diários.', 10.00, 300, 5),
('Xarope para Tosse', 'Alívio de sintomas de tosse.', 18.00, 80, 1),
('Protetor Solar', 'Protege a pele dos raios UV.', 75.00, 40, 3),
('Shampoo Infantil', 'Produto suave para cabelos infantis.', 20.00, 60, 4);

-- SELECT produtos com valor maior que R$ 50,00
SELECT nome_produto, preco_produto 
FROM tb_produtos
WHERE preco_produto > 50.00;

-- SELECT produtos com valor entre R$ 5,00 e R$ 60,00
SELECT nome_produto, preco_produto 
FROM tb_produtos
WHERE preco_produto BETWEEN 5.00 AND 60.00;

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

-- SELECT com INNER JOIN para produtos de uma categoria específica (ex: Cosméticos)
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
    c.nome_categoria = 'Cosméticos';
