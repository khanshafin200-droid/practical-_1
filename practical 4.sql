CREATE DATABASE hospital_demo;
USE hospital_demo;

-- Create Department table
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create Patient table
CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Create Doctor table
CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Create Appointment table
CREATE TABLE appointment (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    PRIMARY KEY (patient_id, doctor_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

-- Create Room table
CREATE TABLE room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30) NOT NULL,
    room_no INT UNIQUE,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- Check tables
SHOW TABLES;

DESC department;
DESC patient;
DESC doctor;
DESC appointment;
DESC room;

-- Insert Departments
INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics');

SELECT * FROM department;

-- Insert Patients
INSERT INTO patient 
(patient_id, patient_name, email, phone_no, age, dept_id) VALUES
(101, 'Rahul Sharma', 'rahul@example.com', '9876543210', 45, 1),
(102, 'Priya Mehta', 'priya@example.com', '9876543211', 32, 2),
(103, 'Amit Rao', 'amit@example.com', '9876543212', 55, 3);

SELECT * FROM patient;

-- Insert Doctors
INSERT INTO doctor 
(doctor_id, doctor_name, email, phone_no, dept_id) VALUES
(201, 'Dr. Anil Kapoor', 'anil@gmail.com', '9876500010', 1),
(202, 'Dr. Neha Singh', 'neha@gmail.com', '9876500011', 2),
(203, 'Dr. Raj Verma', 'raj@gmail.com', '9876500012', 3);

SELECT * FROM doctor;

-- Insert Appointments
INSERT INTO appointment
(patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(101, 201, '2026-08-20', '10:00:00', 'Confirmed'),
(102, 202, '2026-08-21', '11:30:00', 'Confirmed'),
(103, 203, '2026-08-22', '12:00:00', 'Pending'),
(101, 201, '2026-08-25', '09:30:00', 'Confirmed');

SELECT * FROM appointment;

-- Insert Rooms
INSERT INTO room
(room_id, room_type, room_no, patient_id) VALUES
(301, 'General', 101, 101),
(302, 'Private', 102, 102),
(303, 'ICU', 103, 103);

SELECT * FROM room;