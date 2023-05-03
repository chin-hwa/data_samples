#Insert this data into all of your remaining tables (delete these insert statements after successfully inserting).

#Insert yourself as a new customer.
INSERT INTO `customer` (`first_name`, `last_name`, `street`, `city`,
`state`, `zipcode`, `phone`, `email`)
VALUES ('Chin-Hwa', 'Chong', '4321 Polk St.', 'Omaha', 'NE', '68107', 
'402-973-2840', 'chinhwachong@creighton.edu')
;

#Add a new item of your choice.
INSERT INTO     `item` (`description`, `price`)
VALUES          ('Men''s Kilt','500')
;

#Create a new invoice where you are the customer.
INSERT INTO     `invoice` (`date_in`,`customer_id`)
VALUES          ('20191002','51')
;

#Add your new item to the invoice you just created.
INSERT INTO     `invoice_item` 
VALUES          ('201','14','3')
;

#Using a query, show the structure (i.e. field, data type, null, key, default, auto_increment) of the customer table.
SELECT *
FROM	`customer`
;

#Change Jedidiah Bugbee's phone to 712-883-6006.
UPDATE		`customer`
SET			`phone` = '712-883-6006'
WHERE		`last_name` = 'Bugbee'
;

#Increase the price for dry cleaning a Blouse by 14%.
SELECT 	`description`, `price`, `price` * 1.1 AS `increase`
FROM 	`item`
WHERE	`description` = 'Blouse'
;

#Show all items that cost between $2.50 and $5 to dry clean.
SELECT*
FROM	`item`
WHERE	`price` BETWEEN 2.5 and 5
;

#List the first name, last name, and phone for all customers whose second and third numbers of their phone number are 13 and their last name doesn't start with a G.
SELECT  `first_name`, `last_name`, `phone`
FROM	`customer`
WHERE	`phone` LIKE '_13%' AND `last_name` NOT LIKE 'G%'
;

#Show all information for customers who have an email address. Sort customers by last name in ascending order and then by first name in descending order.
SELECT*
FROM		`customer`
WHERE		`email` IS NOT NULL
ORDER BY	`last_name`, `first_name` DESC
;

#In one query, show the total number of items and the maximum, minimum, and average unit price (round the average to two decimal places) for all items.
SELECT COUNT(*), MAX(`price`), MIN(`price`), Round(AVG(`price`),2)
FROM	`item`
;

#Show the customer with the longest email address.
SELECT  `first_name`, `last_name`, `email`
FROM	`customer`
GROUP BY length	(`email`) desc
;

#Using the DateDiff function, show the difference between today and the date each invoice went out.
SELECT	`invoice_id`,  datediff(CURRENT_DATE(),`date_out`)
FROM	`invoice`
;

#Show the total number of invoices received on each date where the date in is after June 1, 2017.
SELECt*
FROM	`invoice`
GROUP BY `date_in`
HAVING `date_in` > ('20170601')
;

#For each item, show the total quantity included on all invoices where the total quantity is greater than or equal to 30. Give the total quantity column an alias of total_quantity.
SELECT	`item_id`, COUNT(`quantity`)AS`total_quantity`
FROM	`invoice_item`
GROUP BY `item_id`
HAVING	`total_quantity` >= 30
;

#Remove Formal Gown from the item table.
DELETE FROM `item`
WHERE `description` = 'Formal Gown'
;

#Provide only the code (you won't be able to run them successfully) to the queries that would give the following privileges on the customer table to the users indicated. Use ALL privileges when all four privileges apply. Assume that human resources currently has the privilege to SELECT already:

GRANT ALL
ON	`chc72331`.`owner`
TO	`djr84385`
WITH GRANT OPTION
;

GRANT ALL
ON	`chc72331`.`manager`
TO	`djr84385`
WITH GRANT OPTION
;

GRANT SELECT, UPDATE
ON	`chc72331`.`employee`
TO `djr84385`
WITH GRANT OPTION
;

REVOKE SELECT
ON	`chc72331`.`human_resources`
FROM `djr84385`
;

#Grant all privileges on your invoice_item table to one of your classmates (net ID must be lowercase) with the ability to pass these privileges to others. Have your classmate test this access.

GRANT ALL
ON	`chc72331`.`invoice_item`
TO	`djr84385`
WITH GRANT OPTION
;

#Grant the select privilege on all tables in your database to another classmate. Have your classmate test this access.

GRANT SELECT
ON `chc72331`.*
TO	`djr84385`
WITH GRANT OPTION
;

#Remove all privileges you granted to your classmates. Have your classmates test to see if they no longer have access.

REVOKE ALL
ON	`chc72331`.*
FROM `djr84385`
;

REVOKE GRANT OPTION
ON	`chc72331`.*
FROM `djr84385`
;