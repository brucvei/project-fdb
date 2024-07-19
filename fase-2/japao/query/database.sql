DROP DATABASE IF EXISTS olympic_athletes_normalized;

CREATE DATABASE olympic_athletes_normalized;


CREATE TABLE athletes
(
    id        int NOT NULL AUTO_INCREMENT,
    name      varchar(255) DEFAULT NULL,
    born_date date         DEFAULT NULL,
    born_city varchar(255) DEFAULT NULL,
    height_cm int          DEFAULT NULL,
    weight_kg int          DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE biographical_information
(
    id         int NOT NULL AUTO_INCREMENT,
    athlete_id int          DEFAULT NULL,
    category   varchar(255) DEFAULT NULL,
    detail     varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (athlete_id) REFERENCES athletes (id)
);

CREATE TABLE disciplines
(
    id   int NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE games
(
    id   int NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medals
(
    id         int NOT NULL AUTO_INCREMENT,
    athlete_id int          DEFAULT NULL,
    medal_type varchar(255) DEFAULT NULL,
    count      int          DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (athlete_id) REFERENCES athletes (id)
);

CREATE TABLE results
(
    id            int NOT NULL AUTO_INCREMENT,
    athlete_id    int          DEFAULT NULL,
    game_id       int          DEFAULT NULL,
    discipline_id int          DEFAULT NULL,
    position      varchar(255) DEFAULT NULL,
    medal         varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (athlete_id) REFERENCES athletes (id),
    FOREIGN KEY (game_id) REFERENCES games (id),
    FOREIGN KEY (discipline_id) REFERENCES disciplines (id)
);
