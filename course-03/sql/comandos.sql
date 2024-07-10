--##########################################################
--######################## Etapa 01 ########################
--##########################################################

-- Criando Schemas
CREATE SCHEMA academico;

-- Removendo tabelas do schema public
DROP TABLE aluno, aluno_curso, categoria, curso CASCADE;

-- Recriando tabelas dentro do schema academico
CREATE TABLE academico.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE academico.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE academico.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

CREATE TABLE academico.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

--##########################################################
--######################## Etapa 02 ########################
--##########################################################

-- Criando tabela temporaria e utilizando o CHECK para validar campos
CREATE TEMPORARY TABLE temporaria (
        coluna VARCHAR(255) NOT NULL CHECK (coluna <> '')
);

INSERT INTO temporaria VALUES ('');
INSERT INTO temporaria VALUES ('Denisson');
SELECT * FROM temporaria;


-- Alterando informações da tabela com o ALTER
ALTER TABLE temporaria RENAME TO tabela_temporaria;
SELECT * FROM tabela_temporaria;
ALTER TABLE tabela_temporaria RENAME COLUMN coluna TO primeiro_nome;

--##########################################################
--######################## Etapa 03 ########################
--##########################################################

--##########################################################
-- Dados para preenchimento
--##########################################################

-- Dados para a tabela aluno
INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES
('Mariana', 'Silva', '1996-04-15'),
('Carlos', 'Pereira', '1982-12-05'),
('Ana', 'Oliveira', '2002-03-22'),
('Bruno', 'Souza', '1994-07-18'),
('Fernanda', 'Costa', '1998-11-11'),
('João', 'Ferreira', '1990-09-30'),
('Isabela', 'Martins', '1985-01-17'),
('Pedro', 'Santos', '2000-05-12'),
('Juliana', 'Almeida', '1992-10-25'),
('Ricardo', 'Lima', '1997-07-07');

-- Dados para a tabela categoria
INSERT INTO academico.categoria (nome) VALUES
('Tecnologia'),
('Negócios'),
('Artes'),
('Ciências'),
('Engenharia'),
('Humanidades'),
('Saúde'),
('Matemática'),
('Música'),
('Idiomas');

-- Dados para a tabela curso
INSERT INTO academico.curso (nome, categoria_id) VALUES
('Introdução à Programação', 1),
('Gestão de Projetos', 2),
('Desenho Artístico', 3),
('Biologia Molecular', 4),
('Engenharia de Software', 5),
('Filosofia Moderna', 6),
('Anatomia Humana', 7),
('Álgebra Linear', 8),
('Teoria Musical', 9),
('Espanhol Básico', 10),
('Desenvolvimento Web', 1),
('Marketing Digital', 2),
('Pintura a Óleo', 3),
('Física Quântica', 4),
('Engenharia Civil', 5),
('Psicologia', 6),
('Nutrição e Dietética', 7),
('Estatística', 8),
('Composição Musical', 9),
('Francês Intermediário', 10);

-- Dados para a tabela aluno_curso
INSERT INTO academico.aluno_curso (aluno_id, curso_id) VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 7),
(3, 3),
(3, 8),
(4, 4),
(4, 9),
(5, 5),
(5, 10),
(6, 1),
(6, 6),
(7, 2),
(7, 7),
(8, 3),
(8, 8),
(9, 4),
(9, 9),
(10, 5),
(10, 10),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(5, 1),
(6, 3),
(7, 4),
(8, 4),
(9, 1),
(9, 2),
(10, 3),
(10, 4),
(10, 7);

-- Executando buscas em tabelas com schemas específicos
SELECT * FROM academico.categoria;
SELECT * FROM academico.curso;

SELECT cur.id AS "ID do Curso", cur.nome AS "Nome do Curso"
	FROM academico.curso cur
	WHERE categoria_id = 1;

-- Criando tabelas temporarias e alimentando-as a partir de um query select
CREATE TEMPORARY TABLE cursos_tecnologia (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR (255) NOT NULL
)

INSERT INTO cursos_tecnologia 
	SELECT cur.id AS "ID do Curso", cur.nome AS "Nome do Curso"
	FROM academico.curso cur
	WHERE categoria_id = 1;

SELECT * FROM cursos_tecnologia;

-- Alimentando Tabela de um SCHEMA através de tabelas de outro SCHEMA
CREATE SCHEMA teste;

CREATE TABLE teste.cursos_tecnologia (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR (255) NOT NULL
)

SELECT * FROM teste.cursos_tecnologia;

INSERT INTO teste.cursos_tecnologia 
	SELECT cur.id AS "ID do Curso", cur.nome AS "Nome do Curso"
	FROM academico.curso cur
	WHERE categoria_id = 1;

-- Atualizando dados entre tabelas de schemas diferentes utilizando referências em comum
SELECT id, nome FROM academico.curso 
	WHERE categoria_id = 1;

UPDATE academico.curso SET nome = 'Introdução à Programação e Algoritmos' WHERE id = 1;
UPDATE academico.curso SET nome = 'Desenvolvimento Web: Noções e Fundamentos' WHERE id = 11;

SELECT * FROM teste.cursos_tecnologia;

UPDATE teste.cursos_tecnologia SET nome_curso = nome
	FROM academico.curso
	WHERE teste.cursos_tecnologia.id_curso = academico.curso.id;

-- Transações / BEGIN, ROLLBAK e COMMIT
SELECT * FROM teste.cursos_tecnologia;

-- Retornar alterações
BEGIN;
DELETE FROM teste.cursos_tecnologia;
ROLLBACK;

-- Salvar alterações
BEGIN;
DELETE FROM teste.cursos_tecnologia WHERE id_curso = 11;
COMMIT;
