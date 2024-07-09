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

