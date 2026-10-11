# Campus Class Reservation Database

ClassBooker: a relational database for campus room scheduling, equipment and reservations.
College team project, built by **Gurleen Kaur** and **Diego Delgado**(Langara College).

## What it covers
- Rooms identified by building, floor and room number, with room types (classroom, lab, office), capacity and equipment
- Course schedules and time slots, by semester and section
- People (instructors, students, administrative staff) who can book rooms for an event, with a start time, duration and purpose

## Design
- EER model mapped to **18 normalized tables** (checked for 1NF, 2NF and 3NF)
- Primary and foreign keys with cascading deletes
- 20 SQL queries: joins, aggregates (GROUP BY / HAVING), subqueries, UPDATE and DELETE, and a view

## Contribution

This collaborative team project was completed as part of the Computer Studies program at Langara College. The EER diagram, relational schema and normalization were designed jointly in weekly working sessions. Tables were then divided between the two team members, with each member writing the SQL for the assigned share. Each session closed with a peer review, where the other member's work was critiqued and revised.

## How to run (MySQL or MariaDB)
1. Create a database, for example: `CREATE DATABASE classbooker; USE classbooker;`
2. Run `scripts/Create.sql`, then `scripts/Insert.sql`, then `scripts/Query.sql`

All names in the sample data are made up.

## Files
- `Project_Report.pdf`: project report (description, EER diagram, schema, normalization)
- `scripts/`: `Create.sql`, `Insert.sql`, `Query.sql`

