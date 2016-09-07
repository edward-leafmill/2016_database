CREATE TABLE `RETAIL_ORDER` (
  `OrderNumber` integer NOT NULL,
  `StoreNumber` integer DEFAULT NULL,
  `StoreZip` text DEFAULT NULL,
  `OrderMonth` text NOT NULL,
  `OrderYear` integer NOT NULL,
  `OrderTotal` numeric DEFAULT NULL,
  PRIMARY KEY (`OrderNumber`)
);

INSERT INTO `RETAIL_ORDER` (`OrderNumber`, `StoreNumber`, `StoreZip`, `OrderMonth`, `OrderYear`, `OrderTotal`) VALUES (1000,10,'98110','December',2014,445.00),(2000,20,'02335','December',2014,310.00),(3000,10,'98110','January',2015,480.00);


CREATE TABLE `SKU_DATA` (
  `SKU` integer NOT NULL,
  `SKU_Description` text NOT NULL,
  `Department` text NOT NULL,
  `Buyer` integer DEFAULT NULL,
  PRIMARY KEY (`SKU`)
);

INSERT INTO `SKU_DATA` (`SKU`, `SKU_Description`, `Department`, `Buyer`) VALUES (100100,'Std. Scuba Tank, Yellow','Water Sports','Pete Hansen'),(100200,'Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'),(101100,'Dive Mask, Small Clear','Water Sports','Nancy Meyers'),(101200,'Dive Mask, Med Clear','Water Sports','Nancy Meyers'),(201000,'Half-dome Tent','Camping','Cindy Lo'),(202000,'Half-dome Tent Vestibule','Camping','Cindy Lo'),(301000,'Light Fly Climbing Harness','Climbing','Jerry Martin'),(302000,'Locking Carabiner, Oval','Climbing','Jerry Martin');

CREATE TABLE `ORDER_ITEM` (
  `OrderNumber` INTEGER NOT NULL,
  `SKU` INTEGER NOT NULL,
  `Quantity` INTEGER NOT NULL,
  `Price` NUMERIC NOT NULL,
  `ExtendedPrice` NUMERIC NOT NULL,
  PRIMARY KEY (`SKU`,`OrderNumber`),
  FOREIGN KEY(OrderNumber) REFERENCES RETAIL_ORDER(OrderNumber),
  FOREIGN KEY(SKU) REFERENCES SKU_DATA(SKU)
);

INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`, `Quantity`, `Price`, `ExtendedPrice`) VALUES (3000,100200,1,300.00,300.00),(2000,101100,4,50.00,200.00),(3000,101100,2,50.00,100.00),(2000,101200,2,50.00,100.00),(3000,101200,1,50.00,50.00),(1000,201000,1,300.00,300.00),(1000,202000,1,130.00,130.00);

SELECT *
FROM RETAIL_ORDER;

SELECT * 
FROM SKU_DATA;

SELECT * 
FROM ORDER_ITEM;