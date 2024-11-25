-- Criação do banco de dados
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE tb_classes(
	id_classe INT AUTO_INCREMENT PRIMARY KEY,
	nome_classe VARCHAR(15) NOT NULL,
    descricao_classe VARCHAR(255) NOT NULL
);

-- Criação da tabela tb_personagens
CREATE TABLE tb_personagens(
	id_personagem INT AUTO_INCREMENT PRIMARY KEY,
    nome_personagem VARCHAR(25) NOT NULL,
    descricao_personagem VARCHAR(255) NOT NULL,
    vida_personagem INT NOT NULL,
    ataque_personagem INT,
    cura_personagem INT,
    defesa_personagem INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)

);    

-- Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (nome_classe, descricao_classe)
VALUES
("Feitiçeiro", "Responsável pela magia"),
("Curandeiro", "Detém conhecimentos em técnicas de cura"),
("Guerreiro", "Detém as melhores técinas de combate"),
("Estrategista", "Detém as melhores técnicas de planejamento"),
("Líder", "Principal conciliador e responsável");

-- Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (nome_personagem, descricao_personagem, vida_personagem, ataque_personagem, cura_personagem, defesa_personagem, id_classe)
VALUES
("Roxane", "Guerreira esbelta e amável, mas conhecida por sua destemível garra e força bruta.", 100000, 35000, null, 1500, 3),
("Thalion", "Elfo estrategista com habilidade única de planejar batalhas e derrotar inimigos com precisão.", 80000, 25000, null, 15000, 4),
("Morgana", "Feiticeira poderosa, capaz de conjurar feitiços devastadores e manipular o campo de batalha.", 70000, 30000, null, 10000, 1),
("Elenwen", "Curandeira hábil que protege seu grupo com magia curativa e resistência impressionante.", 60000, null, 40000, 12000, 2),
("Darius", "Guerreiro imponente, mestre no combate com espadas e escudos, garantindo a segurança de seus aliados.", 120000, 40000, null, 25000, 3),
("Kael", "Líder natural, conhecido por sua habilidade de inspirar aliados e coordenar estratégias complexas.", 90000, 20000, null, 18000, 5),
("Sylvara", "Arqueira ágil e letal, com uma conexão profunda com a natureza que a guia em combate.", 85000, 27000, null, 13000, 3),
("Ocrin", "Feiticeiro sombrio que canaliza poder através de artefatos antigos para dominar seus inimigos.", 65000, 35000, null, 2000, 1),
("Liora", "Maga brilhante que combina ataques destrutivos e defesa mágica, protegendo seus aliados.", 75000, 28000, 5000, 15000, 1);

-- SELECT ataque maior que 2000
SELECT nome_personagem FROM tb_personagens WHERE ataque_personagem > 2000;

-- SELECT defesa entre 1000 e 2000
SELECT nome_personagem FROM tb_personagens WHERE defesa_personagem BETWEEN 1000 AND 2000;

-- SELECT personagens com letra C em seu nome
SELECT nome_personagem, descricao_personagem
WHERE nome_personagem LIKE '%C%';

-- SELECT com INNER JOIN unindo tb_clases e tb_cpersonagens
SELECT 
    p.id_personagem,
    p.nome_personagem,
    p.vida_personagem,
    p.ataque_personagem,
    p.cura_personagem,
    p.defesa_personagem,
    c.nome_classe,
    c.descricao_classe
FROM 
    tb_personagens p
INNER JOIN 
    tb_classes c
ON 
    p.id_classe = c.id_classe;
   
-- SELECT com INNER JOIN para personagens de uma classe específica (ex: Feitiçeiro)    
SELECT 
    p.id_personagem,
    p.nome_personagem,
    p.vida_personagem,
    p.ataque_personagem,
    p.cura_personagem,
    p.defesa_personagem,
    c.nome_classe,
    c.descricao_classe
FROM 
    tb_personagens p
INNER JOIN 
    tb_classes c
ON 
    p.id_classe = c.id_classe
WHERE 
    c.nome_classe = 'Feitiçeiro';
