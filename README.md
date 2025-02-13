# Projeto: Formação PostgreSQL - Alura Courses Overview

#### Course 01 - Curso Introdutório PostgreSQL (01 - 05)
#### Course 02 - PostgreSQL: Views, Sub-Consultas e Funções (06 - 10) 
#### Course 03 - PostgreSQL: Comandos DML e DDL  (11 - 15) 
#### Course 04 - PostgreSQL: Desenvolva com PL/pgSQL (16 - 21)
#### Course 05 - PostgreSQL: Triggers, transações, erros e cursores (22 - 26)
#### Course 06 - PostgreSQL: administração e otimização do banco (27 - 33)

## Tecnologias Envolvidas
<div style="display: inline_block">
  <img align="center" alt="PostgreSQL" src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"/>
</div>

## Índice

1. [Instalação e Configuração Inicial](#1-instalação-e-configuração-inicial)
2. [Manipulação de Dados Básica](#2-manipulação-de-dados-básica)
3. [Consultas e Filtros](#3-consultas-e-filtros)
4. [Chaves e Relacionamentos](#4-chaves-e-relacionamentos)
5. [Ordenação, Limitação e Funções de Agregação](#5-ordenação-limitação-e-funções-de-agregação)
6. [Conceitos de Chaves e Relacionamentos](#6-conceitos-de-chaves-e-relacionamentos)
7. [Revisão e Prática de Comandos de Manipulação de Dados](#7-revisão-e-prática-de-comandos-de-manipulação-de-dados)
8. [Sub-Consultas e Operador IN](#8-sub-consultas-e-operador-in)
9. [Manipulação de Tipos de Dados](#9-manipulação-de-tipos-de-dados)
10. [Criação e Manipulação de Views](#10-criação-e-manipulação-de-views)
11. [Modelagem de Dados e Schemas](#11-modelagem-de-dados-e-schemas)
12. [Criação e Alteração de Tabelas](#12-criação-e-alteração-de-tabelas)
13. [Inserção e Manipulação de Dados](#13-inserção-e-manipulação-de-dados)
14. [Atualizações e Transações](#14-atualizações-e-transações)
15. [SEQUENCEs e Tipos Personalizados](#15-sequences-e-tipos-personalizados)
16. [Programação no Banco de Dados e Funções](#16-programação-no-banco-de-dados-e-funções)
17. [Trabalhando com Tipos Compostos](#17-trabalhando-com-tipos-compostos)
18. [Introdução ao PLpgSQL](#18-introdução-ao-plpgsql)
19. [Tomada de Decisões e Controle de Fluxo](#19-tomada-de-decisões-e-controle-de-fluxo)
20. [Operações Repetitivas e Estruturas de Loop](#20-operações-repetitivas-e-estruturas-de-loop)
21. [Funções Avançadas e Logs](#21-funções-avançadas-e-logs)
22. [Conceito de Eventos e Triggers](#22-conceito-de-eventos-e-triggers)
23. [Transações no PostgreSQL](#23-transações-no-postgresql)
24. [Erros e Exceções](#24-erros-e-exceções)
25. [Cursores](#25-cursores)
26. [Blocos Anônimos e Boas Práticas](#26-blocos-anônimos-e-boas-práticas)
27. [Papel do DBA e Modelo Cliente-Servidor](#27-papel-do-dba-e-modelo-cliente-servidor)
28. [Cluster do PostgreSQL](#28-cluster-do-postgresql)
29. [Tuning do Banco de Dados](#29-tuning-do-banco-de-dados)
30. [Manutenção do Banco de Dados](#30-manutenção-do-banco-de-dados)
31. [Backup e Restauração](#31-backup-e-restauração)
32. [Query Planner e Índices](#32-query-planner-e-índices)
33. [Controle de Acesso e ROLES](#33-controle-de-acesso-e-roles)

## 1. Instalação e Configuração Inicial

Nesta etapa inicial, foco na instalação e configuração do PostgreSQL e do pgAdmin, além de operações básicas com bancos de dados:

- **Como instalar o PostgreSQL e o pgAdmin**: Passo a passo da instalação dessas ferramentas essenciais.
- **Como conectar ao PostgreSQL, utilizando o terminal e o pgAdmin**: Estabelecendo conexões via terminal e pgAdmin.
- **Como criar o banco de dados pelo terminal e pelo pgAdmin**: Criando novos bancos de dados em ambas as interfaces.
- **Como apagar o banco de dados pelo terminal e pelo pgAdmin**: Removendo bancos de dados de maneira segura.
- **Como criar tabela com os tipos de dados mais comuns**: Criação de tabelas utilizando tipos como SERIAL, VARCHAR, CHAR, TEXT, INTEGER, NUMERIC, BOOLEAN, DATE, TIME, TIMESTAMP.

## 2. Manipulação de Dados Básica

Nesta etapa, foco na manipulação de registros dentro das tabelas:

- **Como incluir um registro na tabela, entendendo a sintaxe de inclusão de cada tipo de campo**: Inserção de dados em tabelas.
- **A efetuar uma consulta simples, para listar os dados da tabela**: Realização de consultas básicas para listar dados.
- **Como alterar um registro na tabela**: Atualização de registros existentes.
- **Como excluir um registro na tabela**: Remoção de registros específicos.

## 3. Consultas e Filtros

Nesta etapa, foco em consultas mais detalhadas e filtros avançados:

- **A selecionar campos específicos da tabela**: Seleção de campos específicos para exibição.
- **Como definir um alias para os nomes dos campos**: Utilização de aliases para renomear campos em consultas.
- **A filtrar registros, utilizando o WHERE para campos do tipo de texto**: Aplicação de filtros utilizando a cláusula WHERE.
- **Operadores =, !=, <>, LIKE e NOT LIKE**: Uso de operadores para filtros de texto.
- **A diferença entre = e LIKE**: Entendendo as diferenças e quando usar cada operador.
- **O funcionamento do caractere % no filtro com LIKE e NOT LIKE**: Uso do caractere curinga % para padrões de texto.
- **O funcionamento do caractere _ no filtro com LIKE e NOT LIKE**: Uso do caractere curinga _ para um único caractere.
- **Como filtrar utilizando IS NULL e IS NOT NULL**: Filtros para valores nulos e não nulos.
- **Como filtrar registros para campos do tipo número, datas e horas**: Filtros utilizando operadores de comparação para números e datas.
- **Como filtrar registros para campos do tipo booleano**: Filtros específicos para campos booleanos.
- **Como funcionam os operadores lógicos AND e OR**: Combinação de condições utilizando operadores lógicos.

## 4. Chaves e Relacionamentos

Nesta etapa, foco nas chaves e relacionamentos entre tabelas:

- **Como funciona a chave primária**: Definição e uso de chaves primárias.
- **Como funcionam os campos que aceitam NULL e que não aceitam NULL (NOT NULL)**: Configuração de campos obrigatórios.
- **Como funciona um campo UNIQUE**: Garantindo unicidade de valores em campos específicos.
- **Como criar uma chave primária**: Definição de chaves primárias em tabelas.
- **Como funciona a chave estrangeira**: Estabelecimento de relacionamentos entre tabelas.
- **Como criar uma chave estrangeira**: Implementação de chaves estrangeiras para integridade referencial.
- **Como criar consultas com relacionamentos**: Uso de INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN e CROSS JOIN para combinar dados de múltiplas tabelas.

## 5. Ordenação, Limitação e Funções de Agregação

Nesta etapa, foco na ordenação, limitação de resultados e uso de funções de agregação:

- **Como ordenar uma consulta**: Ordenação de resultados de consultas.
- **Ordenar utilizando os nomes de campo**: Especificação de campos para ordenação.
- **Ordenar com mais de um campo**: Ordenação por múltiplos critérios.
- **Ordenar por posição do campo**: Uso da posição dos campos na ordenação.
- **Ordenar por ordem Crescente e Decrescente**: Definição de ordens crescente e decrescente.
- **Ordenar com campos de tabelas diferentes**: Ordenação de resultados combinados de múltiplas tabelas.
- **Como limitar quantidade e paginar registros de consulta**: Uso de LIMIT e OFFSET para controlar a quantidade de dados retornados.
- **Como funcionam as funções de agregação**: Utilização de COUNT, SUM, MAX, MIN, AVG para agregação de dados.
- **Como funciona a função de arredondamento ROUND**: Arredondamento de valores numéricos.
- **Como funciona o agrupamento de dados**: Agrupamento de resultados utilizando GROUP BY.
- **A diferença entre DISTINCT e GROUP BY**: Entendendo quando usar DISTINCT e GROUP BY.
- **Onde utilizar o DISTINCT**: Aplicação do DISTINCT para eliminar duplicados.
- **Onde utilizar o GROUP BY**: Uso do GROUP BY para agregação de dados.
- **Como utilizar o GROUP BY com os nomes de campo**: Agrupamento utilizando nomes de campos.
- **Como utilizar o GROUP BY por posição**: Agrupamento utilizando a posição dos campos.
- **Como funcionam os filtros por funções de agrupamento, utilizando HAVING**: Filtragem de resultados agrupados com HAVING.
- **A diferença entre WHERE e HAVING**: Entendendo a aplicação de WHERE e HAVING.
- **Como utilizar o HAVING**: Aplicação de filtros após a agregação de dados.

## 6. Conceitos de Chaves e Relacionamentos

Nesta etapa, foco nos conceitos fundamentais de chaves e relacionamentos:

- **Conceitos de chaves primárias e chaves estrangeiras**: Definição e importância das chaves primárias e estrangeiras.
- **Tipos de relacionamentos**: Exploração dos tipos de relacionamentos em bancos de dados (um-para-um, um-para-muitos, muitos-para-muitos).
- **Como implementar os relacionamentos um-para-um, um-para-muitos e muitos-para-muitos**: Implementação prática de diferentes tipos de relacionamentos.

## 7. Revisão e Prática de Comandos de Manipulação de Dados

Nesta etapa, revisão e prática dos comandos básicos de manipulação de dados:

- **Revisão dos comandos de manipulação de dados (INSERT, UPDATE e DELETE)**: Revisão detalhada dos comandos básicos de manipulação.
- **Praticando relatórios**: Criação e prática de relatórios usando SQL.
- **Exercitando os conceitos de SELECTs, JOINs, etc.**: Prática intensiva de consultas SELECT e uso de JOINs.

## 8. Sub-Consultas e Operador IN

Nesta etapa, foco nas sub-consultas e no operador IN:

- **Utilizando o operador IN**: Uso do operador IN para filtros complexos.
- **Criando sub-consultas**: Criação e utilização de sub-consultas dentro de consultas principais.

## 9. Manipulação de Tipos de Dados

Nesta etapa, foco na manipulação de diferentes tipos de dados:

- **Manipulando diferentes tipos de dados: Datas, Números e Strings**: Técnicas para manipulação de dados de diferentes tipos (datas, números e strings).

## 10. Criação e Manipulação de Views

Nesta etapa, foco na criação e manipulação de Views:

- **Criando e manipulando um View**: Criação e utilização de Views para simplificar e organizar consultas complexas.

## 11. Modelagem de Dados e Schemas

Nesta etapa, foco no conceito de modelagem de dados e organização de tabelas:

- **Conhecendo o conceito de modelagem de dados**: Definição e importância da modelagem de dados no PostgreSQL.
- **Conhecendo sobre schemas no PostgreSQL que nos ajudam a organizar nossas tabelas**: Utilização de schemas para organização eficiente das tabelas.
- **Conversando sobre análise de requisitos e sobre modelos utilizados neste processo**: Discussão sobre a análise de requisitos e os modelos aplicáveis na modelagem de dados.

## 12. Criação e Alteração de Tabelas

Nesta etapa, aprofundamento na criação e modificação de tabelas:

- **Desmembrando a criação de um banco de dados e aprofundando esse conhecimento**: Processo detalhado para criação de um banco de dados.
- **Falando sobre os detalhes ao criar uma tabela**: Considerações importantes na criação de tabelas.
- **Conhecendo o ALTER TABLE para alterar a estrutura de uma tabela**: Utilização do comando ALTER TABLE para modificar tabelas existentes.
- **Vendo a diferença entre comandos DDL e DML**: Diferenças e aplicações dos comandos Data Definition Language (DDL) e Data Manipulation Language (DML).

## 13. Inserção e Manipulação de Dados

Nesta etapa, foco na inserção e manipulação de dados:

- **Entendendo as particularidades da representação de tipos e uso de aspas em SQL**: Regras para representação de tipos de dados e uso de aspas.
- **Conhecendo o comando INSERT SELECT que realiza inserções a partir de uma consulta**: Utilização do comando INSERT SELECT para inserir dados baseando-se em resultados de consultas.
- **Falando sobre importação e exportação de dados em arquivos CSV**: Técnicas para importação e exportação de dados usando arquivos CSV.

## 14. Atualizações e Transações

Nesta etapa, foco nas atualizações de dados e no uso de transações:

- **Conhecendo a sintaxe do UPDATE FROM, que atualiza uma tabela baseando-se em dados de uma consulta**: Atualização de tabelas utilizando dados de outras consultas.
- **Vendo os perigos de uma alteração ou remoção incorreta (sem WHERE, por exemplo)**: Precauções ao realizar alterações ou remoções de dados.
- **Aprendendo a trabalhar com transações**: Conceitos e práticas para trabalhar com transações no PostgreSQL.
- **Vendo como confirmar ou cancelar uma transação**: Comandos para confirmar (COMMIT) ou cancelar (ROLLBACK) uma transação.

## 15. SEQUENCEs e Tipos Personalizados

Nesta etapa, foco em SEQUENCEs e tipos personalizados:

- **Conhecendo as SEQUENCEs do PostgreSQL**: Utilização de SEQUENCEs para gerar valores únicos automaticamente.
- **Aprendendo o que é uma ENUM**: Definição e uso de tipos ENUM no PostgreSQL.
- **Aprendendo a criar um tipo personalizado no banco de dados**: Criação de tipos personalizados para atender necessidades específicas.
- **Conversando sobre como bancos de dados são utilizados na vida real**: Aplicações práticas de bancos de dados no cotidiano.

## 16. Programação no Banco de Dados e Funções

Nesta etapa, foco no propósito de programar diretamente no banco de dados e no conceito de funções:

- **Começando a falar sobre o propósito de programar diretamente no banco de dados**: Entendimento da importância de programação no banco de dados.
- **Conhecendo o conceito de funções no PostgreSQL**: Definição e utilidade de funções no PostgreSQL.
- **Entendendo sobre tipos em parâmetros e retornos de funções**: Tipos de parâmetros e retornos utilizados em funções.
- **Falando sobre como retornar valores em funções escritas em SQL**: Técnicas para retornar valores de funções SQL.

## 17. Trabalhando com Tipos Compostos

Nesta etapa, foco no uso de tipos compostos no PostgreSQL:

- **Entendendo que podemos trabalhar com tipos "compostos"**: Definição e exemplos de tipos compostos.
- **Vendo que podemos representar tipos compostos de diversas formas**:
  - **Definindo seu valor como o registro de uma tabela**.
  - **Como um tipo personalizado do PostgreSQL**.
  - **Com variáveis de saída**.
- **Entendendo como retornar mais de um dado por vez em nossas funções através do SETOF**: Uso do SETOF para múltiplos retornos.
- **Conhecendo um dos possíveis usos para o tipo RECORD**: Aplicações práticas do tipo RECORD.

## 18. Introdução ao PLpgSQL

Nesta etapa, introdução à linguagem PLpgSQL:

- **Entendendo as limitações do SQL quando se trata de programação**: Identificação das limitações do SQL.
- **Conhecendo a linguagem PLpgSQL, que é uma linguagem de Programação Procedural criada pelo PostgreSQL como uma extensão ao SQL**: Definição e propósito do PLpgSQL.
- **Aprendendo sobre a estrutura básica de criação de uma função usando PLpgSQL**: Estrutura fundamental para criar funções com PLpgSQL.
- **Aprendendo a definir variáveis**: Definição e utilização de variáveis em PLpgSQL.
- **Entendendo o conceito de blocos e escopos usando PLpgSQL**: Compreensão de blocos e escopos.

## 19. Tomada de Decisões e Controle de Fluxo

Nesta etapa, foco em decisões e controle de fluxo em PLpgSQL:

- **Vendo como retornar valores utilizando PLpgSQL**: Métodos de retorno de valores.
- **Aprendendo a tomar decisões em nossos códigos usando IF**: Uso do IF para tomadas de decisão.
- **Conseguindo controlar o fluxo de nossa aplicação com ELSEIF e ELSE**: Controle de fluxo com ELSEIF e ELSE.
- **Aprendendo a deixar nosso código um pouco mais legível com CASE**: Melhoria da legibilidade do código com CASE.

## 20. Operações Repetitivas e Estruturas de Loop

Nesta etapa, foco em operações repetitivas e estruturas de loop:

- **Vendo mais uma forma de retornar valores através do RETURN NEXT**: Retorno de valores com RETURN NEXT.
- **Entendendo a necessidade de realizar operações repetidas em determinadas funções**: Justificativa para operações repetitivas.
- **Aprendendo a usar a estrutura LOOP para repetir instruções**: Utilização do LOOP para repetição.
- **Usando EXIT para não cair em um loop infinito**: Prevenção de loops infinitos com EXIT.
- **Conhecendo a estrutura WHILE para facilitar a leitura do LOOP sem precisar do EXIT**: Uso do WHILE para loops.
- **Aprendendo a usar (e quando usar) o famoso FOR**: Aplicação do FOR.
- **Vendo como percorrer o resultado de uma query usando FOR IN**: Iteração sobre resultados de consultas com FOR IN.

## 21. Funções Avançadas e Logs

Nesta etapa, foco em funções avançadas e logs:

- **Criando funções mais próximas da vida real**: Desenvolvimento de funções realistas.
- **Aprendendo sobre a variável automaticamente criada em funções com PLpgSQL chamada FOUND**: Utilização da variável FOUND.
- **Conseguindo realizar logs de operações feitas no banco de dados**: Implementação de logs.
- **Aprendendo a realizar cálculos com conversões de tipos usando PLpgSQL**: Cálculos e conversões de tipos.

## 22. Conceito de Eventos e Triggers

Nesta etapa, foco no conceito de eventos no banco de dados e triggers:

- **Entendendo o conceito de eventos no banco de dados**: Definição e importância de eventos no banco de dados.
- **Aprendendo como criar um Trigger Procedure**: Passos para criar uma Trigger Procedure.
- **Definindo um Trigger que executa uma Trigger Procedure quando um evento ocorre**: Configuração de triggers para eventos específicos.
- **Entendendo a fundo detalhes de triggers como FOR EACH ROW|STATEMENT, etc**: Exploração detalhada das opções FOR EACH ROW e STATEMENT.

## 23. Transações no PostgreSQL

Nesta etapa, foco em transações no PostgreSQL:

- **Vendo que há 2 sintaxes para iniciar uma transação: BEGIN e START TRANSACTION**: Diferenças e usos das sintaxes BEGIN e START TRANSACTION.
- **Entendendo que funções por si só já fazem parte de uma transação**: Compreensão do comportamento transacional de funções.
- **Aprendendo que erros cancelam as alterações de uma função**: Mecanismos de cancelamento de transações em caso de erros.

## 24. Erros e Exceções

Nesta etapa, foco em erros e exceções no PostgreSQL:

- **Aprendendo o que são os erros (ou exceções) do PostgreSQL**: Definição e tipos de erros/exceções.
- **Aprendendo a gerar erros e mensagens com o RAISE**: Uso do RAISE para geração de erros e mensagens.
- **Aprendendo a usar o ASSERT que verifica condições e levanta exceções**: Aplicação do ASSERT para verificação de condições.
- **Entendendo que o RAISE pode ser usado no processo de depuração**: Uso do RAISE para depuração de código.

## 25. Cursores

Nesta etapa, foco no uso de cursores para gestão eficiente de memória:

- **Entendendo o propósito de usar cursores para poupar uso de memória**: Vantagens dos cursores.
- **Vendo como abrir cursores, sendo eles bound ou unbound**: Métodos para abrir cursores bound e unbound.
- **Vendo como manipular cursores com FETCH e MOVE**: Comandos FETCH e MOVE para manipulação de cursores.
- **Usando cursores na prática em um LOOP**: Implementação prática de cursores em loops.

## 26. Blocos Anônimos e Boas Práticas

Nesta etapa, foco em blocos anônimos e boas práticas de programação:

- **Aprendendo a usar blocos anônimos com DO**: Criação e uso de blocos anônimos com a instrução DO.
- **Vendo que blocos anônimos possuem 2 principais propósitos**:
  - **Rodar um script pontual em PLpgSQL**.
  - **Preparar uma função para efetivamente criá-la no futuro**.
- **Entendendo que boas práticas de programação são muito importantes**: Importância das boas práticas no desenvolvimento.
- **Conhecendo algumas outras ferramentas além do PgAdmin, como DataGrip e EMS**: Introdução a ferramentas adicionais para gerenciamento de bancos de dados.

## 27. Papel do DBA e Modelo Cliente-Servidor

Nesta etapa, foco no papel do DBA e no modelo cliente-servidor:

- **Entendendo qual o papel do DBA em uma empresa**: Funções e responsabilidades do DBA.
- **Conhecendo o modelo cliente-servidor em que os bancos de dados funcionam**: Arquitetura e comunicação cliente-servidor.
- **Vendo que o servidor pode receber conexões de diversos clientes**: Capacidade de gerenciamento de múltiplas conexões pelo servidor.

## 28. Cluster do PostgreSQL

Nesta etapa, foco na compreensão e gerenciamento de clusters do PostgreSQL:

- **Entendendo o que é um cluster do PostgreSQL**: Definição e estrutura de um cluster.
- **Aprendendo a inicializar um cluster com o comando initdb**: Passos para iniciar um cluster.
- **Entendendo como gerenciar o serviço do servidor PostgreSQL**: Administração do serviço PostgreSQL.
- **Conhecendo o utilitário pg_ctl**: Uso e funções do utilitário pg_ctl para controle do servidor.

## 29. Tuning do Banco de Dados

Nesta etapa, foco no tuning e otimização do banco de dados:

- **Conversando sobre tuning do banco de dados**: Conceitos e práticas de tuning.
- **Entendendo que a escolha do hardware do servidor é importante, mas que serviços de nuvem abstraem esse detalhe para os DBAs**: Importância do hardware e como a nuvem pode simplificar isso.
- **Conhecendo a pasta data do PostgreSQL onde encontramos o arquivo de configurações**: Localização e importância dos arquivos de configuração.
- **Falando sobre o papel do DBA na gestão do sistema operacional**: Responsabilidades do DBA no contexto do sistema operacional.

## 30. Manutenção do Banco de Dados

Nesta etapa, foco na manutenção do banco de dados:

- **Vendo que há processos de manutenção que podemos/devemos fazer no banco**: Tipos de manutenção necessários.
- **Aprendendo como o PostgreSQL mantém alguns dados “inúteis” por questão de performance**: Gerenciamento de dados obsoletos.
- **Conhecendo o comando VACUUM para limpar espaço em disco**: Uso e importância do comando VACUUM.
- **Vendo como reindexar as tabelas do banco com o comando REINDEX**: Processo de reindexação para melhorar a performance.

## 31. Backup e Restauração

Nesta etapa, foco em técnicas de backup e restauração:

- **Entendendo que há diferentes tipos de backup e conversando sobre como fazê-los**: Tipos de backup e suas aplicações.
- **Vendo que há 2 principais formas de fazer backups**: 
  - Através da linha de comando (usando pg_dump).
  - Através de interfaces gráficas (por exemplo, usando o PgAdmin).
- **Aprendendo como restaurar backups realizados também de 2 formas diferentes**: Métodos de restauração de backups.

## 32. Query Planner e Índices

Nesta etapa, foco no planejador de queries e no uso de índices:

- **Conhecendo o conceito do planejador de queries (Query Planner) do PostgreSQL**: Funcionamento e importância do Query Planner.
- **Aprendendo que o comando EXPLAIN pode nos dar informações sobre como uma query é executada**: Uso do comando EXPLAIN para análise de performance.
- **Aprendendo o que são e como utilizar índices**: Definição e uso de índices para otimização.
- **Vendo que, apesar de serem uma ferramenta muito poderosa, índices nem sempre são a solução**: Limitações e considerações sobre o uso de índices.

## 33. Controle de Acesso e ROLES

Nesta etapa, foco no controle de acesso e gestão de roles:

- **Vendo como permitir ou impedir o acesso ao servidor a partir de algum host**: Configuração de acessos.
- **Conhecendo o arquivo pg_hba.conf, que permite a configuração de acesso ao servidor baseado em hosts**: Estrutura e uso do arquivo pg_hba.conf.
- **Vendo que o PostgreSQL trabalha com um conceito de ROLES, que podem ser como usuários ou grupos**: Definição e gerenciamento de roles.
- **Aprendendo sobre os atributos dos ROLES**: Atributos e permissões das roles.
- **Entendendo que é possível dar ou retirar permissões específicas a ROLES**: Gestão de permissões e segurança.