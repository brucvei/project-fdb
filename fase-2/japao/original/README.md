## Descrição do Banco de Dados

`olympic_athletes_normalized` foi feito a partir da escolha de Japão, com dados extraídos com script a partir de: https://www.olympedia.org/countries/JPN

No MySQL Workbench vá em 'Server' -> 'Data Import' -> 'Import from Self-Contained File' e seleciona a opção 'Dump Structure and Data'

## Estrutura do Banco de Dados

### 1. athletes
- Armazena informações básicas sobre os atletas.
- **Colunas:**
  - `id` (INT, AUTO_INCREMENT, PRIMARY KEY): Identificador único do atleta.
  - `name` (VARCHAR(255), UNIQUE): Nome completo do atleta.
  - `born_date` (DATE): Data de nascimento do atleta.
  - `born_city` (VARCHAR(255)): Cidade natal do atleta.
  - `height_cm` (INT): Altura do atleta em centímetros.
  - `weight_kg` (INT): Peso do atleta em quilogramas.

### 2. biographical_information
- Armazena informações adicionais sobre os atletas.
- **Colunas:**
  - `id` (INT, AUTO_INCREMENT, PRIMARY KEY): Identificador único da informação biográfica.
  - `athlete_id` (INT, FOREIGN KEY): Referência ao identificador único do atleta na tabela `athletes`.
  - `category` (VARCHAR(255)): Categoria da informação biográfica.
  - `detail` (VARCHAR(255)): Detalhe da informação biográfica.

### 3. medals
- Armazena informações sobre as medalhas ganhas pelos atletas.
- **Colunas:**
  - `id` (INT, AUTO_INCREMENT, PRIMARY KEY): Identificador único da medalha.
  - `athlete_id` (INT, FOREIGN KEY): Referência ao identificador único do atleta na tabela `athletes`.
  - `medal_type` (VARCHAR(255)): Tipo de medalha (Ouro, Prata, Bronze).
  - `count` (INT): Quantidade de medalhas desse tipo ganhas pelo atleta.

### 4. games
- Armazena informações sobre as edições dos Jogos Olímpicos.
- **Colunas:**
  - `id` (INT, AUTO_INCREMENT, PRIMARY KEY): Identificador único dos jogos.
  - `name` (VARCHAR(255), UNIQUE): Nome da edição dos jogos (ex: "1968 Summer Olympics").

### 5. disciplines
- Armazena informações sobre as disciplinas esportivas.
- **Colunas:**
  - `id` (INT, AUTO_INCREMENT, PRIMARY KEY): Identificador único da disciplina.
  - `name` (VARCHAR(255), UNIQUE): Nome da disciplina (ex: "Artistic Gymnastics").

### 6. results
- Armazena resultados detalhados das competições.
- **Colunas:**
  - `id` (INT, AUTO_INCREMENT, PRIMARY KEY): Identificador único do resultado.
  - `athlete_id` (INT, FOREIGN KEY): Referência ao identificador único do atleta na tabela `athletes`.
  - `game_id` (INT, FOREIGN KEY): Referência ao identificador único dos jogos na tabela `games`.
  - `discipline_id` (INT, FOREIGN KEY): Referência ao identificador único da disciplina na tabela `disciplines`.
  - `position` (VARCHAR(255)): Posição final do atleta na competição.
  - `medal` (VARCHAR(255)): Medalha recebida (se aplicável).

## Exemplo de uso:

-- Ver todos os atletas
SELECT * FROM athletes;

-- Ver todas as medalhas ganhas por um atleta específico
SELECT a.name, m.medal_type, m.count
FROM medals m
JOIN athletes a ON m.athlete_id = a.id
WHERE a.name = 'Saori Yoshida';

-- Ver resultados de um atleta em uma edição específica dos Jogos Olímpicos
SELECT a.name, g.name AS game, d.name AS discipline, r.position, r.medal
FROM results r
JOIN athletes a ON r.athlete_id = a.id
JOIN games g ON r.game_id = g.id
JOIN disciplines d ON r.discipline_id = d.id
WHERE a.name = 'Saori Yoshida' AND g.name = '2016 Summer Olympics';
