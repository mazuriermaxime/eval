CREATE DATABASE gescom;

USE gescom;

CREATE TABLE Supplier(
   sup_id int NOT NULL,
   sup_name VARCHAR(50) NOT NULL,
   sup_adress VARCHAR(50) NOT NULL,
   sup_phone SMALLINT NOT NULL,
   sup_country VARCHAR(50) NOT NULL,
   PRIMARY KEY(sup_id)
);

CREATE TABLE Product(
   pro_id int NOT NULL,
   pro_photo_file_name VARCHAR(50),
   pro_price INT,
   pro_reference CHAR(50) NOT NULL,
   pro_code CHAR(50) NOT NULL,
   pro_stock INT NOT NULL,
   pro_stock_alert INT,
   pro_colour VARCHAR(20),
   pro_date_added_products DATE,
   pro_date_modified_products DATE,
   pro_label CHAR(50) NOT NULL,
   pro_desrciption VARCHAR(50) NOT NULL,
   pro_tva INT,
   sup_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(sup_id) REFERENCES Supplier(sup_id)
);

CREATE TABLE vendre(
   pro_id INT,
   sel_id INT,
   PRIMARY KEY(pro_id, sel_id),
   FOREIGN KEY(pro_id) REFERENCES Product(pro_id),
   FOREIGN KEY(sel_id) REFERENCES Seller(sel_id)
);

CREATE TABLE Seller(
   sel_id int NOT NULL,
   sel_department SMALLINT NOT NULL,
   sel_gross_salary INT,
   sel_years_of_service SMALLINT,
   sel_sex VARCHAR(20) NOT NULL,
   sel_number_of_children SMALLINT NOT NULL,
   sel_shop VARCHAR(50) NOT NULL,
   sel_post VARCHAR (50) NOT NULL,
   PRIMARY KEY(sel_id)
);

CREATE TABLE ORDER_DETAILS(
   pro_id INT,
   ord_id INT,
   TVA_price DECIMAL(15,2),
   discount_price DECIMAL(15,2),
   unit_price DECIMAL(15,2),
   quantity INT,
   PRIMARY KEY(pro_id, ord_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(ord_id) REFERENCES Ordered(ord_id)
);

CREATE TABLE Ordered(
   ord_id int NOT NULL,
   ord_description VARCHAR(255) NOT NULL,
   ord_payments VARCHAR (50) NOT NULL,
   ord_deliveries VARCHAR (50) NOT NULL,
   PRIMARY KEY(ord_id)
);

CREATE TABLE Post(
   pos_id int NOT NULL,
   pos_name VARCHAR(50) NOT NULL,
   sel_id INT NOT NULL,
   PRIMARY KEY(pos_id),
   FOREIGN KEY(sel_id) REFERENCES Seller(sel_id)
);

CREATE TABLE Shop(
   sho_id int NOT NULL,
   sho_name VARCHAR(50) NOT NULL,
   sho_city VARCHAR(50) NOT NULL,
   PRIMARY KEY(sho_id)
);

CREATE TABLE Embaucher(
   sel_id INT,
   sho_id INT,
   PRIMARY KEY(sel_id, sho_id),
   FOREIGN KEY(sel_id) REFERENCES Seller(sel_id),
   FOREIGN KEY(sho_id) REFERENCES Shop(sho_id)
);


CREATE TABLE Customer(
   cust_id int NOT NULL,
   cust_first_name VARCHAR(20) NOT NULL,
   cust_mail VARCHAR(50) NOT NULL,
   cust_name VARCHAR(20) NOT NULL,
   cust_address VARCHAR(255) NOT NULL,
   cust_password VARCHAR(50) NOT NULL,
   cust_tracking VARCHAR(50) NOT NULL,
   cust_phone INT NOT NULL,
   ord_id INT NOT NULL,
   PRIMARY KEY(cust_id),
   FOREIGN KEY(ord_id) REFERENCES Ordered(ord_id)
);

CREATE TABLE categories(
   cat_id int NOT NULL,
   cat_name VARCHAR(50) NOT NULL,
   pro_id INT NOT NULL,
   PRIMARY KEY(cat_id),
   UNIQUE(pro_id),
   FOREIGN KEY(pro_id) REFERENCES Product(pro_id)
);



