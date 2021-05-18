--Créez un groupe marketing qui peut ajouter, modifier et supprimer des produits et des catégories, consulter des commandes, leur détails et les clients. Ce groupe ne peut rien faire sur les autres tables.

--Création des utilisateurs:

CREATE USER 'maxime'@'%' IDENTIFIED BY '123';
CREATE USER 'ines'@'%' IDENTIFIED BY '123';
CREATE USER 'enzo'@'%' IDENTIFIED BY '123';
CREATE USER 'pierre'@'%' IDENTIFIED BY '123';
CREATE USER 'sasha'@'%' IDENTIFIED BY '123';

--Création du groupe:

CREATE ROLE marketing;

--Attribution des roles:

GRANT select, update, delete, insert ON gescom_afpa.products TO marketing
GRANT select, update, delete, insert ON gescom_afpa.categories TO marketing

GRANT select  
ON gescom_afpa.orders 
TO marketing

GRANT select
ON gescom_afpa.orders_details 
TO marketing

GRANT select
ON gescom_afpa.customers 
TO marketing

--Attribution au utilisateur:
GRANT marketing
TO 'maxime'@'%', 'ines'@'%', 'enzo'@'%', 'pierre'@'%', 'sasha'@'%'
