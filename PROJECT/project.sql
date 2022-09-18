CREATE TABLE CUSTOMER( 
cust_id number(6) PRIMARY KEY,
phone_no VARCHAR2(20) NOT NULL UNIQUE,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
email VARCHAR2(150) NOT NULL UNIQUE,
birth_date DATE NOT NULL,
password VARCHAR2(50) NOT NULL 
);

CREATE TABLE ADDRESS( 
address_id number(6) PRIMARY KEY,
address_desc CLOB NOT NULL 
);

CREATE TABLE STREET( 
street_id number(6) PRIMARY KEY,
name CLOB NOT NULL 
);


CREATE TABLE DISTRICTS( 
district_id number(6) PRIMARY KEY,
name CLOB NOT NULL 
);


CREATE TABLE RESTAURANT( 
rest_id number(6) PRIMARY KEY,
restaurant_name VARCHAR2(50) NOT NULL UNIQUE,
categories VARCHAR2(20) NOT NULL,
min_order_price NUMBER(3) NOT NULL, 
CHECK(min_order_price>0)
);


CREATE TABLE REVIEW( 
review_id number(6) PRIMARY KEY,
speed NUMBER(2) NOT NULL CHECK(speed>0),
taste NUMBER(2) NOT NULL CHECK(taste>0),
price_for_value NUMBER(2) NOT NULL CHECK(price_for_value>0),
average NUMBER(2) generated always as((speed+taste+price_for_value)/3),
comments CLOB
);

CREATE TABLE BONUS( 
bonus_id number(6) PRIMARY KEY,
bonus_sDate DATE,
bonus_eDate DATE generated always as(bonus_sDate+10),
current_bonus NUMBER(3) NOT NULL CHECK(current_bonus>=0),
bonus_desc CLOB
);

CREATE TABLE MEAL( 
meal_id number(6) PRIMARY KEY,
meal_name VARCHAR2(50) NOT NULL,
meal_description CLOB NOT NULL,
price NUMBER(6) NOT NULL CHECK(price>0)
);


CREATE  INDEX "MYINDEX" ON "MEAL" ("MEAL_NAME")  ONLINE;

CREATE TABLE EXTRAS( 
extras_id number(6) PRIMARY KEY,
ingredients VARCHAR2(50),
sauces VARCHAR2(50),
toRemove VARCHAR2(50),
others VARCHAR2(50)
);

CREATE TABLE IMAGES( 
image_id number(6) PRIMARY KEY,
imageUrl CLOB NOT NULL
);

CREATE TABLE ORDERS( 
order_id number(6) PRIMARY KEY,
orderStatus VARCHAR2(50) NOT NULL,
orderDate DATE NOT NULL,
orderDeliveryDate DATE NOT NULL
);



CREATE TABLE COURIER( 
courierId NUMBER(6) PRIMARY KEY,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
phone_number VARCHAR2(20) UNIQUE NOT NULL,
hire_date DATE NOT NULL
);

CREATE TABLE ADDTOCART( 
meal_id NUMBER(6),
order_id NUMBER(6),
delivery_cost NUMBER(6) NOT NULL CHECK(delivery_cost>=0),
payment_type VARCHAR(20) NOT NULL,
total_cost NUMBER(6) NOT NULL CHECK(total_cost>=0) ,
quantity NUMBER(3) NOT NULL CHECK(quantity>0),
FOREIGN KEY(meal_id) references MEAL(meal_id),
FOREIGN KEY(order_id) references ORDERS(order_id)
);




--ALTERING TABLES AND INSERTING SOME VALUES

ALTER TABLE CUSTOMER ADD address_id NUMBER(6) NOT NULL;
ALTER TABLE CUSTOMER ADD bonus_id NUMBER(6) NOT NULL;
ALTER TABLE CUSTOMER ADD FOREIGN KEY(address_id) REFERENCES ADDRESS(address_id);
ALTER TABLE CUSTOMER ADD FOREIGN KEY(bonus_id) REFERENCES BONUS(bonus_id);
ALTER TABLE ORDERS ADD meal_id NUMBER(6) NOT NULL;
ALTER TABLE ORDERS ADD cust_id NUMBER(6) NOT NULL;
ALTER TABLE ORDERS ADD extras_id NUMBER(6) NOT NULL;
ALTER TABLE ORDERS ADD courier_id NUMBER(6) NOT NULL;
ALTER TABLE ORDERS ADD image_id NUMBER(6) NOT NULL;
ALTER TABLE ORDERS ADD FOREIGN KEY(meal_id) REFERENCES MEAL(meal_id);
ALTER TABLE ORDERS ADD Foreign Key (cust_id) references CUSTOMER(cust_id);
ALTER TABLE ORDERS ADD FOREIGN KEY(extras_id) REFERENCES EXTRAS(extras_id);
ALTER TABLE ORDERS ADD FOREIGN KEY(courier_id) REFERENCES COURIER(courierid);
ALTER TABLE ORDERS ADD FOREIGN KEY(image_id) REFERENCES IMAGES(image_id);

ALTER TABLE ADDRESS ADD street_id NUMBER(6) NOT NULL;
ALTER TABLE ADDRESS ADD district_id NUMBER(6) NOT NULL;
ALTER TABLE ADDRESS ADD FOREIGN KEY(street_id) REFERENCES STREET(street_id);
ALTER TABLE ADDRESS ADD FOREIGN KEY(district_id) REFERENCES DISTRICTS(district_id);
ALTER TABLE RESTAURANT ADD address_id NUMBER(6) NOT NULL;
ALTER TABLE RESTAURANT ADD review_id NUMBER(6) NOT NULL;
ALTER TABLE RESTAURANT ADD meal_id NUMBER(6) NOT NULL;

ALTER TABLE RESTAURANT ADD FOREIGN KEY(address_id) REFERENCES ADDRESS(address_id);
ALTER TABLE RESTAURANT ADD FOREIGN KEY(review_id) REFERENCES REVIEW(review_id);
ALTER TABLE RESTAURANT ADD FOREIGN KEY(meal_id) REFERENCES MEAL(meal_id);

ALTER TABLE MEAL ADD image_id NUMBER(6) NOT NULL;
ALTER TABLE MEAL ADD extras_id NUMBER(6) NOT NULL;

ALTER TABLE MEAL ADD FOREIGN KEY(image_id) REFERENCES IMAGES(image_id);
ALTER TABLE MEAL ADD FOREIGN KEY(extras_id) REFERENCES EXTRAS(extras_id);

INSERT INTO STREET
VALUES(1,'HUZUREVLERI');

INSERT INTO DISTRICTS
VALUES(1,'ÇUKUROVA');

INSERT INTO ADDRESS
VALUES(1,'A101 karşısı ADANA',1,1);

INSERT INTO BONUS(bonus_id,current_bonus,bonus_desc)
VALUES(1,40,'HOŞGELDIN BONUSU!')




INSERT CUSTOMER
VALUES(1,'05338520149','BATUN','IDIKURT','randommail@hotmail.com',TO_DATE('02/05/1998', 'DD/MM/YYYY'),'bubenimsifrem',1,1);

INSERT INTO REVIEW(review_id,speed,taste,price_for_value,comments)
VALUES(1,10,5,3,'THAT WAS THE BEST MEAL I HAVE EVER HAD!');

INSERT INTO EXTRAS
VALUES(1,'pickle,tomato','	ketchup,mayonnaise','','soda-french fries-CHICKEN WINGS');

INSERT INTO IMAGES
VALUES(1,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/1024px-Hamburger_%28black_bg%29.jpg')

INSERT INTO MEAL
VALUES(1,'HAMBURGER','It is served with homemade 150gr meatballs that we prepare with love.',100,1,1);

INSERT INTO RESTAURANT
VALUES(1,'İDİKURT EV YEMEKLERI/FAST-FOOD','EV YEMEKLERI PIZZAs',10,1,1,1);

INSERT INTO COURIER
VALUES(1,'SILA','PELGE','05568259170',TO_DATE('07/06/2022', 'DD/MM/YYYY'));

INSERT INTO ORDERS
VALUES(1,'Yolda...',TO_DATE('02/05/1998', 'DD/MM/YYYY'),TO_DATE('02/05/1998', 'DD/MM/YYYY'),1,1,1,1,1);

INSERT INTO ADDTOCART
VALUES(1,1,5,'CASH',200,2);


--since unique constraint is enforced by an index i couldn’t add index on   restaurant_name.
