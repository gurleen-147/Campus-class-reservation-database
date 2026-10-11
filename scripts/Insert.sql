
INSERT INTO Course
VALUES (2221, 'Database Systems'),
       (1180, 'Object Oriented Computing'),
       (1030, 'Web Development'),
       (1280, 'Unix Tools and Scripting'),
       (1121, 'General Chemisty I'),
       (1171, 'Calculus I'),
       (1118, 'Introductory Physics'),
       (1107, 'Dynamic Earth'),
       (1160, 'Algorithms and Data Structors I'),
       (1480, 'Networking');

INSERT INTO Semester
VALUES (2024, 1),
       (2023, 3),
	   (2023, 2),
       (2023, 1),
       (2022, 3),
       (2022, 2),
       (2022, 1),
       (2021, 3),
       (2021, 2),
       (2021, 1);

INSERT INTO People
VALUES 	(100001, 'Sam', 'Taylor'),
		(100002, 'Jane', 'Smith'),
		(100003, 'Bob', 'Brown'),
		(100004, 'Alice', 'Johnson'),
		(100005, 'Tom', 'Hanks'),
		(100006, 'Mary', 'Jones'),
		(100007, 'Peter', 'Parker'),
		(100008, 'Tony', 'Stark'),
		(100009, 'Steve', 'Rogers'),
		(100010, 'Natasha', 'Romanoff');

INSERT INTO Instructor
VALUES (100001),
       (100002),
	   (100003);

INSERT INTO `General` -- `General` does not work in mySqlServer
VALUES (100004),
       (100005),
       (100006),
       (100007),
       (100008),
       (100009),
       (100010);

INSERT INTO Student
VALUES (100004),
       (100005),
       (100006),
       (100008),
       (100010);

INSERT INTO AdministrativeStaff
VALUES (100004),
       (100008),
       (100007),
       (100009);

INSERT INTO EquipmentName
VALUES ('Chair', 'Utilities'),
       ('Projector', 'Electronics'),
	   ('Marker', 'Stationary'),
       ('Printer', 'Electronics'),
       ('Scanner', 'Electronics'),
       ('Microscope', 'Science'),
       ('Telescope', 'Science'),
       ('Beaker', 'Science'),
       ('Desk', 'Utilities');

INSERT INTO Room
VALUES	('A', 2, 205, 25),
		('A', 1, 101, 20),
		('B', 2, 201, 25),
		('C', 3, 301, 30),
		('T', 4, 401, 35),
		('A', 2, 202, 40),
		('B', 1, 102, 45),
		('C', 3, 302, 50),
		('T', 4, 403, 15),
		('A', 1, 103, 20),
		('B', 2, 203, 25),
		('C', 3, 303, 30);

INSERT INTO Office
VALUES 	('A', 2, 205),
		('A', 1, 101),
		('B', 2, 201);

INSERT INTO ClassRoom
VALUES ('C', 3, 301),
		('T', 4, 401),
		('A', 2, 202),
        ('B', 2, 203),
		('C', 3, 303);


INSERT INTO Lab
VALUES 	('B', 1, 102),
		('C', 3, 302),
		('T', 4, 403),
		('A', 1, 103);

INSERT INTO `Schedule` -- `Schedule` does not work in mySqlServer
VALUES 	(1, '2221', 'A', 2, 202),
		(2, '1180', 'T', 4, 401),
		(3, '1030', 'C', 3, 301),
		(4, '1280', 'A', 1, 101),
		(5, '1121', 'B', 1, 102),
		(6, '1171', 'C', 3, 303),
		(7, '1118', 'C', 3, 302),
		(8, '1107', 'B', 2, 203),
		(9, '1160', 'A', 1, 103),
		(10, '1480', 'B', 2, 201);  

INSERT INTO TimeSlot
VALUES 	(1, '08:30', '10:20', 0),
		(2, '10:30', '12:20', 0),
		(3, '12:30', '14:20', 0),
		(4, '08:30', '10:20', 1),
		(5, '10:30', '12:20', 1),
		(6, '12:30', '14:20', 1),
		(7, '08:30', '10:20', 2),
		(8, '10:30', '12:20', 2),
		(9, '12:30', '14:20', 2),
		(10, '08:30', '10:20', 3);
	

INSERT INTO Equipment
VALUES 	(1001, 'Chair', 'A', 2, 205),
		(1002, 'Projector', 'A', 1, 101),
		(1003, 'Marker', 'B', 2, 201),
		(1004, 'Printer', 'C', 3, 301),
		(1005, 'Scanner', 'T', 4, 401),
		(1006, 'Microscope', 'A', 2, 202),
		(1007, 'Telescope', 'B', 1, 102),
		(1008, 'Beaker', 'C', 3, 302),
		(1009, 'Desk', 'T', 4, 403),
		(1010, 'Chair', 'A', 1, 103),
		(1011, 'Projector', 'B', 2, 203),
		(1012, 'Marker', 'C', 3, 303);

INSERT INTO Section
VALUES (2221012024, 'InPerson'),
	   (1180032023, 'Online'),
	   (1030032023, 'Mixed'),
       (1280032023, 'InPerson'),
	   (1121032023, 'Online'),
	   (1171022022, 'Mixed'),
       (1118022022, 'InPerson'),
	   (1107022022, 'Online'),
	   (1160022021, 'Mixed'),
       (1480022021, 'Mixed');

INSERT INTO CourseSemesterSection
VALUES 	(2023, 1, 2221, 2221012024, 1, 100001),
		(2023, 2, 1180, 1180032023, 2, 100002),
		(2023, 3, 1030, 1030032023, 3, 100003),
		(2024, 1, 1280, 1280032023, 4, 100001),
		(2023, 1, 1121, 1121032023, 5, 100002),
		(2023, 2, 1171, 1171022022, 6, 100003),
		(2023, 3, 1118, 1118022022, 7, 100001),
		(2024, 1, 1107, 1107022022, 8, 100002),
		(2023, 1, 1160, 1160022021, 9, 100003),
		(2023, 2, 1480, 1480022021, 10, 100001);

INSERT INTO PeopleBookEventsRoom
VALUES  (100001, 'A', 2, 202, '08:00', 'Lecture', '02:00', '2024-03-26'),
        (100002, 'B', 1, 102, '10:00', 'Lab', '01:30', '2024-03-27'),
        (100003, 'C', 3, 301, '13:00', 'Seminar', '01:00', '2024-03-28'),
        (100004, 'T', 4, 401, '15:00', 'Workshop', '02:30', '2024-03-29'),
        (100005, 'A', 1, 101, '09:00', 'Meeting', '03:00', '2024-03-25'),
        (100006, 'B', 2, 201, '11:00', 'Study Session', '02:00', '2024-04-01'),
        (100007, 'C', 3, 302, '14:00', 'Discussion', '01:30', '2024-04-02'),
        (100008, 'T', 4, 403, '16:00', 'Project Planning', '02:00', '2024-04-03'),
        (100009, 'A', 2, 202, '10:30', 'Review', '01:00', '2024-04-04'),
        (100010, 'B', 1, 102, '13:30', 'Interviews', '01:00', '2024-04-05');

