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