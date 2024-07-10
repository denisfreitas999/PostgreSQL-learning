--##########################################################
--######################## Etapa 01 ########################
--##########################################################

-- Verificando criação
SELECT * FROM aluno;
SELECT * FROM categoria;
SELECT * FROM curso;
SELECT * FROM aluno_curso;

--##########################################################
-- Dados para preenchimento
--##########################################################

-- Dados para a tabela aluno
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES
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
INSERT INTO categoria (nome) VALUES
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
INSERT INTO curso (nome, categoria_id) VALUES
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
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES
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
(10, 10);

--##########################################################
--######################## Etapa 02 ########################
--##########################################################

-- Adicionando novos dados
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES
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

-- Relatório: Exibir em lista decrescente os cursos e quantidade de alunos matriculados
SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM aluno_curso;

SELECT c.nome as "Nome do Curso", COUNT(ac.aluno_id) AS "Quantidade Alunos"
	FROM aluno a
	JOIN aluno_curso ac ON (a.id = ac.aluno_id)
	JOIN curso c ON (ac.curso_id = c.id)
	GROUP BY c.nome
	ORDER BY "Quantidade Alunos" DESC;

-- Exibir nome do aluno e quantidade de cursos que ele faz
SELECT a.primeiro_nome AS "Nome", a.ultimo_nome AS "Sobrenome", COUNT(ac.curso_id) "Quantidade de Cursos"
	FROM aluno a
	JOIN aluno_curso ac ON (a.id = ac.aluno_id)
	GROUP BY  1, 2 
	ORDER BY COUNT(ac.curso_id) DESC;

--##########################################################
--######################## Etapa 03 ########################
--##########################################################

-- Usando o IN para checar itens da lista passada
SELECT * FROM curso;
SELECT * FROM categoria;

SELECT * FROM curso WHERE categoria_id IN (1, 2);

-- Queries aninhadas (SUBQUERY)
SELECT * FROM categoria;

SELECT id FROM categoria WHERE nome NOT LIKE '% %';

SELECT * FROM curso WHERE categoria_id IN (
	SELECT id FROM categoria WHERE nome NOT LIKE '% %'
);