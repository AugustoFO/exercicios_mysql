USE exerciciosgeneration;

CREATE TABLE tb_produtos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	quantidade BIGINT,
    valor DECIMAL(10, 2),
    categoria VARCHAR(255) NOT NULL,
    peso DECIMAL(10, 3)
);

INSERT INTO tb_produtos (nome, quantidade, valor, categoria, peso)
VALUES 
('Arroz 5kg', 50, 25.00, 'Alimentos', 5000.000), 
('Feijão 1kg', 100, 8.50, 'Alimentos', 1000.000),
('Camiseta Branca', 200, 29.90, 'Roupas', 200.000),
('Calça Jeans', 150, 89.90, 'Roupas', 500.000),
('Cadeira Escritório', 30, 250.00, 'Móveis', 7000.000),
('Teclado Mecânico', 80, 180.00, 'Eletrônicos', 1200.000),
('Fone de Ouvido Bluetooth', 120, 150.00, 'Eletrônicos', 350.000),
('Notebook HP', 40, 3500.00, 'Eletrônicos', 23000.000),
('Sofá 3 Lugares', 20, 1500.00, 'Móveis', 30000.000);

select nome 
from tb_produtos 
where valor > 500;

select nome 
from tb_produtos 
where valor < 500;

UPDATE tb_produtos
SET valor = 9.50
WHERE id = 2;