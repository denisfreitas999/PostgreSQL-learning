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
