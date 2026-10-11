-- Room Booking Management: SQL queries (MySQL / MariaDB)

-- 1 Show me rooms that can host between 15 and 35 people
SELECT *
FROM Room
WHERE Capacity > 15 AND Capacity < 35
ORDER BY Capacity DESC;

-- 2 update time duration of a booking
UPDATE PeopleBookEventsRoom
SET Duration = '01:30'
WHERE PersonID = 100005 AND Building = 'A' AND `Floor` = 1 AND RoomNumber = 101;

-- 3 delete booked time
DELETE
FROM PeopleBookEventsRoom
WHERE PersonID = 100008 AND Building = 'T' AND `Floor` = 4 AND RoomNumber = 403;

-- 4 display which rooms have which pieces of equipment
SELECT Building, `Floor`, RoomNumber, SerialNumber, `Name`
FROM Equipment
NATURAL JOIN Room;

-- 5 display total number of rooms, the total capacity, and the average capacity of all rooms on campus
SELECT COUNT(*) AS TotalNumberOfRooms, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity
FROM Room;

-- 6 display total number of rooms on First floor of each building
SELECT Building, COUNT(RoomNumber) AS RoomsOnFirstFloor
FROM Room
WHERE `Floor` = 1
GROUP BY Building;

-- 7 [FIXED] display the course(s) with the most sections
SELECT C.CourseName, COUNT(*) AS NumberOfSections
FROM Course C
JOIN CourseSemesterSection CS ON C.CourseID = CS.CourseID
GROUP BY C.CourseID, C.CourseName
HAVING COUNT(*) = (
    SELECT MAX(SectionCount)
    FROM (SELECT COUNT(*) AS SectionCount FROM CourseSemesterSection GROUP BY CourseID) AS Counts
);

-- 8 [FIXED] display serial number, name of equipment, room where equipment is placed
-- (|| means "or" in MySQL, so CONCAT is used to join text)
SELECT SerialNumber, `Name`, CONCAT(Building, ' ', `Floor`, ' ', RoomNumber) AS Room
FROM Equipment;

-- 9 display all second year courses
SELECT CourseName
FROM Course
WHERE CourseID LIKE '2%';

-- 10 [FIXED] display each booking with its start time, end time and room
SELECT StartTime AS `Start Time`,
       ADDTIME(StartTime, Duration) AS `End Time`,
       CONCAT(Building, ' ', `Floor`, ' ', RoomNumber) AS Room
FROM PeopleBookEventsRoom
ORDER BY `Date`, StartTime;

-- 11 display all labs with capacity more than 25
SELECT R.Building, R.`Floor`, R.RoomNumber AS `Lab Room`, Capacity
FROM Room R, Lab L  -- Lab does not have a capacity column, so it comes from Room.
WHERE R.Building = L.Building AND R.`Floor` = L.`Floor` AND R.RoomNumber = L.RoomNumber AND Capacity > 25;

-- 12 [FIXED] display instructors who are not teaching any course in year 2024
SELECT P.FirstName, P.LastName
FROM People P
JOIN Instructor I ON P.PersonID = I.PersonID
LEFT JOIN CourseSemesterSection CS ON CS.PersonID = I.PersonID AND CS.`Year` = 2024
WHERE CS.CourseID IS NULL;

-- 13 display all unique student names (a name shared by two students shows once)
SELECT DISTINCT FirstName, LastName
FROM People P, Student S
WHERE P.PersonID = S.PersonID;

-- 14 [FIXED] display rooms that are free (not booked) on 2024-03-26
SELECT CONCAT(R.Building, ' ', R.`Floor`, ' ', R.RoomNumber) AS FreeRoom
FROM Room R
WHERE NOT EXISTS (
    SELECT 1
    FROM PeopleBookEventsRoom B
    WHERE B.Building = R.Building AND B.`Floor` = R.`Floor` AND B.RoomNumber = R.RoomNumber
      AND B.`Date` = '2024-03-26'
)
ORDER BY FreeRoom;

-- 15 display all rooms that are booked for a Lab or a Lecture
SELECT Building, `Floor`, RoomNumber
FROM PeopleBookEventsRoom
WHERE Purpose = 'Lab' OR Purpose = 'Lecture';

-- 16 [FIXED] display number of sections taught by each instructor
-- (the original counted courses per student, but the design has no student enrolment table, so it always gave 0)
SELECT I.PersonID, COUNT(CS.CourseID) AS NumberOfSectionsTaught
FROM Instructor I
LEFT JOIN CourseSemesterSection CS ON I.PersonID = CS.PersonID
GROUP BY I.PersonID;

-- 17 Max capacity of classrooms
SELECT MAX(Capacity) AS ClassRoomMaxCapacity
FROM ClassRoom CR
INNER JOIN Room R
  ON CR.Building = R.Building AND CR.`Floor` = R.`Floor` AND CR.RoomNumber = R.RoomNumber;

-- 18 View for room bookings
CREATE OR REPLACE VIEW RoomBookings AS
SELECT R.Building, R.RoomNumber, R.Capacity, PBE.StartTime, PBE.Purpose, P.FirstName, P.LastName, PBE.`Date`
FROM Room R
JOIN PeopleBookEventsRoom PBE ON R.Building = PBE.Building AND R.`Floor` = PBE.`Floor` AND R.RoomNumber = PBE.RoomNumber
JOIN People P ON PBE.PersonID = P.PersonID;

-- 19 using the view, find when Sam is teaching a lecture and its details
SELECT *
FROM RoomBookings
WHERE FirstName = 'Sam' AND Purpose = 'Lecture';

-- 20 using the view, find the earliest booked time within the given week
SELECT MIN(StartTime) AS EarliestStart
FROM RoomBookings
WHERE `Date` BETWEEN '2024-03-16' AND '2024-03-25';
