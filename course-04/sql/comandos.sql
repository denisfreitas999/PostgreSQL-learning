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

-- Retornando conjuntos
INSERT INTO instrutor (nome, salario) VALUES ('Antônio Dias', 200);
INSERT INTO instrutor (nome, salario) VALUES ('Benjamin Santos', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Nidivaldo Alves', 400);
INSERT INTO instrutor (nome, salario) VALUES ('Angela Maria', 500);
INSERT INTO instrutor (nome, salario) VALUES ('Maria José', 600);

SELECT * FROM  instrutor;

-- Criando função para retornar UM CONJUNTO (SETOF) DE INSTRUTORES que recebem mais que determinado valor
CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario >= valor_salario; 
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos(300);
SELECT * FROM instrutores_bem_pagos(400);

-- Criando função para retornar UM CONJUNTO (TABLE) DE INSTRUTORES que recebem mais que determinado valor
CREATE FUNCTION instrutores_bem_pagos2(valor_salario DECIMAL) 
	RETURNS TABLE (id INTEGER, nome VARCHAR, salario DECIMAL) AS $$
		SELECT * FROM instrutor WHERE salario >= valor_salario; 
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos2(300);
SELECT * FROM instrutores_bem_pagos2(400);

-- $$$$$$$$$$$$$ 3 FORMAS DISTINTAS DE TIPAGEM $$$$$$$$$$$$$
-- Criando o tipo com o TYPE
CREATE TYPE dois_valores_inteiros AS (soma INTEGER, produto INTEGER);

CREATE FUNCTION soma_e_produto(primeiro_valor INTEGER, segundo_valor INTEGER) RETURNS dois_valores_inteiros AS $$
	SELECT primeiro_valor + segundo_valor AS soma, primeiro_valor * segundo_valor AS produto;
$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(2,3);

-- Utilizando o OUT
CREATE OR REPLACE FUNCTION soma_e_produto2 (
    IN primeiro_valor INTEGER, 
    IN segundo_valor INTEGER, 
    OUT soma INTEGER, 
    OUT produto INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    soma := primeiro_valor + segundo_valor;
    produto := primeiro_valor * segundo_valor;
END;
$$;

SELECT * FROM soma_e_produto2(3, 5);

-- Utilizando o OUT e RECORD para criar tipos por baixo dos panos
CREATE FUNCTION instrutores_bem_pagos3(valor_salario DECIMAL, OUT nome VARCHAR, OUT salario DECIMAL) 
	RETURNS SETOF record AS $$ 
    SELECT nome, salario FROM instrutor WHERE salario > valor_salario; 
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos3(300);

--##########################################################
--######################## Etapa 03 ########################
--##########################################################