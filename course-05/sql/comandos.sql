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

