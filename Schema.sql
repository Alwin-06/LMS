CREATE DATABASE LAB_MANAGEMENT;

USE LAB_MANAGEMENT;

CREATE TABLE STUDENT
(
	SID VARCHAR(10) PRIMARY KEY,
	RollNo INT NOT NULL,
	Name VARCHAR(25) NOT NULL,
    Semester INT NOT NULL,
	Department VARCHAR(25) NOT NULL,
	DOB DATE NOT NULL,
	Password VARCHAR(25) NOT NULL
);

INSERT INTO STUDENT VALUES
('S001', 101, 'Alice John', 3, 'CSE', '2001-04-15', 'alice123'),
('S002', 102, 'Bob Mathew', 2, 'CSE', '2002-05-22', 'bob123'),
('S003', 103, 'Akshaya Kumar', 4, 'ECE', '2001-09-30', 'aks123'),
('S004', 104, 'Muhammed Afsal', 2, 'EEE', '2002-12-05', 'afs123'),
('S005', 105, 'Edwin Norton', 5, 'CSE', '2005-11-11', 'edwin2024');

CREATE TABLE LAB
(
	Lab_Name VARCHAR(25) NOT NULL,
	RoomNo INT PRIMARY KEY,
	CAPACITY INT NOT NULL
);

INSERT INTO LAB VALUES
('OS Lab', 201, 40),
('DBMS Lab', 102, 40),
('MP&MC Lab', 101,25),
('DIGITAL Lab', 103, 25),
('NETWORKING Lab', 202, 40);

CREATE TABLE COMPONENTS
(
	Specification VARCHAR(50),
	Number CHAR(10) PRIMARY KEY
);
INSERT INTO COMPONENTS VALUES
('CHAIR', 'CH001'),
('TABLE', 'T001'),
('Monitor', 'M001'),
('CPU', 'CP001'),
('Keyboard', 'K001'),
('Mouse', 'L001'),
('Chair', 'CH002'),
('Table', 'T002'),
('Monitor', 'M002'),
('CPU', 'CP002'),
('Keyboard', 'K002'),
('Mouse', 'L002'),
('Chair', 'CH003'),
('Table', 'T003'),
('Monitor', 'M003'),
('CPU', 'CP003'),
('Chair', 'CH004'),
('Table', 'T004'),
('Monitor', 'M004'),
('CPU', 'CP004'),
('Keyboard', 'K003'),
('Mouse', 'L003'),
('Chair', 'CH005'),
('Table', 'T005'),
('Monitor', 'M005'),
('CPU', 'CP005'),
('Keyboard', 'K004'),
('Mouse', 'L004'),
('Chair', 'CH006'),
('Table', 'T006'),
('Monitor', 'M006'),
('CPU', 'CP006'),
('Keyboard', 'K005'),
('Mouse', 'L005'),
('Chair', 'CH007'),
('Table', 'T007'),
('Monitor', 'M007'),
('CPU', 'CP007');


CREATE TABLE LABSTAFF
(
	ID VARCHAR(10) PRIMARY KEY,
	Name VARCHAR(25) NOT NULL,
	Roles VARCHAR(20) NOT NULL,
    Password VARCHAR(20) NOT NULL
);
INSERT INTO LABSTAFF VALUES
('L001', 'Mr. Krishnamoorthy', 'Lab Coordinator','LB1'),
('L002', 'Mr. Abu Bakker', 'Lab Technician','LB2'),
('L003', 'Mr. Chackochy', 'Lab Assistant','LB3'),
('L004', 'Mrs. Rani', 'Lab Supervisor','LB4'),
('L005', 'Mr. Sobichan', 'Lab Manager','LB5');

CREATE TABLE LABSTAFF2
(
	ID VARCHAR(10),
	PhoneNo CHAR(10),
	PRIMARY KEY(ID,PhoneNo),
	FOREIGN KEY (ID) REFERENCES LABSTAFF(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO LABSTAFF2 VALUES
('L001', '9234567890'),
('L002', '7345678901'),
('L003', '7456789012'),
('L004', '9567890123'),
('L005', '8678901234');

CREATE TABLE COURSE
(
	Code CHAR(10) PRIMARY KEY,
	Course_Name VARCHAR(40) NOT NULL,
	Semester INT NOT NULL
);

INSERT INTO COURSE VALUES
('CSL204', 'Operating system', 4),
('CSL333', 'DBMS', 5),
('CSL102', 'Programming in C', 2),
('CSL331', 'System Software and Microprocessor',5),
('CSL201', 'OOPS JAVA', 3),
('CSL202', 'Digital Electronics',4),
('CSL203', 'Data Structures',3);

CREATE TABLE COMES(
	RoomNo INT,
	SID VARCHAR(10),
	Type VARCHAR(25) NOT NULL,
	Date DATE NOT NULL,
	TimeIn TIME NOT NULL,
	TimeOut TIME NOT NULL,
	PRIMARY KEY(RoomNo,SID),
	FOREIGN KEY(RoomNo) REFERENCES LAB(RoomNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(SID) REFERENCES STUDENT(SID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO COMES VALUES
(201, 'S001', 'Regular', '2024-09-01', '08:00:00', '10:00:00'),
(202, 'S002', 'Experiment', '2024-09-01', '10:00:00', '12:00:00'),
(103, 'S003', 'Regular', '2024-09-02', '09:00:00', '11:00:00'),
(101, 'S004', 'Project', '2024-09-02', '11:00:00', '13:00:00'),
(102, 'S005', 'Regular', '2024-09-03', '14:00:00', '16:00:00');

CREATE TABLE OFFERS
(
	RoomNo INT,
	Code CHAR(10),
	PRIMARY KEY(RoomNo,Code),
	FOREIGN KEY(RoomNo) REFERENCES LAB(RoomNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Code) REFERENCES COURSE(Code) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO OFFERS VALUES
(202, 'CSL102'),
(201, 'CSL204'),
(103, 'CSL202'),
(201, 'CSL201'),
(202, 'CSL203'),
(201, 'CSL331'),
(102, 'CSL333');

CREATE TABLE WORKSIN
(
	RoomNo INT,
	ID VARCHAR(10),
	PRIMARY KEY(RoomNo,ID),
	FOREIGN KEY(RoomNo) REFERENCES LAB(RoomNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID) REFERENCES LABSTAFF(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO WORKSIN VALUES
(101, 'L001'),
(102, 'L002'),
(103, 'L003'),
(201, 'L004'),
(202, 'L005');

CREATE TABLE SUSE
(
	SID VARCHAR(10),
	Number CHAR(10),
	PRIMARY KEY(SID,Number),
	FOREIGN KEY(SID) REFERENCES STUDENT(SID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Number) REFERENCES COMPONENTS(Number) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO SUSE VALUES
('S001', 'CH001'),
('S002', 'CH002'),
('S003', 'CH003'),
('S004', 'CH004'),
('S005', 'CH005');

CREATE TABLE LUSE
(
	ID VARCHAR(10),
	Number CHAR(10),
	PRIMARY KEY(ID,Number),
	FOREIGN KEY(ID) REFERENCES LABSTAFF(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Number) REFERENCES COMPONENTS(Number) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO LUSE VALUES
('L001', 'CH001'),
('L002', 'CH002'),
('L003', 'CH003'),
('L004', 'CH004'),
('L005', 'CH005');

CREATE TABLE HAS
(
	RoomNo INT,
	Number CHAR(10),
	PRIMARY KEY(RoomNo,Number),
	FOREIGN KEY(RoomNo) REFERENCES LAB(RoomNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Number) REFERENCES COMPONENTS(Number) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO HAS VALUES
(101, 'CH001'),
(102, 'CH002'),
(103, 'CH003'),
(201, 'CH004'),
(202, 'CH005');

CREATE TABLE ATTENDANCE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(10) NOT NULL,
    staff_id VARCHAR(10) NOT NULL,
    lab_room INT NOT NULL,
    computer_number VARCHAR(20) NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES STUDENT(SID),
    FOREIGN KEY (staff_id) REFERENCES LABSTAFF(ID),
    FOREIGN KEY (lab_room) REFERENCES LAB(RoomNo)
);

/*
DROP TABLE HAS;
DROP TABLE LUSE;
DROP TABLE SUSE;
DROP TABLE WORKSIN;
DROP TABLE OFFERS;
DROP TABLE COMES;
DROP TABLE COURSE;
DROP TABLE LABSTAFF2;
DROP TABLE LABSTAFF;
DROP TABLE COMPONENTS;
DROP TABLE LAB;
DROP TABLE STUDENT;

DROP DATABASE LAB_MANAGEMENT;
*/
