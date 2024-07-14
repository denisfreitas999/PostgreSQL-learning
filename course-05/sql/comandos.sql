--##########################################################
--######################## Etapa 01 ########################
--##########################################################

-- Trabalhando com Triggers

SELECT * FROM instrutor;
SELECT * FROM log_instrutores;

CREATE OR REPLACE FUNCTION cria_instrutor (nome_instrutor VARCHAR, salario_instrutor DECIMAL) RETURNS void AS $$
    DECLARE
        id_instrutor_inserido INTEGER;
        media_salarial DECIMAL;
        instrutores_recebem_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5, 2);
    BEGIN
        INSERT INTO instrutor (nome, salario) VALUES (nome_instrutor, salario_instrutor) RETURNING id INTO id_instrutor_inserido;
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> id_instrutor_inserido;

        IF salario_instrutor > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (nome_instrutor || ' recebe acima da média.'); 
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> id_instrutor_inserido LOOP
            total_instrutores := total_instrutores + 1;

            IF salario_instrutor > salario THEN
                instrutores_recebem_menos := instrutores_recebem_menos + 1;
            END IF; 
        END LOOP;

        percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;

        INSERT INTO log_instrutores (informacao)
            VALUES (nome_instrutor || ' recebe mais do que ' || percentual || '% da grade de instrutores');
    END;
$$ LANGUAGE plpgsql;


SELECT * FROM cria_instrutor('Marcelo', 950);

SELECT * FROM log_instrutores WHERE id = 2;
UPDATE log_instrutores SET informacao = 'Josiel Alemão recebe mais do que 100.00% da grade de instrutores'
	WHERE id = 2;
UPDATE log_instrutores SET informacao = 'Marcelo recebe acima da média.'
	WHERE id = 3;

SELECT * FROM log_instrutores
	ORDER BY id;

-- GERANDO TRIGGER PARA FUNÇÃO ANTERIOR

CREATE OR REPLACE FUNCTION cria_instrutor () RETURNS TRIGGER AS $$
    DECLARE	
        media_salarial DECIMAL;
        instrutores_recebem_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5, 2);
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média.'); 
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            IF NEW.salario > salario THEN
                instrutores_recebem_menos := instrutores_recebem_menos + 1;
            END IF; 
        END LOOP;

        percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;

        INSERT INTO log_instrutores (informacao)
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');

		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

DROP FUNCTION cria_instrutor;
DELETE FROM instrutor WHERE id = 15;
	
SELECT * FROM instrutor;
SELECT * FROM log_instrutores;

INSERT INTO instrutor (nome, salario) VALUES ('Flávio Santos', 2000);

-- Criando o TRIGGER

CREATE TRIGGER cria_log_instrutores AFTER INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();

--##########################################################
--######################## Etapa 02 ########################
--##########################################################

-- Controle de transações
-- Funções não possuem transações dentro delas
BEGIN;
	SELECT * FROM  instrutor;
ROLLBACK;

INSERT INTO instrutor (nome, salario) VALUES ('Marilia Cardoso', 850);

-- OBS: Transações dentro das PLs são automáticas.


--##########################################################
--######################## Etapa 03 ########################
--##########################################################

-- Tratamento de erros e exceções
CREATE OR REPLACE FUNCTION cria_instrutor () RETURNS TRIGGER AS $$
    DECLARE	
        media_salarial DECIMAL;
        instrutores_recebem_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5, 2);
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média.'); 
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            IF NEW.salario > salario THEN
                instrutores_recebem_menos := instrutores_recebem_menos + 1;
            END IF; 
        END LOOP;

        percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;

        INSERT INTO log_instrutores (informacao, teste)
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores', '');

		RETURN NEW;
	EXCEPTION
		WHEN undefined_column THEN
			RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cria_log_instrutores AFTER INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();

INSERT INTO instrutor (nome, salario) VALUES ('Fernando Rodrigues', 800);
SELECT * FROM instrutor;
SELECT * FROM log_instrutores;

-- Tratamento de erros e exceções, Usando o RAISE para comunicação de erros e mensagens no exception
-- lançando exceções com o RAISE
CREATE OR REPLACE FUNCTION cria_instrutor () RETURNS TRIGGER AS $$
    DECLARE	
        media_salarial DECIMAL;
        instrutores_recebem_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5, 2);
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média.'); 
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            IF NEW.salario > salario THEN
                instrutores_recebem_menos := instrutores_recebem_menos + 1;
            END IF; 
        END LOOP;

        percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;

        INSERT INTO log_instrutores (informacao, teste)
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores', '');

		RETURN NEW;
	EXCEPTION
		WHEN undefined_column THEN
			RAISE NOTICE 'Uma coluna não definida foi buscada na PL';
			RAISE EXCEPTION 'Erro de execução na PL cria_instrutor';
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cria_log_instrutores AFTER INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();

INSERT INTO instrutor (nome, salario) VALUES ('Antônia Vieira', 3000);
SELECT * FROM instrutor;
SELECT * FROM log_instrutores;

-- utilizando o assert para lançar erros e acionar o rollback da transação

CREATE FUNCTION OR REPLACE cria_instrutor() RETURNS void AS $$ 
    DECLARE
        media_salarial DECIMAL;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5,2);
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            IF NEW.salario > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;

        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100;
        ASSERT percentual < 100::DECIMAL;

        INSERT INTO log_instrutores (informacao, teste) 
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores','');

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;


SELECT * FROM instrutor;

INSERT INTO instrutor (nome, salario) VALUES ('João', 6000);

SELECT * FROM log_instrutores;


CREATE FUNCTION cria_instrutor() RETURNS void AS $$ 
    DECLARE
        media_salarial DECIMAL;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5,2);
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            IF NEW.salario > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;

        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100;
        ASSERT percentual < 100::DECIMAL, 'instrutores novos não podem receber mais do que todos os antigos';

        INSERT INTO log_instrutores (informacao, teste) 
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores','');

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

INSERT INTO instrutor (nome, salario) VALUES ('João', 6000);

-- Usando o RAISE NOTICE para depurar código como um log de mensagens
CREATE FUNCTION cria_instrutor() RETURNS void AS $$ 
    DECLARE
        media_salarial DECIMAL;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5,2);
        Logs_inseridos INTEGER;
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            RAISE NOTICE 'Salário inserido: % Salário dos instrutor existente: %', NEW.salario, salario;
            IF NEW.salario > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;

        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100;
        ASSERT percentual < 100::DECIMAL, 'instrutores novos não podem receber mais do que todos os antigos';

        INSERT INTO log_instrutores (informacao, teste) 
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores','');

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

INSERT INTO instrutor (nome, salario) VALUES ('João', 6000);

--##########################################################
--######################## Etapa 04 ########################
--##########################################################

-- Criando cursores
CREATE FUNCTION instrutores_internos(id_instrutor INTEGER) RETURNS refcursor AS $$
    DECLARE
        cursor_salario refcursor;
    BEGIN
        OPEN cursor_salario FOR SELECT instrutor.salario 
                                    FROM instrutor 
                                 WHERE id <> id_instrutor 
                                    AND salario > 0;                         
        RETURN cursor_salario;
    END;
$$ LANGUAGE plpgsql;

DROP FUNCTION cria_instrutor CASCADE;
CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS void AS $$ 
    DECLARE
        media_salarial DECIMAL;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5,2);
        cursor_salarios refcursor;
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
        END IF;

        SELECT instrutores_internos(NEW.id) INTO cursor_salarios; 
        LOOP
            FETCH cursor_salarios INTO salario;
            EXIT WHEN NOT FOUND;
            total_instrutores := total_instrutores + 1;

            IF NEW.salario > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;

        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100;
        ASSERT percentual < 100::DECIMAL, 'instrutores novos não podem receber mais do que todos os antigos';

        INSERT INTO log_instrutores (informacao, teste) 
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores','');

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;


INSERT INTO instrutor (nome, salario) VALUES ('João', 6000);

--##########################################################
--######################## Etapa 05 ########################
--##########################################################

-- Lidando com blocos anônimos

SELECT * FROM instrutor;

DO $$
    DECLARE
        cursor_salarios refcursor;
        salario DECIMAL;
        total_instrutores INTEGER DEFAULT 0;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        percentual DECIMAL;
    BEGIN
        SELECT instrutores_internos(12) INTO cursor_salarios; 
        LOOP
            FETCH cursor_salarios INTO salario;
            EXIT WHEN NOT FOUND;
            total_instrutores := total_instrutores + 1;

            IF 600::DECIMAL > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;
        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100; 

        RAISE NOTICE 'Percentual: %', percentual; 
     END;   
$$;


DO $$
    DECLARE
        cursor_salarios refcursor;
        salario DECIMAL;
        total_instrutores INTEGER DEFAULT 0;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        percentual DECIMAL(5,2);
    BEGIN
        SELECT instrutores_internos(12) INTO cursor_salarios; 
        LOOP
            FETCH cursor_salarios INTO salario;
            EXIT WHEN NOT FOUND;
            total_instrutores := total_instrutores + 1;

            IF 600::DECIMAL > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;
        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100; 

        RAISE NOTICE 'Percentual: % %%', percentual; 
     END;   
$$;




