--##########################################################
--######################## Etapa 01 ########################
--##########################################################

-- $$$$$$$$$$$$$$$$$$$ Criando funções $$$$$$$$$$$$$$$$$$
-- Corpo de funções
CREATE FUNCTION nome_funcao() RETURNS tipo_funcao AS '
		CORPO DAS FUNÇÃO
	' LANGUAGE SQL;

-- Primeira Função
CREATE FUNCTION academico.primeira_funcao() RETURNS INTEGER AS '
		SELECT (5 - 3) * 2
	' LANGUAGE SQL;

SELECT academico.primeira_funcao() AS resultado_primeiras_funcao;
SELECT * FROM academico.primeira_funcao() AS resultado_primeiras_funcao;

-- Segunda função | Com parâmetros
CREATE FUNCTION academico.soma_dois_numeros(primeiro_numero INTEGER, segundo_numero INTEGER) 
	RETURNS INTEGER AS '
		SELECT primeiro_numero + segundo_numero
	' LANGUAGE SQL;

SELECT academico.soma_dois_numeros(1,2);

CREATE FUNCTION academico.multiplica_dois_numeros(INTEGER, INTEGER) 
	RETURNS INTEGER AS '
		SELECT $1 + $2
	' LANGUAGE SQL;

SELECT academico.multiplica_dois_numeros(2,2);

-- Criando uma função de inserção na tabela aluno
SELECT * FROM academico.aluno;

CREATE FUNCTION academico.inserir_aluno(primeiro_nome VARCHAR, ultimo_nome VARCHAR, data_nascimento DATE)
	RETURNS VARCHAR AS '
		INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) 
			VALUES (primeiro_nome, ultimo_nome, data_nascimento);
	
		SELECT primeiro_nome;
	' LANGUAGE SQL;

SELECT academico.inserir_aluno('Marcelo Henrique', 'Lima Barreto', '2000-11-07');

-- Sobrescrevendo função

CREATE OR REPLACE FUNCTION academico.inserir_aluno 
	(primeiro_nome VARCHAR, ultimo_nome VARCHAR, data_nascimento DATE)
	RETURNS VOID AS '
		INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) 
			VALUES (primeiro_nome, ultimo_nome, data_nascimento)
	' LANGUAGE SQL;

DROP FUNCTION academico.inserir_aluno(character varying,character varying,date);
SELECT academico.inserir_aluno('Marcelo Henrique', 'Lima Barreto', '2000-11-07');
SELECT * FROM academico.aluno;
DELETE FROM academico.aluno
	WHERE id BETWEEN 11 AND 13;

-- Delimitação $$ $$ para utilizar strings dentro das funções
CREATE FUNCTION academico.mock_aluno() RETURNS VOID AS $$
	INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento)
		VALUES ('Benjamin', 'Freitas', '2018-05-14');
$$ LANGUAGE SQL;

SELECT academico.mock_aluno();
SELECT * FROM academico.aluno;

--##########################################################
--######################## Etapa 02 ########################
--##########################################################


-- Criando tabela instrutor no schema public
CREATE TABLE instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR (255) NOT NULL,
	salario DECIMAL (10,2)
);

SELECT * FROM instrutor;

INSERT INTO instrutor (nome, salario) VALUES ('Denisson Freitas', 100);

-- Criando funções que recebem uma tabela como parâmetro (Parâmetro composto)
CREATE FUNCTION dobra_salario(instrutor) RETURNS DECIMAL AS $$
		SELECT $1.salario * 2 AS salario_dobro_instrutor;
	$$ LANGUAGE SQL;

SELECT *, dobra_salario(instrutor.*) FROM  instrutor;
SELECT nome, dobra_salario(instrutor.*) FROM  instrutor;
SELECT nome, dobra_salario(instrutor.*) AS desejo FROM  instrutor;

-- Retorno composto
CREATE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	SELECT 2 AS id, 'Nome Falso' AS nome, 200::DECIMAL AS salario;
$$ LANGUAGE SQL;

SELECT * FROM instrutor;
-- Tabela de dados
SELECT * FROM cria_instrutor_falso();
-- Linha de dados
SELECT cria_instrutor_falso();

-- 
