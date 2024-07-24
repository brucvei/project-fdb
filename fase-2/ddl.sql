DROP DATABASE IF EXISTS fdb_2;

CREATE DATABASE fdb_2;

CREATE TABLE Athlete
(
    id   INTEGER NOT NULL PRIMARY KEY,
    name TEXT    NOT NULL,
    sex  CHAR    NOT NULL,
    noc  TEXT    NOT NULL
);

CREATE TABLE Olympic
(
    id     INTEGER NOT NULL PRIMARY KEY,
    name   TEXT    NOT NULL,
    year   integer NOT NULL,
    season TEXT    NOT NULL,
    city   TEXT
);

CREATE TABLE Modality
(
    id    INTEGER NOT NULL PRIMARY KEY,
    name  TEXT    NOT NULL,
    sport TEXT
);

CREATE TABLE Athlete_Modality
(
    id          INTEGER NOT NULL PRIMARY KEY,
    modality_id INT     NOT NULL,
    athlete_id  INT     NOT NULL,
    olympic_id  INT     NOT NULL,
    age         INTEGER,
    height      FLOAT,
    weight      FLOAT,
    FOREIGN KEY (modality_id) REFERENCES Modality (id),
    FOREIGN KEY (athlete_id) REFERENCES Athlete (id),
    FOREIGN KEY (olympic_id) REFERENCES Olympic (id)
);

CREATE TABLE Medals
(
    id         INTEGER NOT NULL PRIMARY KEY,
    type       TEXT    NOT NULL,
    atlhete_id INT     NOT NULL,
    FOREIGN KEY (atlhete_id) REFERENCES Athlete_Modality (id)
);