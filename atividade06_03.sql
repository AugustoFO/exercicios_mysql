-- Criação do banco de dados
CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

-- Criação da tabela tb_cursos
CREATE TABLE tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    descricao_curso VARCHAR(255) NOT NULL,
    preco_curso DECIMAL(7,2) NOT NULL,
    carga_horaria INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Programação', 'Cursos relacionados a linguagens de programação.'),
('Design', 'Cursos de design gráfico e interfaces.'),
('Marketing', 'Cursos sobre estratégias de marketing digital.'),
('Dados', 'Cursos sobre análise de dados e ciência de dados.'),
('Negócios', 'Cursos focados em gestão e empreendedorismo.');

-- Inserção de registros na tabela tb_cursos
INSERT INTO tb_cursos (nome_curso, descricao_curso, preco_curso, carga_horaria, id_categoria)
VALUES
('Introdução ao Java', 'Curso básico de Java para iniciantes.', 700.00, 40, 1),
('Web Design Avançado', 'Aprenda a criar interfaces modernas.', 1250.00, 50, 2),
('SEO para Iniciantes', 'Domine os fundamentos de SEO.', 400.00, 20, 3),
('Análise de Dados com Python', 'Curso prático de análise de dados.', 850.00, 60, 4),
('Gestão de Projetos Ágeis', 'Conheça as práticas de Scrum.', 750.00, 35, 5),
('Introdução ao HTML e CSS', 'Construa páginas web do zero.', 300.00, 25, 1),
('Photoshop Essentials', 'Domine o básico do Photoshop.', 600.00, 30, 2),
('Marketing em Redes Sociais', 'Estratégias para impulsionar seu negócio.', 500.00, 20, 3);

-- SELECT cursos com valor maior que R$ 500,00
SELECT nome_curso, preco_curso 
FROM tb_cursos
WHERE preco_curso > 500.00;

-- SELECT cursos com valor entre R$ 600,00 e R$ 1000,00
SELECT nome_curso, preco_curso 
FROM tb_cursos
WHERE preco_curso BETWEEN 600.00 AND 1000.00;

-- SELECT cursos com a letra 'J' no nome
SELECT nome_curso 
FROM tb_cursos
WHERE nome_curso LIKE '%J%';

-- SELECT com INNER JOIN unindo tb_cursos e tb_categorias
SELECT 
    c.id_curso,
    c.nome_curso,
    c.descricao_curso,
    c.preco_curso,
    c.carga_horaria,
    cat.nome_categoria,
    cat.descricao_categoria
FROM 
    tb_cursos c
INNER JOIN 
    tb_categorias cat
ON 
    c.id_categoria = cat.id_categoria;

-- SELECT com INNER JOIN para cursos de uma categoria específica (ex: Programação)
SELECT 
    c.id_curso,
    c.nome_curso,
    c.descricao_curso,
    c.preco_curso,
    c.carga_horaria,
    cat.nome_categoria,
    cat.descricao_categoria
FROM 
    tb_cursos c
INNER JOIN 
    tb_categorias cat
ON 
    c.id_categoria = cat.id_categoria
WHERE 
    cat.nome_categoria = 'Programação';
