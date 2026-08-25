# SQL Database Projects

A collection of beginner-friendly **MySQL projects** created to practice database design, table creation, data insertion, relationships, and SQL queries.

##  Projects

### 1. Student & Marks Management

Includes:

* Student details and marks
* Student marksheets
* Total marks and percentage calculation
* Automatic grade calculation
* Pass/Fail status

### 2.  College Database Management

Includes:

* Departments
* Students
* Courses
* Enrollments
* Faculty
* Primary and Foreign Key relationships

### 3. Hospital Database Management

Includes:

* Departments
* Patients
* Doctors
* Appointments
* Rooms
* Relationships between patients, doctors, departments, and appointments

##  SQL Concepts Used

* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `UNIQUE`
* `NOT NULL`
* `CHECK`
* `CASE`
* `ROUND()`
* `ORDER BY`
* Table relationships

##  Technologies

* **MySQL**
* **SQL**
* **MySQL Workbench**

##  How to Run

1. Open MySQL Workbench.
2. Create/select a database.
3. Run the SQL scripts in the required order.
4. Use `SELECT` queries to view the stored data and results.

##  Purpose

This repository is created for **learning and practicing SQL and relational database concepts**.

##  Author

**shafin khan**

##NORMALISATION FOR HOSPITAL MANAGEMENT

## Database Normalization

The database is normalized up to **3NF**.

* **1NF:** All data is atomic, with no repeating or multi-valued fields.
  
* 2NF:** There are no partial dependencies, especially in the `appointment` table with its composite key.
  
* 3NF:** There are no unnecessary transitive dependencies. Department details are stored separately and linked using `dept_id`.

**Overall:** The database follows **1NF, 2NF, and 3NF**, which is sufficient for this hospital management system.

-- ==========================================
-- NORMALIZATION OF HOSPITAL DATABASE
-- NORMAL FORM: 1NF -> 2NF -> 3NF
-- ==========================================


-- ==========================================
-- CREATE DATABASE
-- ==========================================

CREATE DATABASE hospital_demo;
USE hospital_demo;


-- ==========================================
-- 1NF
-- ==========================================
-- In First Normal Form:
-- 1. All attributes contain atomic values.
-- 2. There are no repeating groups.
-- 3. Each record is uniquely identifiable.
--
-- Patient, Doctor, Department, Appointment
-- and Room information are stored separately.


-- ==========================================
-- 2NF
-- ==========================================
-- In Second Normal Form:
-- 1. Database must be in 1NF.
-- 2. There should be no partial dependency.
--
-- Patient, Doctor, Department, Appointment
-- and Room data are separated into tables.


-- ==========================================
-- DEPARTMENT TABLE
-- ==========================================

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);


-- ==========================================
-- PATIENT TABLE
-- ==========================================

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    age INT,
    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);


-- ==========================================
-- DOCTOR TABLE
-- ==========================================

CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);


-- ==========================================
-- APPOINTMENT TABLE
-- ==========================================
-- Composite primary key:
-- patient_id + doctor_id + appointment_date
--
-- This allows a patient to have multiple
-- appointments with a doctor on different dates.

CREATE TABLE appointment (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),

    PRIMARY KEY (
        patient_id,
        doctor_id,
        appointment_date
    ),

    FOREIGN KEY (patient_id)
    REFERENCES patient(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctor(doctor_id)
);


-- ==========================================
-- ROOM TABLE
-- ==========================================

CREATE TABLE room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30) NOT NULL,
    room_no INT UNIQUE,
    patient_id INT,

    FOREIGN KEY (patient_id)
    REFERENCES patient(patient_id)
);


-- ==========================================
-- INSERT DEPARTMENT DATA
-- ==========================================

INSERT INTO department
(dept_id, dept_name)
VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics');


-- ==========================================
-- INSERT PATIENT DATA
-- ==========================================

INSERT INTO patient
(patient_id, patient_name, email, phone_no, age, dept_id)
VALUES
(101, 'Rahul Sharma', 'rahul@example.com',
 '9876543210', 45, 1),

(102, 'Priya Mehta', 'priya@example.com',
 '9876543211', 32, 2),

(103, 'Amit Rao', 'amit@example.com',
 '9876543212', 55, 3);


-- ==========================================
-- INSERT DOCTOR DATA
-- ==========================================

INSERT INTO doctor
(doctor_id, doctor_name, email, phone_no, dept_id)
VALUES
(201, 'Dr. Anil Kapoor', 'anil@gmail.com',
 '9876500010', 1),

(202, 'Dr. Neha Singh', 'neha@gmail.com',
 '9876500011', 2),

(203, 'Dr. Raj Verma', 'raj@gmail.com',
 '9876500012', 3);


-- ==========================================
-- INSERT APPOINTMENT DATA
-- ==========================================

INSERT INTO appointment
(patient_id, doctor_id, appointment_date,
 appointment_time, status)
VALUES
(101, 201, '2026-08-20', '10:00:00', 'Confirmed'),

(102, 202, '2026-08-21', '11:30:00', 'Confirmed'),

(103, 203, '2026-08-22', '12:00:00', 'Pending'),

(101, 201, '2026-08-25', '09:30:00', 'Confirmed');


-- ==========================================
-- INSERT ROOM DATA
-- ==========================================

INSERT INTO room
(room_id, room_type, room_no, patient_id)
VALUES
(301, 'General', 101, 101),

(302, 'Private', 102, 102),

(303, 'ICU', 103, 103);


-- ==========================================
-- DISPLAY TABLES
-- ==========================================

SHOW TABLES;


-- ==========================================
-- DESCRIBE TABLES
-- ==========================================

DESC department;
DESC patient;
DESC doctor;
DESC appointment;
DESC room;


-- ==========================================
-- DISPLAY DATA
-- ==========================================

SELECT * FROM department;
SELECT * FROM patient;
SELECT * FROM doctor;
SELECT * FROM appointment;
SELECT * FROM room;

##NORMALISATION FOR COLLEGE DATA BASE

1NF (First Normal Form):
Rule: Eliminate duplicate columns from the same table. Create separate tables for related data and identify each row with a unique primary key.
Key Requirement: Ensure all columns contain atomic (indivisible) values, and each cell holds a single value (no repeating groups or arrays).
2NF (Second Normal Form):
Rule: Meet all the requirements of 1NF.
Key Requirement: Remove subsets of data that apply to multiple rows of a table and place them in separate tables. Create relationships between these tables using foreign keys. All non-key attributes must be fully functional dependent on the primary key.
3NF (Third Normal Form):
Rule: Meet all the requirements of 2NF.
Key Requirement: Remove columns that are not dependent on the primary key. There must be no transitive dependency (non-key attributes should not depend on other non-key attributes).


-- ==========================================
-- NORMALIZATION OF COLLEGE DATABASE
-- NORMAL FORM: 1NF -> 2NF -> 3NF
-- ==========================================

-- Create Database
CREATE DATABASE college_demo;

-- Use Database
USE college_demo;


-- ==========================================
-- 1NF
-- ==========================================
-- In 1NF:
-- 1. Each column contains atomic values.
-- 2. There are no repeating groups.
-- 3. Each row is uniquely identifiable.

-- Example:
-- Student information is stored with one value
-- in each column.


-- ==========================================
-- 2NF
-- ==========================================
-- In 2NF:
-- 1. Database must be in 1NF.
-- 2. There should be no partial dependency.
--
-- Student, Course and Department information
-- are separated into different tables.


-- ==========================================
-- DEPARTMENT TABLE
-- ==========================================

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);


-- ==========================================
-- STUDENT TABLE
-- ==========================================

CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    aadhar_no VARCHAR(12) UNIQUE,
    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);


-- ==========================================
-- COURSE TABLE
-- ==========================================

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);


-- ==========================================
-- ENROLLMENT TABLE
-- ==========================================
-- Composite primary key is used because
-- a student can enroll in multiple courses
-- and can have different semesters.

CREATE TABLE enrollment (
    roll_no INT,
    course_id INT,
    semester INT CHECK (semester BETWEEN 1 AND 8),
    grade CHAR(2),

    PRIMARY KEY (roll_no, course_id, semester),

    FOREIGN KEY (roll_no)
    REFERENCES student(roll_no),

    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
);


-- ==========================================
-- FACULTY TABLE
-- ==========================================

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);


-- ==========================================
-- INSERT DEPARTMENT DATA
-- ==========================================

INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electronics');


-- ==========================================
-- INSERT STUDENT DATA
-- ==========================================

INSERT INTO student
(roll_no, name, email, aadhar_no, dept_id)
VALUES
(101, 'Laksh Kapse', 'laksh@example.com',
 '123456789012', 1),

(102, 'Varun Gharote', 'varuniversel@example.com',
 '234567890123', 2),

(103, 'Deep Kuswha', 'deep@example.com',
 '345678901234', 1);


-- ==========================================
-- INSERT COURSE DATA
-- ==========================================

INSERT INTO course
(course_id, course_name, dept_id)
VALUES
(201, 'Database Systems', 1),
(202, 'Thermodynamics', 2),
(203, 'Digital Circuits', 3);


-- ==========================================
-- INSERT ENROLLMENT DATA
-- ==========================================

INSERT INTO enrollment
(roll_no, course_id, semester, grade)
VALUES
(101, 201, 3, 'A'),
(101, 203, 4, 'B'),
(102, 202, 3, 'A'),
(103, 201, 3, 'B');


-- ==========================================
-- INSERT FACULTY DATA
-- ==========================================

INSERT INTO faculty
(faculty_id, faculty_name, email, phone_no, dept_id)
VALUES
(201, 'Dr. Sharma', 'sharma@gmail.com',
 '9876543210', 1),

(202, 'Prof. Mehta', 'mehta@gmail.com',
 '9876543211', 2),

(203, 'Dr. Rao', 'rao@gmail.com',
 '9876543212', 3);


-- ==========================================
-- DISPLAY TABLES
-- ==========================================

SHOW TABLES;


-- ==========================================
-- DESCRIBE TABLES
-- ==========================================

DESC department;
DESC student;
DESC course;
DESC enrollment;
DESC faculty;


-- ==========================================
-- DISPLAY DATA
-- ==========================================

SELECT * FROM department;

SELECT * FROM student;

SELECT * FROM course;

SELECT * FROM enrollment;

SELECT * FROM faculty;

