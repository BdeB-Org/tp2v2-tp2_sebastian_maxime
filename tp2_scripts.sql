


CREATE TABLE fabricant (
    id_fabricant NUMBER PRIMARY KEY,
    nom_fabricant VARCHAR2(100) NOT NULL,
    pays_origine VARCHAR2(100)
);

CREATE TABLE genre (
    id_genre NUMBER PRIMARY KEY,
    nom_genre VARCHAR2(100) NOT NULL
);

CREATE TABLE etat_conservation (
    id_etat NUMBER PRIMARY KEY,
    description_etat VARCHAR2(50) NOT NULL
);

CREATE TABLE console (
    id_console NUMBER PRIMARY KEY,
    nom_console VARCHAR2(100) NOT NULL,
    annee_sortie NUMBER(4),
    id_fabricant NUMBER NOT NULL,
     FOREIGN KEY (id_fabricant) REFERENCES fabricant(id_fabricant)
);

CREATE TABLE jeu (
    id_jeu NUMBER PRIMARY KEY,
    titre VARCHAR2(150) NOT NULL,
    annee_sortie NUMBER(4),
    id_console NUMBER NOT NULL,
    id_fabricant NUMBER NOT NULL,
    id_genre NUMBER NOT NULL,
        FOREIGN KEY (id_console) REFERENCES console(id_console),
        FOREIGN KEY (id_fabricant) REFERENCES fabricant(id_fabricant),
        FOREIGN KEY (id_genre) REFERENCES genre(id_genre)
);

CREATE TABLE exemplaire (
    id_exemplaire NUMBER PRIMARY KEY,
    date_acquisition DATE,
    prix_achat NUMBER(8,2),
    notes VARCHAR2(255),
    id_jeu NUMBER NOT NULL,
    id_etat NUMBER NOT NULL,
        FOREIGN KEY (id_jeu)    REFERENCES jeu(id_jeu),
        FOREIGN KEY (id_etat) REFERENCES etat_conservation(id_etat)
);

INSERT INTO fabricant (id_fabricant, nom_fabricant, pays_origine)
VALUES (1, 'Nintendo', 'Japon');

INSERT INTO fabricant (id_fabricant, nom_fabricant, pays_origine)
VALUES (2, 'Sega', 'Japon');

INSERT INTO genre (id_genre, nom_genre)
VALUES (1, 'Plateforme');

INSERT INTO genre (id_genre, nom_genre)
VALUES (2, 'Action');

INSERT INTO etat_conservation (id_etat, description_etat)
VALUES (1, 'Neuf');

INSERT INTO etat_conservation (id_etat, description_etat)
VALUES (2, 'Très bon');

INSERT INTO console (id_console, nom_console, annee_sortie, id_fabricant)
VALUES (1, 'NES', 1983, 1);

INSERT INTO console (id_console, nom_console, annee_sortie, id_fabricant)
VALUES (2, 'Sega Genesis', 1988, 2);

INSERT INTO jeu (id_jeu, titre, annee_sortie, id_console, id_fabricant, id_genre)
VALUES (1, 'Super Mario Bros.', 1985, 1, 1, 1);

INSERT INTO jeu (id_jeu, titre, annee_sortie, id_console, id_fabricant, id_genre)
VALUES (2, 'Sonic the Hedgehog', 1991, 2, 2, 2);

INSERT INTO exemplaire (id_exemplaire, date_acquisition, prix_achat, notes, id_jeu, id_etat)
VALUES (1, DATE '2026-01-10', 40.00, 'Boîte originale', 1, 2);

INSERT INTO exemplaire (id_exemplaire, date_acquisition, prix_achat, notes, id_jeu, id_etat)
VALUES (2, DATE '2026-02-15', 30.00, 'Cartouche seule', 2, 2);