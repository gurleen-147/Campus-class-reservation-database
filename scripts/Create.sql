-- Room Booking Management database (MySQL / MariaDB)
-- Team project: Diego Delgado & Gurleen Kaur
-- Run order: Create.sql, then Insert.sql, then Query.sql

-- `---` This feature for assigning names does not work for mySQLServer
CREATE TABLE Course(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL
);

CREATE TABLE Semester(
`Year` YEAR NOT NULL, -- In SQL SERVER `----` format 
-- for assigning name is not permitted
Term INT NOT NULL,

PRIMARY KEY (`Year`,Term) -- `Year` shows error in mySQLServer
);

CREATE TABLE People(
PersonID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50)
);

CREATE TABLE Instructor(
PersonID INT PRIMARY KEY,
FOREIGN KEY (PersonID) REFERENCES People(PersonID) ON DELETE CASCADE
);

CREATE TABLE `General`( -- `General` shows error in mySQLServer
PersonID INT PRIMARY KEY,
FOREIGN KEY (PersonID) REFERENCES People(PersonID) ON DELETE CASCADE
);

CREATE TABLE Student(
PersonID INT PRIMARY KEY,
FOREIGN KEY (PersonID) REFERENCES People(PersonID) ON DELETE CASCADE
);

CREATE TABLE AdministrativeStaff(
PersonID INT PRIMARY KEY,
FOREIGN KEY (PersonID) REFERENCES People(PersonID) ON DELETE CASCADE
);

CREATE TABLE EquipmentName(
`Name` VARCHAR(25) PRIMARY KEY, -- `Names shows error in mySQLServer
`Type` VARCHAR(25) -- `Type` shows error in mySQLServer
);

CREATE TABLE Room(
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL, -- `Floor` shows error in mySQLServer
RoomNumber INT NOT NULL,
Capacity INT,

PRIMARY KEY(Building,`Floor`,RoomNumber) -- `Floor` shows error in mySQLServer
);

CREATE TABLE Office(
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL,
RoomNumber INT NOT NULL,

PRIMARY KEY (Building, `Floor`, RoomNumber),
FOREIGN KEY (Building,`Floor`,RoomNumber) REFERENCES Room(Building,`Floor`,RoomNumber) ON DELETE CASCADE
);

CREATE TABLE ClassRoom(
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL,
RoomNumber INT NOT NULL,

PRIMARY KEY (Building, `Floor`, RoomNumber),
FOREIGN KEY (Building,`Floor`,RoomNumber) REFERENCES Room(Building,`Floor`,RoomNumber) ON DELETE CASCADE
);

CREATE TABLE Lab(
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL,
RoomNumber INT NOT NULL,

PRIMARY KEY (Building, `Floor`, RoomNumber),
FOREIGN KEY (Building,`Floor`,RoomNumber) REFERENCES Room(Building,`Floor`,RoomNumber) ON DELETE CASCADE
);

CREATE TABLE `Schedule`( -- `Schedule` shows error in mySQLServer
ScheduleID INT PRIMARY KEY,
OccupationReason VARCHAR(100),
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL, -- `Floor` shows error in mySQLServer
RoomNumber INT NOT NULL,

FOREIGN KEY (Building, `Floor`, RoomNumber) REFERENCES Room(Building, `Floor`, RoomNumber) ON DELETE CASCADE
); -- `Floor` shows error in mySQLServer

CREATE TABLE TimeSlot(
ScheduleID INT NOT NULL,
StartTime TIME NOT NULL,
EndTime TIME NOT NULL,
`DayOfWeek` INT,

FOREIGN KEY (ScheduleID) REFERENCES `Schedule`(ScheduleID)ON DELETE CASCADE, -- `Schedule` shows error in `Floor` shows error in mySQLServer
PRIMARY KEY (ScheduleID, StartTime)
);

CREATE TABLE Equipment(
SerialNumber INT PRIMARY KEY,
`Name` VARCHAR(25) NOT NULL,
-- `Name` shows error in mySQLServer
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL,-- `Floor` shows error in mySQLServer
RoomNumber INT NOT NULL,

FOREIGN KEY (`Name`) REFERENCES EquipmentName(`Name`) ON DELETE CASCADE,
FOREIGN KEY (Building, `Floor`, RoomNumber) REFERENCES Room(Building, `Floor`, RoomNumber) ON DELETE CASCADE
);

CREATE TABLE Section(
SecID BIGINT PRIMARY KEY NOT NULL,
SecType VARCHAR (10) NOT NULL
);

CREATE TABLE CourseSemesterSection(
`Year` YEAR NOT NULL, -- `Year` shows error in mySQLServer
Term INT NOT NULL,
CourseID INT NOT NULL,
SecID BIGINT NOT NULL,
ScheduleID INT,
PersonID INT,

FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE,
FOREIGN KEY (SecID) REFERENCES Section(SecID) ON DELETE CASCADE,
FOREIGN KEY (ScheduleID) REFERENCES `Schedule`(ScheduleID) ON DELETE CASCADE,
FOREIGN KEY (PersonID) REFERENCES Instructor(PersonID) ON DELETE CASCADE,
FOREIGN KEY (`Year`,Term) REFERENCES Semester(`Year`,Term) ON DELETE CASCADE,
PRIMARY KEY (`Year`,Term, CourseID, SecID)
);

CREATE TABLE PeopleBookEventsRoom(
PersonID INT NOT NULL,
Building CHAR(1) NOT NULL,
`Floor` INT NOT NULL, -- `Floor` shows error in mySQLServer
RoomNumber INT NOT NULL,
StartTime TIME NOT NULL,
Purpose VARCHAR(100) NOT NULL,
Duration TIME NOT NULL,
`Date` DATE,

FOREIGN KEY (PersonID) REFERENCES People(PersonID),
FOREIGN KEY (Building, `Floor`, RoomNumber) REFERENCES Room(Building, `Floor`, RoomNumber) ON DELETE CASCADE,
PRIMARY KEY (PersonID, Building, `Floor`, RoomNumber, `Date`, StartTime)
);
