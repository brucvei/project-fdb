# Projeto Final - Banco de Dados

_Bruna Caetano e Fischer Matielo_

Austrália nas olimpíadas de 1896 a 2016

## Introdução
Os dados foram retirados do site [Kaggle](https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results) e contém informações sobre os atletas, modalidades, medalhas e olimpíadas. O dataset foi filtrado para conter apenas informações sobre a Austrália.

Os dados eram condensados em apenas um csv, mas foram separados em 5 outros arquivos csv para melhor organização e normalização. Para isso foi utilizado o script `separate-tables.py`.
Depois de separados, com o arquivo `create-querys.py` foram criadas as querys de inserção no banco de dados. 

Na pasta /querys estão arquivos que contém as querys de inserção em cada tabela separados pelas tabelas. O arquivo com todos os comandos é o `comandos.sql`.

O esquema gráfico do banco está no arquivo `esquema-gráfico.pdf`.

## Athlete

| atributo | tipo e informação     |
|----------|:----------------------|
| id       | integer (primary key) |
| name     | text (nome do atleta) |
| sex      | char (sexo do atleta) |

## Olympic

| atributo | tipo e informação     |
|----------|:----------------------|
| id | integer (primary key) |
| name | text (nome da olimpíada, ex: 2016 Summer) |
| year | integer (ano) |
| season | text (estação da olimpíada: Summer ou Winter) |
| city | text (cidade da olimpíada) |

## Modality

| atributo | tipo e informação     |
|----------|-----------------------|
| id | integer (primary key) |
| name | text (nome da modalidade) |
| sport | text (nome do esporte) |

## Athlete_Modality

| atributo | tipo e informação                                 |
|----------|---------------------------------------------------|
| id | integer (primary key)                             |
| athlete_id | integer (id do atleta que competiu na modalidade) |
| modality_id | integer (id da modalidade)                        |
| olympic_id | integer (id da olimpíada)                         |
| age | integer (idade do atleta na olimpíada)            |
| height | double (altura do atleta)                         |
| weight | double (peso do atleta)                           |


## Medals

| atributo | tipo e informação     |
|----------|-----------------------|
| id | integer (primary key) |
| athlete_id | integer (id do atleta na modalidade) |
| type | text (tipo da medalha: Gold, Silver, Bronze) |