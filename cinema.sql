CREATE DATABASE cinema;

CREATE TABLE administrateur
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE clients (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prénom VARCHAR(100) NOT NULL,
    adresse VARCHAR(250) NOT NULL,
    téléphone INT(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    date_de_naissance DATE NOT NULL
);

CREATE TABLE films
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titre_film VARCHAR(100) NOT NULL,
    synopsis TEXT(2000) NOT NULL
);

CREATE TABLE cinemas
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
);

CREATE TABLE salles 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    numéro INT(10) NOT NULL,
    nombre_place INT(100) NOT NULL,
    cinema_id INT(10) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id)
);

CREATE TABLE seances
(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    film_id INT(10) NOT NULL,
    nombre_place INT(100) NOT NULL,
    place_restante INT(100) NOT NULL,
    FOREIGN KEY (film_id) REFERENCES films(id)
);

CREATE TABLE places
(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    quantité INT(11) NOT NULL,
    seance_id INT(11)NOT NULL,
    FOREIGN KEY (seance_id) REFERENCES seances(id)
    tarif_id INT(11)NOT NULL,
    FOREIGN KEY (tarif_id) REFERENCES tarifs(id)
);

CREATE TABLE commandes
(
    numero_commande int(1000) PRIMARY KEY AUTO_INCREMENT,
    total_place INT (100) NOT NULL,
    total_price INT (100) NOT NULL
);

CREATE TABLE paiemant
(
    client_id INT(11) NOT NULL,
    commande_id INT(11) NOT NULL,
    PRIMARY  KEY (client_id, commande_id),
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (commande_id) REFERENCES commandes(id),
    num_paiement INT(100)
);

CREATE TABLE horaires
(
	seance_id INT NOT NULL,
	salle_id INT NOT NULL,
    horaire DATETIME,
	PRIMARY KEY (seance_id, salle_id),
    FOREIGN KEY (seance_id) REFERENCES seances(id),
    FOREIGN KEY (salle_id) REFERENCES salles(id)
)

CREATE TABLE tarifs
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prix INT(11) NOT NULL
)
/* insertion */

INSERT INTO administrateur (login, password) VALUES ("admin", SHA2('admin_password', 256));

INSERT INTO clients (nom, prénom, adresse, téléphone, email, date_de_naissance) VALUES ("DOE", "John", "14, rue du puit 59650 LILLE", "john.king@abc.com", "0646464646", TO_DATE('17/12/2000', 'DD/MM/YYYY'));
INSERT INTO clients (nom, prénom, adresse, téléphone, email, date_de_naissance) VALUES ("DURANT", "Jane", "25, rue du lac 7500 Paris", "0640404040", "Jane.DURANT@abc.com",  "1999-02-20");

INSERT INTO cinemas (nom, adresse) VALUES ("OCINE", "25 rue du generale de gaulle 59600 Maubeuge");
INSERT INTO cinemas (nom, adresse) VALUES ("GAUMONT", "40, rue de la gare 59300 Valenciennes");

INSERT INTO films (titre_film, synopsis) VALUES ("Retour vers le futur", "Le jeune Marty McFly mène une existence anonyme, auprès de sa petite amie Jennifer, seulement troublée par sa famille en crise et un proviseur qui serait ravi de l'expulser du lycée. Ami de l'excentrique professeur Emmett Brown, il l'accompagne tester sa nouvelle expérience : le voyage dans le temps via une DeLorean modifiée. La démonstration tourne mal : des trafiquants d'armes débarquent et assassinent le scientifique.");
INSERT INTO films (titre_film, synopsis) VALUES ("John WICK", "Ce qui aurait pu être le banal vol d'une voiture de collection se transforme en une chasse à l'homme sans merci entre un légendaire ex-tueur à gages et le fils d'un des plus grands pontes de la mafia. Entre un homme qui se croit au-dessus des lois et un autre à qui on a pris les deux seuls souvenirs qui le rendaient encore humain, l'affrontement sera de haute volée. Personne n'est décidé à rendre les armes et la guerre sera totale.");
INSERT INTO films (titre_film, synopsis) VALUES ("Jurrasic Park", "Ne pas réveiller le chat qui dort -- c'est ce que le milliardaire John Hammond aurait dû se rappeler avant de se lancer dans le clonage de dinosaures. C'est à partir d'une goutte de sang absorbée par un moustique fossilisé que John Hammond et son équipe ont réussi à faire renaître une dizaine d'espèces de dinosaures. Il s'apprête maintenant avec la complicité du docteur Alan Grant, paléontologue de renom, et de son amie Ellie, à ouvrir le plus grand parc à thème du monde.");

INSERT INTO seances (film_id, nombre_place) VALUES (1, 100);
INSERT INTO seances (film_id, nombre_place) VALUES (2, 100);
INSERT INTO seances (film_id, nombre_place) VALUES (3, 100);

INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (1, 100, 1);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (2, 100, 1);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (3, 100, 1);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (4, 100, 1);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (1, 100, 2);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (2, 100, 2);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (3, 100, 2);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (4, 100, 2);
INSERT INTO salles (numero, nombre_place, cinema_id) VALUES (5, 100, 2);

INSERT INTO horaires (seance_id, salle_id, horaire) VALUES (1, 1, "2023-03-29 14:00:00");

INSERT INTO tarifs (nom, prix) VALUES ("Plein tarifs", "9.20");
INSERT INTO tarifs (nom, prix) VALUES ("Étudiant", "7.60");
INSERT INTO tarifs (nom, prix) VALUES ("Moins de 14 ans:", "5.90");

INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (3, 1, 2, 1);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (2, 1, 1, 1);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (5, 2, 2, 2);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (2, 2, 3, 1);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (3, 3, 2, 2);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (4, 3, 2, 1);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (3, 1, 1, 1);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (7, 2, 1, 2);
INSERT INTO places (quantité, seance_id, tarif_id, user_id) VALUES (4, 3, 1, 1);
