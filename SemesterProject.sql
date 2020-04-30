/*
	Creates OWNER table
*/

CREATE TABLE OWNER (
	OWN_NUM NUMBER(38,0) PRIMARY KEY NOT NULL,
	OWN_LAST_NAME VARCHAR2(25) NOT NULL,
	OWN_FIRST_NAME VARCHAR2(25) NOT NULL,
	OWN_STREET VARCHAR2(25) NOT NULL,
	OWN_CITY VARCHAR2(25) NOT NULL,
	OWN_STATE VARCHAR2(3) NOT NULL );
    
/*
	Creates VEHICLE table
*/

CREATE TABLE VEHICLE (
	VEH_NUM NUMBER(38,0) PRIMARY KEY NOT NULL,
	VEH_MAKE VARCHAR2(25) NOT NULL,
	VEH_MODEL VARCHAR2(25) NOT NULL,
	VEH_YEAR VARCHAR2(5) NOT NULL,
	VEH_COLOR VARCHAR2(25) NOT NULL,
	VEH_PLATE VARCHAR2(25) NOT NULL,
	VEH_STATE VARCHAR2(3) NOT NULL,
	OWN_NUM NUMBER(38,0),
	FOREIGN KEY(OWN_NUM) REFERENCES OWNER );

/*
	Creates REQUEST table
*/

CREATE TABLE REQUEST (
	REQ_NUM NUMBER(38,0) PRIMARY KEY NOT NULL,
	VEH_NUM NUMBER(38,0),
	REQ_DATE DATE,
	FOREIGN KEY(VEH_NUM) REFERENCES VEHICLE );

/*
	Creates SERVICE table
*/

CREATE TABLE SERVICE (
	SVC_NUM NUMBER(38,0) PRIMARY KEY NOT NULL,
	SVC_NAME VARCHAR2(25) NOT NULL,
	SVC_EST_HOURS NUMBER(3,1) DEFAULT 00.0 NOT NULL,
	SVC_EST_PRICE NUMBER (6,2) DEFAULT 0.00 NOT NULL );

/*
	Creates LINE table
*/

CREATE TABLE LINE (
	LIN_NUM NUMBER(38,0) NOT NULL,
	REQ_NUM  NUMBER(38,0) NOT NULL,
	SVC_NUM NUMBER(38,0) NOT NULL,
	LIN_HOURS NUMBER(3,1),
	LIN_PRICE NUMBER(6,2),
	PRIMARY KEY(LIN_NUM, REQ_NUM),
	FOREIGN KEY(REQ_NUM) REFERENCES REQUEST,
	FOREIGN KEY(SVC_NUM) REFERENCES SERVICE );

/*
	Inserts OWNER values
*/

INSERT INTO OWNER VALUES(100, 'ADNEY', 'BRUCE', '200 LEMON DRIVE', 'HARRISBURG', 'PA');  
INSERT INTO OWNER VALUES(101, 'ANDERSON','WILLIAM', '84562 WILSON STREET', 'HARRISBURG', 'PA');
INSERT INTO OWNER VALUES(102, 'BLAKE', 'MARY','7845 RIVERSIDE', 'YORK', 'PA');
INSERT INTO OWNER VALUES(103, 'JUAREZ', 'MARISSA', '961 LAKEWOOD DRIVE', 'YORK', 'PA');
INSERT INTO OWNER VALUES(104, 'KELLY', 'DANIEL', '1654 GARLAND AVENUE', 'WAYNE', 'NJ');
INSERT INTO OWNER VALUES(105, 'TRENT', 'PETER', '3562 WATERS WAY', 'WAYNE', 'NJ');
INSERT INTO OWNER VALUES(106, 'NORTON', 'BECKY', '4286 OAK ROAD', 'WAYNE', 'NJ');

COMMIT;
/*
	Inserts SERVICE values
*/

INSERT INTO SERVICE VALUES(20, 'ENGINE REPAIR', 12, 800);
INSERT INTO SERVICE VALUES(30, 'AIR CONDITIONING SERVICE', 2, 150);
INSERT INTO SERVICE VALUES(40, 'ELECTRICAL SYSTEM REPAIR', 8, 900);
INSERT INTO SERVICE VALUES(50, 'BODY WORK', 24, 3500);
INSERT INTO SERVICE VALUES(60, 'OIL CHANGE', 1, 50);

COMMIT;
/*
	Inserts VEHICLE values
*/

INSERT INTO VEHICLE VALUES(2500, 'FORD', 'ESCAPE', '2016', 'RED', '1523-UXY', 'PA', 100);
INSERT INTO VEHICLE VALUES(3000, 'FORD', 'F150', '2008', 'BLACK', 'ASUX-SD8', 'PA', 100);
INSERT INTO VEHICLE VALUES(3500, 'JEEP', 'WRANGLER', '1999', 'BLUE', '1856-EIS', 'PA', 102);
INSERT INTO VEHICLE VALUES(4000, 'FORD', 'MUSTANG', '2007', 'ORANGE', 'EODL-563', 'PA', 102);
INSERT INTO VEHICLE VALUES(4500, 'LINCOLN', 'MKX', '2011', 'WHITE', '7836-SDE', 'PA', 103);
INSERT INTO VEHICLE VALUES(5000, 'HYUNDAI', 'VELOSTER', '2011', 'BLUE', 'JFW-9861', 'PA', 103);
INSERT INTO VEHICLE VALUES(5500, 'HYUNDAI', 'SONATA', '2001', 'GREEN', 'EOSL-861', 'NJ', 104);
INSERT INTO VEHICLE VALUES(6000, 'TOYOTA', 'COROLLA', '2008', 'BLACK', 'DOSL-EPV', 'NJ', 105);
INSERT INTO VEHICLE VALUES(6500, 'BUICK', 'ENCLAVE', '2015', 'SILVER', 'PSL2-20W', 'NJ', 106);

COMMIT;
/*
	Inserts REQUEST values
*/

INSERT INTO REQUEST VALUES(1025, 2500, '14-APR-18');
INSERT INTO REQUEST VALUES(1050, 2500, '14-APR-17');
INSERT INTO REQUEST VALUES(1075, 6000, '14-APR-16');
INSERT INTO REQUEST VALUES(1100, 5500, '16-DEC-18');
INSERT INTO REQUEST VALUES(1125, 5500, '03-MAR-18');
INSERT INTO REQUEST VALUES(1150, 4500, '05-SEP-17');
INSERT INTO REQUEST VALUES(1175, 4500, '05-JUN-17');
INSERT INTO REQUEST VALUES(1200, 3000, '14-FEB-18');
INSERT INTO REQUEST VALUES(1225, 3000, '12-OCT-18');

COMMIT;
/*
	Inserts LINE values
*/

INSERT INTO LINE VALUES(2, 1025, 60, 0.5, 45.98);
INSERT INTO LINE VALUES(3, 1050, 20, 18, 950.99);
INSERT INTO LINE VALUES(4, 1050, 60, 1, 50);
INSERT INTO LINE VALUES(5, 1075, 60, 1.5, 59.99);
INSERT INTO LINE VALUES(6, 1075, 30, 2, 175);
INSERT INTO LINE VALUES(7, 1100, 60, 0.5, 45.98);
INSERT INTO LINE VALUES(8, 1125, 60, 0.5, 45.98);
INSERT INTO LINE VALUES(9, 1150, 50, 8, 1500.99);
INSERT INTO LINE VALUES(10, 1175, 30, 2, 153.98);
INSERT INTO LINE VALUES(11, 1200, 60, 1.5, 59.99);
INSERT INTO LINE VALUES(12, 1200, 30, 2, 175);
INSERT INTO LINE VALUES(13, 1200, 40, 3, 69.99);
INSERT INTO LINE VALUES(14, 1225, 60, 1.5, 59.99);
INSERT INTO LINE VALUES(15, 1225, 40, 5.5, 203.99);
INSERT INTO LINE VALUES(16, 1225, 20, 6, 497.98);
INSERT INTO LINE VALUES(17, 1225, 30, 2, 175);

COMMIT;
/*
	Returns all table values
*/

SELECT *
FROM LINE;

SELECT *
FROM OWNER;

SELECT *
FROM REQUEST;

SELECT *
FROM SERVICE;

SELECT *
FROM VEHICLE;

/*
	Comparison operators
*/

SELECT *
FROM SERVICE
WHERE SVC_EST_PRICE <= 600;

SELECT VEH_NUM, VEH_MAKE, VEH_MODEL, VEH_YEAR, VEH_COLOR, VEH_PLATE, VEH_STATE, OWN_NUM 
FROM  VEHICLE 
WHERE VEH_YEAR <= 2012;

/*
	Logical operator in OWNER table
*/

SELECT OWN_LAST_NAME
FROM OWNER
WHERE OWN_STATE = 'NJ' OR OWN_CITY = 'YORK';

/*
	Logical operator, special operator, and subquery
*/

SELECT VEH_NUM, VEH_MODEL, VEH_YEAR, VEH_COLOR, VEH_PLATE,VEH_STATE, OWN_NUM
FROM VEHICLE
WHERE VEH_COLOR NOT IN (SELECT VEH_COLOR FROM VEHICLE WHERE VEH_COLOR = 'BLUE');

/*
	Select with special operator
*/

SELECT SVC_NUM,SVC_NAME,SVC_EST_HOURS,SVC_EST_PRICE
FROM SERVICE
WHERE SVC_EST_PRICE BETWEEN 0 AND 350 ;

/*
	Select with table join and order by
*/

SELECT OWNER.OWN_LAST_NAME ||','|| OWNER.OWN_FIRST_NAME AS OWNER_NAME, OWNER.OWN_STREET ||','|| OWNER.OWN_CITY ||','|| OWNER.OWN_STATE AS OWNER_ADDRESS, VEHICLE.VEH_MAKE ||' '|| VEHICLE.VEH_MODEL AS MAKE_MODEL, VEHICLE.VEH_PLATE ||','|| VEHICLE.VEH_STATE AS PLATE_STATE
FROM OWNER, VEHICLE
WHERE OWNER.OWN_NUM = VEHICLE.OWN_NUM
ORDER BY OWNER.OWN_LAST_NAME;

/*
	Select with aggregate function
*/

SELECT AVG(SVC_EST_PRICE) 
FROM SERVICE;

/*
	Update with arithmetic expression
*/

UPDATE SERVICE
SET SVC_EST_HOURS = SVC_EST_HOURS * 2
WHERE SVC_NUM = 50;

COMMIT;

/*
	Update with arithmetic expression
*/

UPDATE SERVICE 
SET SVC_EST_PRICE = SVC_EST_PRICE + 1.05;

COMMIT;

/*
James' SQL script to drop all tables FOR TESTING ONLY
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
*/