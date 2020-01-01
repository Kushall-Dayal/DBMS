#Note:the business case that this assignment handles is that when a customer is at the counter he would want to insert, update  and delete his order 

#==================================================
## After insert Trigger##
## Procedure ##
#Note: the following pocedure is called in the After update Trigger 1.It calculates the bill for the latest order 2 .And generates order details for the specific order
DROP PROCEDURE IF EXISTS Order_increment_func;

DELIMITER //
CREATE PROCEDURE Order_increment_func()
BEGIN



DECLARE x  smallint;
DECLARE y  INT;
DECLARE z  mediumint;
DECLARE a  INT;
DECLARE b  INT;
set a=cast(a as decimal(12,2)) ; 
	set z =(select Order_ID from Orders order by Order_ID DESC limit 1 );
	set y = 1;
	set x = (select No_of_items from Orders order by Order_ID DESC limit 1 );
	set a =1 ;

INSERT INTO `Bill` (`Total_Price`,`Payment_method`,`Customer_ID`,`Bill_Date`,`Order_ID`)VALUES (a,ELT(FLOOR(RAND() * 5)+1,"Credit_card","Cash","Apple pay","samsung Pay","Google Pay"),(select Customer_ID from Orders order by Order_ID DESC limit 1 ),(select Order_Date from Orders order by Order_ID DESC limit 1 ),z);

	WHILE y  <= x DO
	insert into `Order_Details` (`Order_ID`,`Item_ID`,`Item_Quantity`) values (z,FLOOR(RAND() * 20)+1,1);
	SET  y = y + 1;
	#SET a=a+((select Item_Quantity from Order_Details order by Order_Details_ID DESC limit 1 )*(select CAST(Item_Price as decimal(12,2))  from Item where Item_ID in (select Item_ID from Order_Details order by Order_ID DESC  )limit 1));
    #set b=a;
	update `Bill` set `Total_Price`= Total_Price+((select Item_Quantity from Order_Details order by Order_Details_ID DESC limit 1 )*(select CAST(Item_Price as decimal(12,2))  from Item where Item_ID in (select Item_ID from Order_Details order by Order_Details_ID DESC  )limit 1)) where  Order_ID = (select max(Order_ID) from Orders);
    #update `Bill` set `Total_Price`= (select CAST(Item_Price as decimal(12,2) ) from Item where Item_ID in (select Item_ID from Order_Details order by Order_ID DESC  )limit 1) where  Order_ID = (select max(Order_ID) from Orders);
    END WHILE;
    
    
set a=cast(a as char(50)) ;  


END//
DELIMITER ;

# After insert Trigger
#Note:1.the insert trigger will update the no. of orders and the no. of visits on customer table 2.It also inserts into Order_details table 3.It also inserts into Bill for the order
DROP TRIGGER IF EXISTS `Order_increment`;

DELIMITER $$
Create trigger `Order_increment` 
after insert on Orders
for each row
BEGIN
update `Customer` set `Number_of_visits`=Customer.Number_of_visits+1 ,`Number_of_orders`=Customer.Number_of_orders+1  where `Customer_ID`=(select Customer_ID from Orders order by Order_ID DESC limit 1 );

CALL Order_increment_func;



END$$
DELIMITER ;



 
INSERT INTO `Orders` (`Order_Date`,`Customer_ID`,`No_of_items`) VALUES ("13/07/2019",FLOOR(RAND() * 100)+1,FLOOR(RAND() * 5)+1);





#==================================================
##After update Trigger##
DROP TRIGGER IF EXISTS `after_order_update`;

DELIMITER $$
CREATE TRIGGER after_order_update After  UPDATE ON Orders
FOR EACH ROW
BEGIN
delete from order_details where Order_ID =(select Order_ID  from Orders order by Order_ID DESC limit 1 );
delete from bill where Order_ID =(select Order_ID  from Orders order by Order_ID DESC limit 1 );
############This part needs work

CALL Order_increment_func;

END$$
DELIMITER ;
update orders set No_of_items=(FLOOR(RAND() * 5)+1)  where Order_ID=(select max(Order_ID) from Order_details  );
#delete from order_details where Order_ID =(select Order_ID from Orders order by Order_ID DESC limit 1 );

#CALL Order_increment_func;
#==================================================
##Before Delete Trigger##
#Note:Before deleting the latest order 1.It will decrement the no . of orders the customer has placed in the Customer table 2. Delete the order details 3. Delete the bill
DROP TRIGGER IF EXISTS `before_delete`;

DELIMITER $$
CREATE TRIGGER before_delete Before  Delete ON Orders
FOR EACH ROW

BEGIN
Delete from bill where`Order_ID`=(select Order_ID from Orders order by Order_ID DESC limit 1 );

delete from order_details where`Order_ID`=(select Order_ID from Orders order by Order_ID DESC limit 1 );

update `customer` set `Number_of_orders`=Customer.Number_of_orders-1 where `Customer_ID`=(select Customer_ID from Orders order by Order_ID DESC limit 1 );
END$$
DELIMITER ;
#delete from Orders order by Order_ID DESC limit 1 


#==================================================
##Procedure##
#Note:The procedure will help us update and delete Latest orders
#DROP procedure IF EXISTS `Order_proc`;
#DELIMITER //
#CREATE PROCEDURE Order_proc( all_books varchar(10) )
#BEGIN
#IF all_books = 'Update'
#THEN
############This part needs work SELECT * FROM BOOK ORDER BY Book_Name DESC LIMIT 3;

#select * from customer;
#ELSEIF all_books = 'Delete'
#THEN
#delete from Orders order by Order_ID DESC limit 1 ;


#END IF;
#END //
#DELIMITER ;
#Let us call the procedure:
#CALL Order_proc('Update');
#CALL Order_proc('Delete');

#############################################################
##Procedure##
#Note:The procedure will help us update and delete Latest orders

DROP procedure IF EXISTS `Order_proc`;
DELIMITER //
CREATE PROCEDURE Order_proc( all_books varchar(10))
BEGIN
case
When all_books = 'Update'
THEN

update orders set No_of_items=(FLOOR(RAND() * 5)+1)  where Order_ID=(select max(Order_ID) from bill  );

#select * from customer;

when all_books = 'Delete'
THEN
delete from Orders order by Order_ID DESC limit 1 ;
# delete the recently placed order 
END CASE ;

END //
DELIMITER ;
#Let us call the procedure:
CALL Order_proc('Update');
CALL Order_proc('Delete');

#update orders set No_of_items=(FLOOR(RAND() * 5)+1)  where Order_ID=(select Order_ID from Order_details order by Order_ID DESC limit 1 );