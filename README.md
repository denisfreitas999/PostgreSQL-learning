# Projeto: Formação PostgreSQL - Alura Courses Overview

#### Course 01 - Curso Introdutório PostgreSQL (01 - 05)
#### Course 02 - PostgreSQL: Views, Sub-Consultas e Funções (06 - 10) 

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