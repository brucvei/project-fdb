DROP DATABASE IF EXISTS fdb;

CREATE DATABASE fdb;

CREATE TABLE Athlete (
    id     INTEGER      NOT NULL PRIMARY KEY,
    name   varchar[100] NOT NULL,
    sex    varchar[1]   NOT NULL,
    age    INTEGER,
    height INTEGER,
    weight INTEGER
);

CREATE TABLE Olympic (
    id     INTEGER     NOT NULL PRIMARY KEY,
    name   varchar[50] NOT NULL,
    year   integer     NOT NULL,
    season varchar[20] NOT NULL,
    city   varchar[50] NOT NULL
);

CREATE TABLE Modality (
    id    INTEGER      NOT NULL PRIMARY KEY,
    name  varchar[100] NOT NULL,
    sport varchar[50]  NOT NULL
);

CREATE TABLE Athlete_Modality (
    id          INTEGER NOT NULL PRIMARY KEY,
    modality_id INT     NOT NULL,
    athlete_id  INT     NOT NULL,
    olympic_id  INT     NOT NULL,
    FOREIGN KEY (modality_id) REFERENCES Modality (id),
    FOREIGN KEY (athlete_id) REFERENCES Athlete (id),
    FOREIGN KEY (olympic_id) REFERENCES Olympic (id)
);

CREATE TABLE Medals (
    id         INTEGER     NOT NULL PRIMARY KEY,
    type       varchar[50] NOT NULL,
    atlhete_id INT         NOT NULL,
    FOREIGN KEY (atlhete_id) REFERENCES Athlete_Modality (id)
);

ALTER TABLE Athlete
    DROP COLUMN age;
ALTER TABLE Athlete
    DROP COLUMN height;
ALTER TABLE Athlete
    DROP COLUMN weight;

ALTER TABLE Athlete_Modality
    ADD COLUMN age INTEGER;
ALTER TABLE Athlete_Modality
    ADD COLUMN height FLOAT;
ALTER TABLE Athlete_Modality
    ADD COLUMN weight FLOAT;

ALTER TABLE athlete
    ALTER COLUMN name TYPE TEXT;
ALTER TABLE athlete
    ALTER COLUMN sex TYPE char;

ALTER TABLE olympic
    ALTER COLUMN name TYPE TEXT;
ALTER TABLE olympic
    ALTER COLUMN season TYPE TEXT;
ALTER TABLE olympic
    ALTER COLUMN city TYPE TEXT;

ALTER TABLE Modality
    ALTER COLUMN name TYPE TEXT;
ALTER TABLE Modality
    ALTER COLUMN sport TYPE TEXT;

ALTER TABLE Medals
    ALTER COLUMN type TYPE TEXT;