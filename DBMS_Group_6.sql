CREATE TABLE CUSTOMER
(
	Customer_ID          INT AUTO_INCREMENT,
	Customer_Contact     CHAR(255) NULL,
	Customer_Address     CHAR(255) NULL,
	Customer_Email       CHAR(255) NULL,
	Customer_Name        CHAR(255) NULL,
	No_Of_Visits         INTEGER NULL,
    PRIMARY KEY(`Customer_ID`)
);
ALTER TABLE CUSTOMER AUTO_INCREMENT=1;

INSERT INTO `Customer` (`Customer_Name`,`Customer_Contact`,`Customer_Address`,`Customer_Email`,`no_of_visits`) VALUES 
("Blanchard, Cynthia F.","1-365-529-9345","601-6639 Leo. Road","Phasellus.libero.mauris@metusInlorem.edu",1),("Best, Kerry C.","1-235-227-9553","Ap #594-4795 Ipsum Road","ac.turpis.egestas@Nullamnisl.co.uk",8),
("Camacho, Isaac S.","1-635-728-0237","9146 Viverra. Avenue","arcu.imperdiet.ullamcorper@eget.edu",3),("Logan, Blaine N.","1-749-837-4920","8858 Venenatis Rd.","nunc.ullamcorper@Craspellentesque.ca",5),
("Barnes, Ava V.","1-485-794-6532","P.O. Box 589, 9838 Iaculis Street","scelerisque.scelerisque.dui@rutrum.edu",7),("Woods, Jayme V.","1-328-123-2766","8817 Montes, Ave","lorem@nasceturridiculusmus.ca",9),
("Mccullough, Brianna H.","1-172-635-9020","542-2237 Est, Av.","porttitor.tellus@lectusquismassa.net",1),("Dixon, Camille K.","1-855-376-9248","P.O. Box 961, 7933 Lorem St.","amet.lorem@Integervulputaterisus.com",3),
("Gould, Tanner M.","1-202-263-7517","Ap #510-1647 Amet Road","imperdiet@nisidictum.co.uk",8),("Acosta, Victor A.","1-905-122-8180","Ap #361-8991 Dolor, St.","facilisis.facilisis.magna@magna.co.uk",6),
("Myers, Xander T.","1-935-984-3901","886-9571 Odio Av.","dolor.Fusce@odiotristique.edu",1),("Boyd, Keith B.","1-130-579-4916","Ap #598-686 Ut Rd.","a@vitaeposuereat.edu",3),
("Macias, Ivor M.","1-145-385-9201","P.O. Box 252, 5515 Sociis Av.","ornare@orci.org",1),("Combs, Caryn L.","1-302-574-8362","P.O. Box 562, 9121 Nisi Ave","gravida.mauris@etliberoProin.org",8),
("Munoz, Alana T.","1-165-988-5473","Ap #545-4237 Orci Rd.","rhoncus.Proin.nisl@utmolestie.com",5),("Boyle, Alma L.","1-691-978-9162","P.O. Box 635, 2131 Hendrerit. Ave","nulla.Donec.non@pellentesque.ca",1),
("Crane, Julian U.","1-997-489-3903","720-8794 Justo Road","neque@vestibulumnec.edu",2),("Brock, Shelly G.","1-393-779-6552","9962 Dictum Rd.","enim.sit.amet@Maurisblanditenim.org",1),
("Duke, Noel U.","1-465-156-9274","566-9005 Adipiscing St.","lacus.Quisque@diamSeddiam.edu",6),("Bradshaw, Madeline P.","1-218-793-2155","P.O. Box 567, 367 Congue. Ave","fringilla.cursus@lacusQuisquepurus.com",5),
("Waller, Aurora T.","1-139-341-5292","610-1058 Metus St.","auctor.vitae.aliquet@tortoratrisus.org",3),("Hooper, Perry L.","1-273-348-8322","P.O. Box 646, 9865 A, Ave","tristique.neque@Curabituregestas.org",4),
("Griffith, Sierra U.","1-641-974-9995","Ap #265-6249 Magnis Avenue","ante.Vivamus@commodoauctor.co.uk",2),("Castaneda, Hayden U.","1-340-169-7509","Ap #678-5537 Nonummy St.","Morbi.sit.amet@tortor.co.uk",1),
("Farley, Cecilia Y.","1-185-655-0396","751-2869 Dis Ave","nunc@Etiambibendumfermentum.org",6),("Cross, Davis P.","1-747-356-5364","P.O. Box 594, 9342 A Avenue","eget@ridiculusmus.org",3),
("Schultz, Audrey M.","1-496-544-3694","Ap #766-6498 At, Rd.","enim.diam.vel@id.com",9),("Morse, Whilemina T.","1-440-199-2171","9893 Augue, Avenue","est.mauris.rhoncus@utmolestiein.net",5),
("Valdez, Hoyt N.","1-836-187-1342","Ap #313-2375 Arcu. Rd.","lectus@necimperdiet.com",3),("Freeman, Kyle K.","1-903-282-1962","P.O. Box 815, 5930 Tellus St.","eget@euelit.ca",6),
("Franklin, Allen Q.","1-116-675-6543","Ap #321-6289 Elit, Street","Aliquam.ornare@nonarcu.co.uk",1), ("Carver, Winter A.","1-697-932-1029","2936 Elit, Av.","mauris.sit.amet@Classaptent.edu",3), ("Suarez, Autumn C.","1-416-766-0227","661-7604 Magna St.","felis.orci@sitamet.com",2);


CREATE TABLE EMPLOYEE
(
	Employee_ID          INT AUTO_INCREMENT,
	Employee_Name        CHAR(255) NULL,
	Date_Hired           DATE NULL,
	Phone_No             VARCHAR(255) NULL,
	Employee_Type        CHAR(255) NULL,
    PRIMARY KEY(`Employee_ID`)
);

ALTER TABLE EMPLOYEE AUTO_INCREMENT=1;

CREATE TABLE MANAGER
(
	Employee_ID          INT NOT NULL,
    Employee_Name        CHAR(255) NULL,
    Employee_Type        CHAR(255) NULL,
    CONSTRAINT `Manager_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

DELIMITER $$
CREATE TRIGGER manager_input AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
IF NEW.Employee_Type ='Manager' THEN
        INSERT INTO MANAGER (`Employee_ID`,`Employee_Name`, `Employee_Type`) VALUES (NEW.Employee_ID,NEW.Employee_Name, NEW.Employee_Type);
END IF;
END $$
DELIMITER ;

CREATE TABLE CASHIER
(
	Employee_ID          INT NOT NULL,
    Employee_Name        CHAR(255) NULL,
    Employee_Type        CHAR(255) NULL,
    CONSTRAINT `Cashier_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

DELIMITER $$
CREATE TRIGGER Cashier_input AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
IF NEW.Employee_Type ='Cashier' THEN
        INSERT INTO CASHIER (`Employee_ID`,`Employee_Name`, `Employee_Type`) VALUES (NEW.Employee_ID,NEW.Employee_Name, NEW.Employee_Type);
END IF;
END $$
DELIMITER ;

CREATE TABLE CHEF
(
	Employee_ID          INT NOT NULL,
    Employee_Name        CHAR(255) NULL,
    Employee_Type        CHAR(255) NULL,
    CONSTRAINT `Chef_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

DELIMITER $$
CREATE TRIGGER Chef_input AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
IF NEW.Employee_Type ='Chef' THEN
        INSERT INTO CHEF (`Employee_ID`,`Employee_Name`, `Employee_Type`) VALUES (NEW.Employee_ID,NEW.Employee_Name, NEW.Employee_Type);
END IF;
END $$
DELIMITER ;

CREATE TABLE WAITER
(
	Employee_ID          INT NOT NULL,
    Employee_Name        CHAR(255) NULL,
    Employee_Type        CHAR(255) NULL,
    CONSTRAINT `Waiter_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

DELIMITER $$
CREATE TRIGGER Waiter_input AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
IF NEW.Employee_Type ='Waiter' THEN
        INSERT INTO WAITER (`Employee_ID`,`Employee_Name`, `Employee_Type`) VALUES (NEW.Employee_ID,NEW.Employee_Name, NEW.Employee_Type);
END IF;
END $$
DELIMITER ;

INSERT INTO `Employee` (`Employee_Name`,`Date_Hired`,`Phone_No`,`Employee_Type`) VALUES 
('Ross Kline','2019/01/13','1-984-153-0530','Chef'),('Elliott Atkins','2018/09/15','1-644-405-9500','Chef'),('Emmanuel Gamble','2018/08/08','1-261-940-5062','Chef'),
('Lane Trevino','2018/09/03','1-468-125-6319','Waiter'),('Brent Ayala','2018/06/16','1-967-529-0707','Waiter'),('Wing Velasquez','2018/06/03','1-569-611-0055','Waiter'),
('Beck Christian','2018/09/15','1-181-945-2311','Waiter'),('Ciaran Hensley','2019/02/14','1-359-164-1066','Waiter'),('Troy Ross','2019/02/21','1-199-840-5519','Waiter'),
('Clark Foley','2019/02/09','1-947-693-4137','Cashier'),('Phillip Bonner','2018/06/04','1-359-970-0133','Cashier'),('Silas Owens','2018/04/21','1-242-214-5625','Manager'),
('Emerson Harrison','2018/09/08','1-254-465-7695','Manager');

CREATE TABLE SUPPLIER
(
	Supplier_ID          INT AUTO_INCREMENT,
	Supplier_Name        CHAR(255) NULL,
	Supplier_Location    CHAR(255) NULL,
	Supplier_Phone       VARCHAR(255) NULL,
	Employee_ID          INT NULL,
	PRIMARY KEY(`Supplier_ID`),
    CONSTRAINT `Supplier_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

ALTER TABLE SUPPLIER AUTO_INCREMENT=1;

INSERT INTO `Supplier` (`Supplier_Name`,`Supplier_Location`,`Supplier_Phone`,`Employee_ID`) 
VALUES ("Shoshana","Texas","1-762-920-6360", (SELECT Employee_ID FROM MANAGER LIMIT 1)),
("Renee","New Jersey","1-516-604-1160",(SELECT Employee_ID FROM MANAGER LIMIT 1)),
("Joshua","Seattle","1-473-104-3753",(SELECT Employee_ID FROM MANAGER LIMIT 1));




CREATE TABLE MENU
(
	Menu_ID              INT NOT NULL,
	Menu_Description     CHAR(255) NULL,
    PRIMARY KEY(`Menu_ID`)
);

INSERT INTO `Menu` (`Menu_ID`,`Menu_Description`) VALUES (1,"Drink"),(2,"Food");

CREATE TABLE MENU_ITEM
(
	Item_ID              INT AUTO_INCREMENT,
	Item_Name            CHAR(255) NULL,
	Item_Description     CHAR(255) NULL,
	Item_Price           FLOAT NULL,
	Menu_ID              INT NOT NULL,
	Is_Available         boolean NULL,
    PRIMARY KEY(`Item_ID`),
    CONSTRAINT `Menu_FK` FOREIGN KEY (`Menu_ID`) REFERENCES MENU(`Menu_ID`)
);

ALTER TABLE MENU_ITEM AUTO_INCREMENT=1;


INSERT INTO `MENU_ITEM` (`Item_ID`,`Menu_ID`,`Item_Name`,`Item_Description`,`Item_Price`,`Is_Available`) 
VALUES (1,2,"Southwestern Eggrolls","Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.","0.48",0),
(2,2,"Skillet Queso","chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.,","5.91",1),
(3,2,"The Boss Burger","Smoked brisket, tender rib meat, jalapeno-cheddar smoked sausage, bacon & cheddar with lettuce, tomato, House BBQ & house-made ranch*","19.64",1),
(4,2,"Mushroom Swiss Burger","There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.","18.72",0),
(5,2,"Queso Burger","Say “cheese!” This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.","18.20",1),
(6,2,"Mix & Match Fajitas","Sizzling with chipotle butter, cilantro, bell peppers & onions. Served with Mexican rice, black beans, guacamole, sour cream, pico, salsa, shredded cheese, flour or all-natural corn tortillas. ,","26.91",0),
(7,2,"Mix & Match Fajita Trio","Sizzling with chipotle butter, cilantro, bell peppers & onions. Served with Mexican rice, black beans, guacamole, sour cream, pico, salsa, shredded cheese, flour or all-natural corn tortillas. ","20.69",0),
(8,2,"Mushroom Jack Chicken Fajitas.","Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.,","22.92",1),
(9,2,"Black Bean & Veggie Fajitas","Black bean patty, asparagus, garlic-roasted tomatoes, onions, bell peppers, corn & black bean salsa, queso fresco, and avocado, drizzled with spicy chile-lime sauce.","20.39",1),
(10,2,"Smokehouse Combo,","Build your own combo! Choose from our famous Baby Back Ribs, NEW Cheesy Bacon BBQ Chicken, Smoked Brisket, Jalapeño-Cheddar Smoked Sausage, or Chicken Crispers®. Served with roasted street corn, fries, chile-garlic toast & garlic dill pickles.","35.61",0),
(11,2,"Ultimate Smokehouse Combo","Build your own combo! Choose from our famous Baby Back Ribs, NEW Cheesy Bacon BBQ Chicken, Smoked Brisket, Jalapeño-Cheddar Smoked Sausage, or Chicken Crispers®. Served with roasted street corn, fries, chile-garlic toast & garlic dill pickles.","35.01",0),
(12,2,"Chili’s 1975 Soft Tacos","Three flour tortillas filled with Original Chili, cheese, lettuce, tomatoes. Served with sour cream, chips & salsa..","16.59",1),
(13,2,"Spicy Shrimp Tacos","Three spicy chile-lime shrimp tacos in soft flour tortillas with pico, avocado, coleslaw & queso fresco. Served with Mexican rice & black beans.","14.33",1),
(14,2,"Ranchero Chicken Tacos","Three tacos in flour tortillas with pico, avocado, Jack cheese, jalapeño aioli, cilantro, queso fresco. Served with Mexican rice & black beans..","14.46",1),
(15,2,"Bacon Ranch Chicken Quesadillas","Chicken, shredded cheese, chile spices, bacon, house-made ranch. Served with pico, sour cream, ancho-chile ranch.","16.66",1),
(16,2,"Beef Bacon Ranch Quesadillas","Steak, shredded cheese, chile spices, bacon, house-made ranch. Served with pico, sour cream, ancho-chile ranch.,","19.95",1),
(17,2,"Cajun Chicken Pasta","Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.","14.70",1),
(18,2,"Cajun Shrimp Pasta","Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.,","17.28",1),
(19,2,"Steak Fajitas","Sizzling with chipotle butter, cilantro, bell peppers & onions. Served with Mexican rice, black beans, guacamole, sour cream, pico, salsa, shredded cheese, flour or all-natural corn tortillas","29.68",1),
(20,2,"Chicken Fajitas","Sizzling with chipotle butter, cilantro, bell peppers & onions. Served with Mexican rice, black beans, guacamole, sour cream, pico, salsa, shredded cheese, flour or all-natural corn tortillas.","28.17",1);


CREATE TABLE CUS_ORDER
(
	Cus_Order_ID         INT AUTO_INCREMENT,
	Cus_Order_Date       DATE NULL,
	Customer_ID          INT NOT NULL,
	No_of_items          INTEGER NULL,
	Employee_ID          INT NOT NULL,
	PRIMARY KEY(`Cus_Order_ID`),
    CONSTRAINT `Customer_FK` FOREIGN KEY (`Customer_ID`) REFERENCES CUSTOMER(`Customer_ID`),
    CONSTRAINT `Employee_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

ALTER TABLE CUS_ORDER AUTO_INCREMENT=1;

DROP TRIGGER IF EXISTS `Order_increment`;

DELIMITER $$
Create trigger `Order_increment` 
after insert on Cus_Order
for each row
BEGIN
update `Customer` set `No_Of_Visits`=Customer.No_Of_Visits+1   where `Customer_ID`=(select Customer_ID from Cus_Order order by Cus_Order_ID DESC limit 1 );

#CALL Order_increment_func;

END$$
DELIMITER ;


CREATE TABLE ORDER_DETAIL
(
	Order_Detail_ID  INT AUTO_INCREMENT,
	Item_ID              INT NULL,
    Item_Quantity        INT NULL,
    Item_Price					FLOAT NULL,
    Price                           FLOAT NULL,
	Cus_Order_ID         INT NOT NULL,
	Menu_ID              INT  NULL,
	Customer_ID          INT NOT NULL,
	Employee_ID          INT NOT NULL,
	PRIMARY KEY(`Order_Detail_ID`),
    CONSTRAINT `Menu_Item1_FK` FOREIGN KEY (`Item_ID`) REFERENCES MENU_ITEM(`Item_ID`),
    CONSTRAINT `Cus_Order_ID_FK` FOREIGN KEY (`Cus_Order_ID`) REFERENCES CUS_ORDER(`Cus_Order_ID`)
#    CONSTRAINT `Menu_FK` FOREIGN KEY (`Menu_ID`) REFERENCES MENU(`Menu_ID`),
 #   CONSTRAINT `Customer_FK` FOREIGN KEY (`Customer_ID`) REFERENCES CUSTOMER(`Customer_ID`)
);

ALTER TABLE ORDER_DETAIL AUTO_INCREMENT=1;


CREATE TRIGGER order_detail_input AFTER INSERT ON CUS_ORDER
FOR EACH ROW
INSERT INTO ORDER_DETAIL (`Cus_Order_ID`,`Customer_ID`, `Employee_ID`) VALUES (NEW.Cus_Order_ID,NEW.Customer_ID, NEW.Employee_ID);


#drop trigger order_detail_input;

CREATE TABLE BILL
(
	Bill_ID              INT AUTO_INCREMENT,
	Cus_Order_ID         INT NOT NULL,
	Total_Price          FLOAT NULL,
	Payment_Method       CHAR(18) NULL,
	Bill_Date            DATE NULL,
	Employee_ID          INT NULL,
    PRIMARY KEY(`Bill_ID`),
	CONSTRAINT `Cus_Order_FK` FOREIGN KEY (`Cus_Order_ID`) REFERENCES CUS_ORDER(`Cus_Order_ID`),
    CONSTRAINT `_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
    );

ALTER TABLE BILL AUTO_INCREMENT=1;

DELIMITER $$
CREATE TRIGGER Bill_input AFTER INSERT ON CUS_ORDER
FOR EACH ROW
BEGIN
INSERT INTO BILL (`Cus_Order_ID`,`Bill_Date`) VALUES (NEW.Cus_Order_ID,NEW.Cus_Order_Date);
END$$
DELIMITER ;

#drop trigger Bill_input;


INSERT INTO `CUS_ORDER` (`Cus_Order_Date`,`Customer_ID`,`No_of_items`,`Employee_ID`) VALUES 
("2019/02/01",2,1,4),("2019/02/01",10,2,5),("2019/01/16",1,5,6),("2018/10/18",10,1,7),("2018/09/30",4,3,8),("2018/06/27",5,1,9),
("2018/06/27",9,1,4),("2018/05/23",4,2,5), ("2018/03/10",6,1,6),("2018/11/08",9,2,7),("2018/04/12",10,3,8),("2018/07/21",9,4,9),
("2019/01/06",10,2,4),("2018/04/12",7,2,5),("2018/05/04",8,1,6),("2018/06/26",5,3,7),("2018/08/04",9,2,8),("2018/03/10",7,3,9),
("2018/10/24",1,1,4),("2018/09/26",3,1,5),("2018/11/26",6,2,6),("2018/08/19",6,5,7),("2018/06/24",7,4,7),("2018/10/23",9,2,9),
("2018/10/12",1,4,5),("2018/05/03",6,2,5),("2018/08/27",4,2,4),("2018/05/31",7,3,6),("2018/03/19",7,1,6),("2018/08/18",9,3,6),("2018/06/08",4,2,5),
("2018/07/22",10,10,5),("2018/10/12",3,3,5),("2018/08/10",3,2,6),("2018/10/29",9,1,8),("2018/11/17",9,5,7),("2018/12/17",4,2,7),("2018/09/27",2,2,5),("2018/03/18",1,1,8),
("2018/12/03",9,1,7),("2018/11/09",2,2,5),("2018/09/06",5,1,6),("2018/07/16",3,2,6),("2018/03/19",7,5,7),("2018/04/02",6,2,7),
("2018/10/07",10,2,8),("2018/07/16",2,2,9),("2018/05/30",4,1,8),("2018/04/20",6,2,4),("2018/02/27",5,3,5);

UPDATE `ORDER_DETAIL` SET `Item_ID` = '11', `Item_Quantity` = '1', `Menu_ID`='2',Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '1');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '5', `Item_Quantity` = '2', `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '2');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '13', `Item_Quantity` = '4' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '3');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '10', `Item_Quantity` = '1' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '4');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '2' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '5');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '6', `Item_Quantity` = '2' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '6');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '3' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '7');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '19', `Item_Quantity` = '2' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '8');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '10', `Item_Quantity` = '1' , `Menu_ID`='2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '9');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '11', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '10');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '14', `Item_Quantity` = '3', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '11');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '15', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '12');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '16', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '13');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '17', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '14');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '18', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '15');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '20', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '16');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '17');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '7', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '18');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '12', `Item_Quantity` = '2', `Menu_ID` = '2',Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity`  WHERE (`Order_Detail_ID` = '19');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '12', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '20');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '6', `Item_Quantity` = '3', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '21');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '22');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '7', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '23');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '3', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '24');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '1', `Item_Quantity` = '4', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '25');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '2', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '26');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '3', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '27');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '15', `Item_Quantity` = '2', `Menu_ID` = '2',Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity`  WHERE (`Order_Detail_ID` = '28');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '6', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '29');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '3', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '30');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '3', `Item_Quantity` = '3', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '31');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '19', `Item_Quantity` = '1', `Menu_ID` = '2',Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity`  WHERE (`Order_Detail_ID` = '32');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '4', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '33');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '34');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '2', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '35');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '1', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '36');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '3', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '37');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '15', `Item_Quantity` = '1', `Menu_ID` = '2',Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity`  WHERE (`Order_Detail_ID` = '38');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '39');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '6', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '40');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '1', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '41');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '4', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '42');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '1', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '43');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '2', `Item_Quantity` = '3', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '44');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '3', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '45');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '15', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '46');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '8', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '47');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '6', `Item_Quantity` = '1', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '48');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '7', `Item_Quantity` = '2', `Menu_ID` = '2' ,Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity` WHERE (`Order_Detail_ID` = '49');
UPDATE `ORDER_DETAIL` SET `Item_ID` = '19', `Item_Quantity` = '2' , `Menu_ID`='2',Item_Price = (select item_price from MENU_ITEM where  item_ID = order_detail.item_id),
`Price` = `Item_Price`* `Item_Quantity`  WHERE (`Order_Detail_ID` = '50');

UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '11' WHERE (`Bill_ID` = '1');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '2');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '3');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '11' WHERE (`Bill_ID` = '4');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Samsung_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '5');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '6');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '7');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'G_Pay', `Employee_ID` = '11' WHERE (`Bill_ID` = '8');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '9');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Samsung_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '10');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '11');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Apple_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '12');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '13');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '14');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Apple_Pay', `Employee_ID` = '11' WHERE (`Bill_ID` = '15');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '16');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Apple_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '17');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '11' WHERE (`Bill_ID` = '18');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Samsung_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '19');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '20');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Samsung_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '21');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '22');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '23');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '24');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '25');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '11' WHERE (`Bill_ID` = '26');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '27');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '28');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '29');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'G_Pay', `Employee_ID` = '11' WHERE (`Bill_ID` = '30');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '31');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '32');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '33');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '34');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '35');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '36');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '37');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '38');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Apple_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '39');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '40');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '41');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '42');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '43');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '11' WHERE (`Bill_ID` = '44');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '45');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '46');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Cash', `Employee_ID` = '10' WHERE (`Bill_ID` = '47');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '10' WHERE (`Bill_ID` = '48');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'G_Pay', `Employee_ID` = '10' WHERE (`Bill_ID` = '49');
UPDATE `BILL` SET `Total_Price` = (select Price from Order_detail where cus_order_id = bill.cus_order_id),`Payment_Method` = 'Credit_card', `Employee_ID` = '11' WHERE (`Bill_ID` = '50');

CREATE TABLE REVIEW
(
	Review_ID            INT AUTO_INCREMENT,
    Cus_Order_ID         INT NULL,
	Bill_ID              INT  NULL,
	Subject_Comment              CHAR(255) NULL,
	Rating               INTEGER NULL,
	Comment_Content              CHAR(255) NULL,
	Customer_ID          INT  NULL,
	Employee_ID          INT  NULL,
	PRIMARY KEY(`Review_ID`)
   #CONSTRAINT `Cus_Order_FK` FOREIGN KEY (`Cus_Order_ID`) REFERENCES CUS_ORDER(`Cus_Order_ID`)
    #CONSTRAINT `Bill_FK` FOREIGN KEY (`Bill_ID`) REFERENCES BILL(`Bill_ID`),
    #CONSTRAINT `Customer_FK` FOREIGN KEY (`Customer_ID`) REFERENCES CUSTOMER(`Customer_ID`)
    #CONSTRAINT `Employee_FK` FOREIGN KEY (`Employee_ID`) REFERENCES EMPLOYEE(`Employee_ID`)
);

ALTER TABLE REVIEW AUTO_INCREMENT=1;

INSERT INTO `Review` (`Review_ID`,`Subject_Comment`,`Rating`,`Comment_Content`,`Customer_ID`) VALUES
(1,"Food",5,"chips and salsa: spicy and so tasty!","61"),(2,"Ambiance",4,"The original location on Lincoln Avenue has been around about 30 years.","19"),(3,"Ambience",5,"This place is AMAZING!!","2"),(4,"Service",4,"They have great service and the staff is very kind","11"),(5,"Food",3,"The food was OK for the price ","73"),(6,"Suggestions",3,"Please update the lighting","1"),(7,"Issue",3,"Parking was an issue","1"),(8,"Food",5,"I have never been dissapointed !,","97"),(9,"Suggestions",3,"the sauce was too tangy for my taste","41"),(10,"Complain",2,"My order got delayed!","2"),
(71,"Quality",2,"I found the quality inconsistent","47"),(72,"Suggestions",5,"you have a lot of potential ,keep up the good work","61"),(73,"Complain",3,"The Place was hot and I was feeling claustrophobic","19"),(74,"Food",4,"This is one-stop place for good food in a budget","47"),(75,"Complain",2,"The new crew is rude","2"),(76,"Food",3,"always out of guacamole","41"),(77,"Ambiance",4,"The live music is great!","1"),(78,"Ambience",5,"I have always loved the soothing appeal of this outlet","41"),(79,"Complain",1,"I got my order after an hour","71"),(80,"Suggestions",4,"The food is great,please wor on the speed of service","5"),
(81,"Service",1,"I  had a bad experience ,my salsa was stale ","23"),(82,"Concern",1,"I saw rats in coming out of the kitchen,I'll never visit the place again!,","43"),(83,"Suggestions",3,"Please update your menu ","13"),(84,"Food",4,"Excellent food ","73"),(85,"Quantity",5,"Reasonable price, good quantity!","5"),(86,"Issue",3,"I found the place a little cramped for a dine-in ","61"),(87,"Suggestions",4,"The food is great!, ut there is are no optiuon for sweet items","29"),(88,"Quantity",5,"I was surprised to see the proportions ,Huge!","13"),(89,"Ambiance",5,"I heard this place had the best live music ,It's true!","19"),(90,"Food",3,"The tortilla was a bit tough but would have been perfect to eat with the hands","37"),
(91,"Suggestions",2,"please mop the floor atleast! ","37"),(92,"Feedback",4,"Please add lunch menu for daily visitors","23"),(93,"Feedback",3,"Some chairs were broken","67"),(94,"Ambiance",5,"This is a family owned restaurant,very affectionate people","13"),(95,"Suggestions",4,"utilise your garden for outdoor seating","79"),(96,"Quantity",5,"Reasonable price and generous portions","67"),(97,"Suggestions",2,"Why dont add kids menu!","31"),(98,"Food",5,"Everything was outstanding ","97"),(99,"Suggestions",2,"I am wondering why there is no cheese on my enchiladas?","97"),(100,"Quality",4,"the salsa is excellent with nice chunks of avacado.","89");


CREATE TABLE RAW_MATERIAL
(
	Raw_material_ID     INT AUTO_INCREMENT,
	Raw_Material_Name    CHAR(255) NULL,
	Raw_Material_Quantity CHAR(255) NULL,
	Item_ID              INT NOT NULL,
	Menu_ID              INT NOT NULL,
    PRIMARY KEY(`Raw_material_ID`),
    CONSTRAINT `Item_FK` FOREIGN KEY (`Item_ID`) REFERENCES MENU_ITEM(`Item_ID`)
	#CONSTRAINT `Menu_FK` FOREIGN KEY (`Menu_ID`) REFERENCES MENU(`Menu_ID`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

ALTER TABLE RAW_MATERIAL AUTO_INCREMENT=1;


INSERT INTO `RAW_MATERIAL` (`Item_ID`,`Raw_Material_Name`,`Raw_Material_Quantity`,`Menu_ID`) VALUES 
(1,"broccoli",22,2),(1,"onion",30,2),(2,"tomatoes",50,2),(2,"olivejjjhs",54,2),(3,"turkey",70,2),
(4,"salmon",60,2),(5,"potato",30,2),(5,"sugar",100,2),(5,"flour",30,2),(6,"avacado",20,2);



CREATE TABLE RM_ORDER
(
	RM_Order_ID    INT AUTO_INCREMENT,
	RM_Order_Quantity    INTEGER NULL,
	Date_Of_Order        DATE NULL,
	RM_Order_Price       INTEGER NULL,
	Raw_material_ID     INT NULL,
	Item_ID              INT  NULL,
	Menu_ID              INT  NULL,
	Supplier_ID          INT NOT NULL,
	Employee_ID          INT NULL,
	Due_date             DATE NULL,
	Priority             CHAR(18) NULL,
	PRIMARY KEY(`RM_Order_ID`),
    CONSTRAINT `Raw_material_FK` FOREIGN KEY (`Raw_material_ID`) REFERENCES RAW_MATERIAL(`Raw_material_ID`)
    #CONSTRAINT `Item_FK` FOREIGN KEY (`Item_ID`) REFERENCES MENU_ITEM(`Item_ID`),
	#CONSTRAINT `Menu_FK` FOREIGN KEY (`Menu_ID`) REFERENCES MENU(`Menu_ID`),
	#CONSTRAINT `Supplier_FK` FOREIGN KEY (`Supplier_ID`) REFERENCES SUPPLIER(`Supplier_ID`)
);

ALTER TABLE RM_ORDER AUTO_INCREMENT=1;

ALTER TABLE RM_ORDER
ADD CONSTRAINT R_118 FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER (Supplier_ID);

INSERT INTO `RM_ORDER` (`Raw_Material_ID`,`Supplier_ID`,`RM_Order_Quantity`,`Date_Of_Order`,`RM_Order_Price`,`Due_Date`,`Priority`) VALUES 
(1,1,14,'2018/05/07',20.59,'2018/05/14','Weekly'),
(2,1,6,'2018/11/30',15.99,'2018/12/03','Not Specified'),
(5,2,6,'2018/01/14',12.39,'2018/02/14','Monthly'),
(10,3,1,'2018/06/13',19.99,'2018/06/14','Daily');

#===============================================================================
# Manager would like to check reviews from customer
#===============================================================================

DELIMITER $$
CREATE PROCEDURE Check_Reviews_Manager(Emp_ID int)
BEGIN
	DECLARE Emp_Type varchar(255);
    
	SET @Emp_Type := (SELECT Employee_type FROM EMPLOYEE 
			WHERE Employee_ID = Emp_ID);
            
	CASE 
		WHEN @Emp_Type = 'Manager' THEN
        SELECT * FROM Review;
	ELSE 
			SELECT 'Unauthorized access to reviews' as '' ;
	END CASE;
END$$
DELIMITER ;

call Check_Reviews_Manager(13);

#===============================================================================
#Manager​ would like to know which meals receive most positive reviews
#===============================================================================
DELIMITER $$

CREATE PROCEDURE check_reviews(Emp_ID int)
BEGIN
	DECLARE Emp_Type varchar(255);
    
	SET @Emp_Type := (SELECT Employee_type FROM EMPLOYEE 
			WHERE Employee_ID = Emp_ID);
	
    CASE 
		WHEN @Emp_Type = 'Manager' THEN
			SELECT count(Rating), Item_Name
			FROM review R, customer C, CUS_Order O, Order_Detail OD, MENU_ITEM I
			WHERE R.Customer_ID = C.Customer_ID
			AND O.Customer_ID = C. Customer_ID
			AND O.Cus_Order_ID = OD.Cus_Order_ID
			AND OD.ITEM_ID = I.ITEM_ID
			AND R.Rating > 3
			GROUP BY I.Item_ID
			ORDER BY count(Rating) DESC LIMIT 1;
		ELSE 
			SELECT 'Unauthorized access to reviews' as '' ;
	END CASE;
END$$
DELIMITER ;

call  check_reviews(13);

#==========================================
#Manager​ would like to know the monthly revenue.
#==========================================
SELECT month(bill_date), round(sum(total_price),2)
FROM bill
GROUP BY month(bill_date)
ORDER BY month(bill_date);

#===============================================================================
# Chef would like to know which food customers like and order most.
#===============================================================================
select I.Item_Name, sum(O.Item_Quantity) as Cus_Orders
from Order_Detail O, Menu_Item I
where O.Item_ID = I.Item_ID
group by O.Item_ID
order by sum(Item_Quantity) desc;

#===============================================================================
#Manager would like to know previous orders of the customers.
#===============================================================================
select C.Customer_Name, CO.Cus_Order_Date, O.Cus_Order_ID, I.Item_Name, O.Item_Quantity
from Customer C, Cus_Order CO, Order_Detail O, Menu_Item I
where C.Customer_ID = CO.Customer_ID
and CO.Cus_Order_ID = O.Cus_Order_ID
and O.Item_ID = I.Item_ID
group by C.Customer_Name, CO.Cus_Order_Date, O.Order_Detail_ID, O.Cus_Order_ID
order by C.Customer_Name, CO.Cus_Order_Date, O.Order_Detail_ID, O.Cus_Order_ID;


#========================================================================================
#A ​customer​ would like to know the reviews of the restaurant and would like to give review about the restaurant/food.
#========================================================================================

DELIMITER $$
CREATE PROCEDURE Write_Review(Subj varchar(255), ratings mediumint, comments text,customer_ID int)
BEGIN

	INSERT INTO Reviews (`Subject`,`Rating`, `Comments`,`Customer_ID`) VALUES (Subj, ratings,comments,customer_ID);

END$$
DELIMITER ;

#===============================================================================
#A ​customer​ would like to see the menu and know the availability of the item in menu.
#===============================================================================
Select item_name, item_description, item_price, Is_Available from Menu_item where Is_Available = 1;

#===============================================================================
#Chef ​would like to know which food customers like and order most.
#===============================================================================

DELIMITER $$
CREATE PROCEDURE Frequent_Meals_Ordered(Emp_ID int)
BEGIN
	DECLARE Emp_Type varchar(255);
    
	SET @Emp_Type := (SELECT Employee_type FROM EMPLOYEE 
			WHERE Employee_ID = Emp_ID);
	
    CASE 
		WHEN @Emp_Type = 'Chef' THEN
			SELECT  Item_Name, count(O.Cus_Order_ID) as 'Order Count'  
			FROM CUSTOMER C, CUS_ORDER O, ORDER_DETAIL OD, MENU_ITEM I
            WHERE
				C.Customer_ID = O.Customer_ID
				AND O.Cus_Order_ID = OD.Cus_Order_ID
				AND I.Item_ID = OD.Item_ID
			GROUP BY I.Item_ID
			ORDER BY count(O.Cus_Order_ID) DESC
;
	ELSE 
			SELECT 'Unauthorized access to Orders' as '' ;
	END CASE;

END$$
DELIMITER ;

call Frequent_Meals_Ordered(1);
