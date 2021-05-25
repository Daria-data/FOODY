CREATE DATABASE FOODY ;
USE FOODY;

CREATE TABLE clients (
codeCli CHAR(5) PRIMARY KEY,
societe VARCHAR(150),
contact VARCHAR(150),
fonction VARCHAR(150),
adresse VARCHAR(150),
ville VARCHAR(150),
region VARCHAR(150),
codePostal VARCHAR(150),
pays VARCHAR(150),
tel VARCHAR(150),
fax VARCHAR(150)
);
SELECT * FROM clients ;

CREATE TABLE messager (
noMess INT PRIMARY KEY,
nomMess VARCHAR(150),
tel VARCHAR(150)
);
SELECT * FROM messager ;

CREATE TABLE categorie (
codeCateg INT PRIMARY KEY,
nomCateg VARCHAR(150),
descriptionn VARCHAR(200)
);
INSERT INTO categorie VALUES (1,"drinks","Soft drinks, coffees, teas, beers, and ales"),
(2,"Condiments","Sweet and savory sauces, relishes, spreads, and seasonings"),
(3,"Desserts","Desserts, candies, and sweet breads"),
(4,"Dairy Products","Cheeses"),
(5,"Grains/Cereals","Breads, crackers, pasta, and cereal"),
(6,"Meat/Poultry","Prepared meats"),
(7,"Produce","Dried fruit and bean curd"),
(8,"Seafood","Seaweed and fish");
SELECT * FROM categorie ;

CREATE TABLE fournisseur (
noFour INT PRIMARY KEY,
societe VARCHAR(150),
contact VARCHAR(150),
fonction VARCHAR(150),
adresse VARCHAR(150),
ville VARCHAR(150),
region VARCHAR(150),
codePostal VARCHAR(150),
pays VARCHAR(150),
tel VARCHAR(150),
fax VARCHAR(150),
pageAccueil VARCHAR(200)
);
SELECT * FROM fournisseur; 

CREATE TABLE employe (
noEmp INT PRIMARY KEY,
nom VARCHAR(150),
prenom VARCHAR(150),
fonction VARCHAR(150),
titreCourtoisie VARCHAR(150),
dateNaissance DATE,
dateEmbauche DATE,
adresse VARCHAR(150),
ville VARCHAR(150),
region VARCHAR(150),
codePostal VARCHAR(150),
pays VARCHAR(150),
telDom VARCHAR(150),
extension INT,
rendCompteA INT REFERENCES employe(noEmp)
);
SELECT * FROM employe;

CREATE TABLE produit (
refProd INT PRIMARY KEY,
nomProd VARCHAR(150),
noFour INT,
codeCateg INT,
qteParUnit VARCHAR(150),
prixUnit FLOAT4,
unitesStock INT,
unitesCom INT,
niveauReap INT,
indisponible INT
);
ALTER TABLE produit ADD FOREIGN KEY (codeCateg) REFERENCES categorie(codeCateg);
ALTER TABLE produit ADD FOREIGN KEY (noFour) REFERENCES fournisseur(noFour);
SELECT * FROM detailcommandeclientsproduit;

CREATE TABLE commande (
noCom INT PRIMARY KEY,
codeCli CHAR(5),
noEmp INT,
dateCom DATE,
aLivAvant DATE,
dateEnv DATE,
noMess INT,
portt FLOAT4,
destinataire VARCHAR(150),
adrLiv VARCHAR(150),
villeLiv VARCHAR(150),
regionLiv VARCHAR(150),
codePostalLiv VARCHAR(150),
paysLiv VARCHAR(150)
);

ALTER TABLE commande ADD FOREIGN KEY (noMess) REFERENCES messager(noMess);
ALTER TABLE commande ADD FOREIGN KEY (noEmp) REFERENCES employe(noEmp);
ALTER TABLE commande ADD FOREIGN KEY (codeCli) REFERENCES clients(codeCli);

SELECT * FROM commande;

CREATE TABLE detailCommande (
noCom INT,
refProd INT,
prixUnit FLOAT4,
qte INT,
remise FLOAT,
PRIMARY KEY (noCom, refProd)
);
ALTER TABLE detailCommande ADD FOREIGN KEY (refProd) REFERENCES produit(refProd);
ALTER TABLE detailCommande ADD FOREIGN KEY (noCom) REFERENCES commande(noCom);
SELECT * FROM detailCommande ;
