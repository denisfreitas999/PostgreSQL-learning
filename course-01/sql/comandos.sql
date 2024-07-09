--##########################################################
--######################## Etapa 01 ########################
--##########################################################

-- Criação do banco de dados pelo PSQL
CREATE DATABASE Alura;

-- Verificar bancos
\l

-- Deletar banco de dados
DROP DATABASE Alura;

-- Criando tabela de alunos
CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

-- Buscando tabela de alunos
SELECT * FROM aluno;

--##########################################################
--######################## Etapa 02 ########################
--##########################################################

-- Inserindo dados na tabela
INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Denisson Freitas',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

-- Atualizando dados
UPDATE aluno 
	SET 
		observacao = 'Diminuindo texto da observação.',
		altura = 1.87,
		idade = 27,
		data_nascimento = '1997-01-01'
	WHERE id = 1;

-- Inserindo mais dados

INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES 
(
    'Mariana Silva',
    '23456789012',
    'Estudante dedicada e participativa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nec elit non orci consectetur bibendum non a nulla. In ac urna vitae lorem vestibulum egestas.',
    28,
    250.75,
    1.65,
    TRUE,
    '1996-04-15',
    '14:00:00',
    '2021-09-15 09:45:30'
),
(
    'Carlos Pereira',
    '34567890123',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque venenatis libero nec sapien sodales, sit amet efficitur augue eleifend. Curabitur a erat eu nunc convallis posuere.',
    42,
    350.00,
    1.75,
    FALSE,
    '1982-12-05',
    '10:15:00',
    '2019-06-20 08:20:10'
),
(
    'Ana Oliveira',
    '45678901234',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis condimentum euismod urna vel vehicula. Praesent dignissim, arcu ut laoreet vehicula, urna turpis placerat risus, ac volutpat elit justo eget nunc.',
    22,
    150.80,
    1.68,
    TRUE,
    '2002-03-22',
    '13:45:00',
    '2022-01-10 11:05:15'
),
(
    'Bruno Souza',
    '56789012345',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Integer a felis at augue elementum tristique. Aenean ut velit vitae lacus commodo aliquam eget at nisi.',
    30,
    425.50,
    1.82,
    TRUE,
    '1994-07-18',
    '16:00:00',
    '2020-07-25 14:50:55'
),
(
    'Fernanda Costa',
    '67890123456',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt metus eget purus fermentum, id dignissim lorem laoreet. Nulla at odio vitae urna fermentum pulvinar.',
    26,
    300.20,
    1.70,
    FALSE,
    '1998-11-11',
    '09:30:00',
    '2018-03-30 10:25:40'
);

-- Deletando item da tabela
DELETE FROM aluno
	WHERE id = 5;

--##########################################################
--######################## Etapa 03 ########################
--##########################################################

-- Busca por campos e alias
SELECT nome, idade, matriculado_em AS "data_matricula"
	FROM aluno;

-- Busca utilizando o LIKE, % para cadeias de caracteres e _ (underline) para caractere específico
SELECT *
	FROM aluno
	WHERE nome
	LIKE '%ei%';

SELECT *
	FROM aluno
	WHERE nome
	LIKE '_enisson%';

-- Inserido dado com campo de observação nulo
INSERT INTO aluno (
    nome,
    cpf,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES 
(
    'Diego Silva',
    '23456789059',
    25,
    200.5,
    1.60,
    TRUE,
    '1996-04-20',
    '15:00:00',
    '2021-09-20 09:45:30'
);

-- Traz campos não nulos
SELECT *
	FROM aluno
	WHERE observacao IS NOT NULL;

-- Traz campos nulos
SELECT *
	FROM aluno
	WHERE observacao IS NULL;

-- Operadores >, <, =, >=, <=, <>, !=
SELECT nome, idade
	FROM aluno
	WHERE idade > 25;

SELECT nome, idade
	FROM aluno
	WHERE idade < 25;

SELECT nome, idade
	FROM aluno
	WHERE idade = 25;

SELECT nome, idade
	FROM aluno
	WHERE idade >= 25;

SELECT nome, idade
	FROM aluno
	WHERE idade <= 25;

SELECT nome, idade
	FROM aluno
	WHERE idade <> 25;

SELECT nome, idade
	FROM aluno
	WHERE idade != 25;

-- Operadores AND, OR, BETWEEN

SELECT nome, idade
	FROM aluno
	WHERE idade > 20 AND idade < 30;

SELECT nome, idade
	FROM aluno
	WHERE idade BETWEEN 20 AND 30;

SELECT nome, idade
	FROM aluno
	WHERE idade = 25 OR idade = 27;

--##########################################################
--######################## Etapa 04 ########################
--##########################################################

DROP TABLE aluno;
SELECT * FROM aluno;

-- Criando Tabela de alunos com chave primária e inserindo dados
CREATE TABLE alunos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR (255) NOT NULL,
	idade INTEGER NOT NULL,
	status Boolean NOT NULL
);

SELECT * FROM alunos;

INSERT INTO alunos (nome, idade, status)
	VALUES 
		('Denisson Freitas', 27, true),
		('Benjamin Santos', 20, true);

-- Criando Tabela de curso com chave primária e inserindo dados
CREATE TABLE cursos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR (255) NOT NULL
);

SELECT * FROM cursos;

INSERT INTO cursos (nome)
	VALUES
		('HTML'),
		('Javascript');

-- Criando Tabela de relacionamento entre cursos e alunos
CREATE TABLE aluno_cursos (
	id_aluno INTEGER NOT NULL,
	id_curso INTEGER NOT NULL,
	PRIMARY KEY (id_aluno, id_curso),
	FOREIGN KEY (id_aluno) REFERENCES alunos (id),
	FOREIGN KEY (id_curso) REFERENCES cursos (id)
);

-- Inserção de dados + teste de inserção inválida
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (1,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (2,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (3,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (1,3);

-- Preparando dados para execução do JOIN
SELECT * FROM cursos;
SELECT * FROM alunos;
SELECT * FROM aluno_cursos;
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (2,2);

-- Usando o JOIN
SELECT a.nome AS "Nome do Aluno", c.nome AS "Nome do Curso"
	FROM alunos a
	JOIN aluno_cursos ac ON (a.id = ac.id_aluno)
	JOIN cursos c ON (ac.id_curso = c.id);

-- Usando o LEFT JOIN
SELECT a.nome AS "Nome do Aluno", c.nome AS "Nome do Curso"
	FROM alunos a
	LEFT JOIN aluno_cursos ac ON (a.id = ac.id_aluno)
	LEFT JOIN cursos c ON (ac.id_curso = c.id);

-- Usando o RIGHT JOIN
SELECT a.nome AS "Nome do Aluno", c.nome AS "Nome do Curso"
	FROM alunos a
	RIGHT JOIN aluno_cursos ac ON (a.id = ac.id_aluno)
	RIGHT JOIN cursos c ON (ac.id_curso = c.id);

-- Usando o FULL JOIN
    SELECT a.nome AS "Nome do Aluno", c.nome AS "Nome do Curso"
        FROM alunos a
        FULL JOIN aluno_cursos ac ON (a.id = ac.id_aluno)
        FULL JOIN cursos c ON (ac.id_curso = c.id);

-- Usando o CROSS JOIN
SELECT a.nome AS "Nome do Aluno", c.nome AS "Nome do Curso"
	FROM alunos a
	CROSS JOIN cursos c;

--##########################################################
--######################## Etapa 05 ########################
--##########################################################

-- Recriando a tabela alunos cursos trocando o RESTRICT para CASCADE
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM aluno_cursos;

DROP TABLE aluno_cursos;

-- UTILIZANDO O ON DELETE CASCADE 
CREATE TABLE aluno_cursos (
	id_aluno INTEGER NOT NULL,
	id_curso INTEGER NOT NULL,
	PRIMARY KEY (id_aluno, id_curso),
	FOREIGN KEY (id_aluno) REFERENCES alunos (id)
		ON DELETE CASCADE,
	FOREIGN KEY (id_curso) REFERENCES cursos (id)
		ON DELETE CASCADE
);

INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (1,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (2,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (2,2);

DELETE FROM alunos WHERE id = 2;


-- Recriando a tabela aluno_cursos trocando o UPDATE RESTRICT para UPDATE CASCADE
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM aluno_cursos;

DROP TABLE aluno_cursos;

-- UTILIZANDO O ON UPDATE CASCADE 
CREATE TABLE aluno_cursos (
	id_aluno INTEGER NOT NULL,
	id_curso INTEGER NOT NULL,
	PRIMARY KEY (id_aluno, id_curso),
	FOREIGN KEY (id_aluno) REFERENCES alunos (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_curso) REFERENCES cursos (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

INSERT INTO alunos (nome, idade, status)
	VALUES ('Benjamin Santos', 20, true);

INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (1,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (5,1);
INSERT INTO aluno_cursos (id_aluno, id_curso) VALUES (5,2);

SELECT a.id AS "Id Aluno", a.nome AS "Nome do Aluno", c.nome AS "Nome do Curso"
	FROM alunos a
	FULL JOIN aluno_cursos ac ON (a.id = ac.id_aluno)
	FULL JOIN cursos c ON (ac.id_curso = c.id);

UPDATE alunos SET id = 3 WHERE id = 5;

