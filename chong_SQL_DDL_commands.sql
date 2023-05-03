# Task 1 Create tables

CREATE TABLE `customer` (
	`customer_id` 	INTEGER			NOT null AUTO_INCREMENT PRIMARY KEY,
	`first_name` 	VARCHAR (30)	NOT null,
	`last_name` 	VARCHAR (30)	NOT null,
	`street` 		VARCHAR (255)	NOT null,
	`city` 			VARCHAR (50)	NOT null,
	`state` 		CHAR (2)		NOT null,
	`zipcode` 		CHAR (10)		NOT null,
	`phone`			VARCHAR (10)	NOT null,
	`email` 		VARCHAR (50)
 
);

CREATE TABLE `item` (
	`item_id`			INTEGER			NOT null AUTO_INCREMENT PRIMARY KEY,
	`item_description`	VARCHAR (255) 	NOT null
  
);

CREATE TABLE `employee` (
	`employee_id`	INTEGER			NOT null	AUTO_INCREMENT	PRIMARY KEY,
	`first_name` 	VARCHAR (30)	NOT null,
	`last_name` 	VARCHAR (30)	NOT null,
	`street` 		VARCHAR (255)	NOT null,
	`city` 			VARCHAR (50)	NOT null,
	`state` 		CHAR (2)		NOT null,
	`zipcode` 		CHAR (10)		NOT null,
	`hire_date`		DATE			NOT	null,
	`manager_id`	INTEGER,
	CONSTRAINT `manager_fk` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `invoice` (
	`invoice_id`	INTEGER			NOT null	AUTO_INCREMENT	PRIMARY KEY,
	`date_in` 		DATETIME		NOT null,
	`date_out` 		DATETIME,
	`customer_id` 	INTEGER			NOT null,
	`employee_id`	INTEGER,
	CONSTRAINT `employee_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `invoice_item` (
	`invoice_id`	INTEGER			NOT null,
	`item_id` 		INTEGER			NOT null,
	`quantity` 		INTEGER			NOT null,
  	PRIMARY KEY (`invoice_id`, `item_id`),
	CONSTRAINT `invoice_fk1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  	CONSTRAINT `item_fk1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
 	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `complaint` (
	`complaint_id`	INTEGER			NOT null	AUTO_INCREMENT	PRIMARY KEY,
	`date` 			DATE			NOT null,
	`detaials` 		TEXT			NOT null,
	`customer_id` 	INTEGER			NOT null,
	`item_id`		INTEGER			NOT null,
	CONSTRAINT `customer_fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  	CONSTRAINT `item_fk2`		FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
	ON DELETE CASCADE ON UPDATE CASCADE
);

# Task 2 Add price column (I'm assuming you don't want me to delete the table already made...)

ALTER TABLE `item`
ADD `price` DOUBLE NOT null;

# Task 3 Add missing constraint that links invoice to customer

ALTER TABLE `invoice`
ADD CONSTRAINT `customer_fk2`
FOREIGN KEY (`customer_id`)
REFERENCES `customer` (`customer_id`);

# Task 4 Change item_description in the item table
ALTER TABLE `item`
CHANGE `item_description` `description` TEXT NOT null	;

# Task 5 Remove Foreign key constraint
ALTER TABLE `invoice`
DROP FOREIGN KEY `employee_fk1`;

alter TABLE `invoice`
DROP `employee_id`;

# Task 6 Remove complaint and employee tables (pretty drastic, aren't we?)
DROP TABLE `employee`, `complaint`;
