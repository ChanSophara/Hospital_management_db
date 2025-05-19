DROP DATABASE IF EXISTS Hospital_Management_System;

CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

CREATE TABLE patients(
    patient_id VARCHAR(45) NOT NULL, 
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    gender VARCHAR(45) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
    address VARCHAR(45),
    PRIMARY KEY (patient_id)
);

CREATE TABLE doctors(
    doctor_id VARCHAR(45) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    gender VARCHAR(45) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
    speciality VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    password VARCHAR(45) NOT NULL,
    PRIMARY KEY (doctor_id)
);

CREATE TABLE location(
    room_number VARCHAR(45) NOT NULL,
    floor INT NOT NULL CHECK (floor >= 0),
    building_name VARCHAR(45) NOT NULL,
    PRIMARY KEY (room_number)
);

CREATE TABLE medical_histories (
    medical_id VARCHAR(50) NOT NULL,
    date_time DATETIME NOT NULL,
    surgery VARCHAR(100),
    medication VARCHAR(100),
    `condition` VARCHAR(100) NOT NULL,
    patient_id VARCHAR(45) NOT NULL,
    doctor_id VARCHAR(45) NOT NULL,
    PRIMARY KEY (medical_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE schedules (
    schedule_id INT PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    break_time VARCHAR(50),
    day VARCHAR(15) NOT NULL CHECK (day IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    availability VARCHAR(45) NOT NULL,
    time_table VARCHAR(50) NOT NULL,
    locations_room_number VARCHAR(45) NOT NULL,
    doctors_doctor_id VARCHAR(45) NOT NULL,
    FOREIGN KEY (locations_room_number) REFERENCES Location(room_number),
    FOREIGN KEY (doctors_doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE appointments (
    appointment_id VARCHAR(50) PRIMARY KEY,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    room VARCHAR(50),
    patient_id VARCHAR(45),
    doctor_id VARCHAR(45),
    schedule_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);












	
