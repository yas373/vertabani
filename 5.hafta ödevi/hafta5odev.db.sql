BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `WORKS_ON` (
	`Essn`	CHAR ( 9 ),
	`Pno`	INT,
	`Hours`	DECIMAL ( 3 , 1 ),
	PRIMARY KEY(`Essn`,`Pno`),
	FOREIGN KEY(`Pno`) REFERENCES `PROJECT`(`Pnumber`),
	FOREIGN KEY(`Essn`) REFERENCES `EMPLOYEE`(`Ssn`)
);
INSERT INTO `WORKS_ON` (Essn,Pno,Hours) VALUES ('123456789',1,32.5),
 ('123456789',2,7.5),
 ('666884444',3,40),
 ('453453453',1,20),
 ('453453453',2,20),
 ('333445555',2,10),
 ('333445555',3,10),
 ('333445555',10,10),
 ('333445555',20,10),
 ('999887777',30,30),
 ('999887777',10,10),
 ('987987987',10,35),
 ('987987987',30,5),
 ('987654321',30,20),
 ('987654321',20,15),
 ('888665555',20,'NULL');
CREATE TABLE IF NOT EXISTS `PROJECT` (
	`Pname`	VARCHAR ( 15 ) NOT NULL UNIQUE,
	`Pnumber`	INT NOT NULL,
	`Plocation`	VARCHAR ( 15 ),
	`Dnum`	INT NOT NULL,
	FOREIGN KEY(`Dnum`) REFERENCES `DEPARTMENT`(`Dnumber`),
	PRIMARY KEY(`Pnumber`)
);
INSERT INTO `PROJECT` (Pname,Pnumber,Plocation,Dnum) VALUES ('ProductX',1,'Bellaire',5),
 ('ProductY',2,'Sugarland',5),
 ('ProductZ',3,'Houston',5),
 ('Computerization',10,'Stafford',4),
 ('Reorganization',20,'Houston',1),
 ('Newbenefits',30,'Stafford',4);
CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
	`Fname`	VARCHAR ( 15 ) NOT NULL,
	`Minit`	CHAR,
	`Lname`	VARCHAR ( 15 ) NOT NULL,
	`Ssn`	CHAR ( 9 ) NOT NULL,
	`Bdate`	DATE,
	`Address`	VARCHAR ( 30 ),
	`Sex`	CHAR,
	`Salary`	DECIMAL ( 10 , 2 ),
	`Super_ssn`	CHAR ( 9 ),
	`Dno`	INT NOT NULL,
	FOREIGN KEY(`Super_ssn`) REFERENCES `EMPLOYEE`(`Ssn`),
	PRIMARY KEY(`Ssn`),
	FOREIGN KEY(`Dno`) REFERENCES `DEPARTMENT`(`Dnumber`)
);
INSERT INTO `EMPLOYEE` (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) VALUES ('Franklin','T','Wong','333445555','1955-12-08','638 Voss,Houston,TX','M',40000,'888665555',5),
 ('Jennifer','S','Wallace','987654321','1941-06-20','291,Berry,Bellaire,TX','F',43000,'888665555',4),
 ('John','B','Smith','123456789','1965-01-09','731 Fondran,Houston,TX','M',30000,'333445555',5),
 ('Alicia','J','Zelaya','999887777','1968-01-19','3321 Castle,Spring,TX','F',25000,'987654321',4),
 ('Ramesh','K','Narayan','666884444','1962-09-15','975 Fire Oak,Humble,TX','M',38000,'333445555',5),
 ('Joyce','A','English','453453453','1972-07-31','5631 Rice,Houston,TX','F',25000,'333445555',5),
 ('Ahmad','V','Jabbar','987987987','1969-03-29','980 Dallas,Houston,TX','M',25000,'987654321',4),
 ('James','E','Borg','888665555','1937-11-10','450 Stone,Houston,TX','M',55000,NULL,1);
CREATE TABLE IF NOT EXISTS `DEPT_LOCATIONS` (
	`Dnumber`	INT NOT NULL,
	`Dlocation`	VARCHAR ( 15 ) NOT NULL,
	PRIMARY KEY(`Dnumber`,`Dlocation`),
	FOREIGN KEY(`Dnumber`) REFERENCES `DEPARTMENT`(`Dnumber`)
);
INSERT INTO `DEPT_LOCATIONS` (Dnumber,Dlocation) VALUES (1,'Houston'),
 (4,'Stafford'),
 (5,'Bellaire'),
 (5,'Sugarland'),
 (5,'Houston');
CREATE TABLE IF NOT EXISTS `DEPENDENT` (
	`Essn`	CHAR ( 9 ) NOT NULL,
	`Dependent_name`	VARCHAR ( 15 ) NOT NULL,
	`Sex`	CHAR,
	`Bdate`	DATE,
	`Relationship`	VARCHAR ( 8 ),
	FOREIGN KEY(`Essn`) REFERENCES `EMPLOYEE`(`Ssn`),
	PRIMARY KEY(`Essn`,`Dependent_name`)
);
INSERT INTO `DEPENDENT` (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES ('333445555','Alice','F','1986-04-05','Daughter'),
 ('333445555','Theodore','M','1983-10-25','Son'),
 ('333445555','Joy','F','1958-05-03','Spouse'),
 ('987654321','Abner','M','1942-02-28','Spouse'),
 ('123456789','Michael','M','1988-01-04','Son'),
 ('123456789','Alice','F','1988-12-30','Daughter'),
 ('123456789','Elizabeth','F','1967-05-05','Spouse');
CREATE TABLE IF NOT EXISTS `DEPARTMENT` (
	`Dname`	VARCHAR ( 15 ) NOT NULL UNIQUE,
	`Dnumber`	INT NOT NULL,
	`Mgr_ssn`	CHAR ( 9 ) NOT NULL,
	`Mgr_start_date`	DATE,
	FOREIGN KEY(`Mgr_ssn`) REFERENCES `EMPLOYEE`(`Ssn`),
	PRIMARY KEY(`Dnumber`)
);
INSERT INTO `DEPARTMENT` (Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES ('Research',5,'333445555','1988-05-22'),
 ('Administration',4,'987654321','1995-01-01'),
 ('Headquarters',1,'888665555','1981-06-19');
COMMIT;
