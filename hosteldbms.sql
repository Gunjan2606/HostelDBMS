-- Sample SQL Script for Hostel Management DBMS

-- 1. Creating the database
CREATE DATABASE HostelManagement;
USE HostelManagement;

-- 2. Rooms Table 
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type ENUM('Single', 'Double', 'Triple') NOT NULL,
    capacity INT NOT NULL,
    occupied INT DEFAULT 0,
    status ENUM('Available', 'Occupied') DEFAULT 'Available'
);

-- 3. Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    contact_number VARCHAR(15) UNIQUE,
    address TEXT,
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) ON DELETE SET NULL
);

-- 4. Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    contact_number VARCHAR(15) UNIQUE,
    assigned_duties TEXT
);

-- 5. Fees Table
CREATE TABLE Fees (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

-- 6. Maintenance Table
CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    issue_description TEXT NOT NULL,
    reported_date DATE NOT NULL,
    status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending',
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) ON DELETE CASCADE
);

-- 7. Visitors Table
CREATE TABLE Visitors (
    visitor_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    visitor_name VARCHAR(100) NOT NULL,
    visit_date DATE NOT NULL,
    contact_number VARCHAR(15),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

-- Sample Data Insertion
INSERT INTO Rooms (room_type, capacity) VALUES
('Single', 1),
('Double', 2),
('Triple', 3);

INSERT INTO Students (name, age, gender, contact_number, address, room_id) VALUES
('John Doe', 20, 'Male', '1234567890', '123 Elm Street', 1),
('Jane Smith', 22, 'Female', '0987654321', '456 Oak Avenue', 2);

INSERT INTO Fees (student_id, amount, due_date, status) VALUES
(1, 5000.00, '2024-12-31', 'Unpaid'),
(2, 4500.00, '2024-12-31', 'Paid');

INSERT INTO Staff (name, position, contact_number, assigned_duties) VALUES
('Alice Johnson', 'Warden', '1122334455', 'Overall management'),
('Bob Williams', 'Cleaner', '2233445566', 'Room cleaning');

INSERT INTO Maintenance (room_id, issue_description, reported_date, status) VALUES
(1, 'Leaking faucet', '2024-12-15', 'Pending'),
(2, 'Broken window', '2024-12-14', 'In Progress');

INSERT INTO Visitors (student_id, visitor_name, visit_date, contact_number) VALUES
(1, 'Michael Doe', '2024-12-16', '3344556677'),
(2, 'Emily Smith', '2024-12-16', '4455667788');

-- Example Queries
-- Check room availability
SELECT * FROM Rooms WHERE status = 'Available';

-- Allocate a room to a student
UPDATE Rooms
SET occupied = occupied + 1, 
    status = CASE WHEN occupied + 1 = capacity THEN 'Occupied' ELSE 'Available' END
WHERE room_id = 2;

-- Track unpaid fees
SELECT * FROM Fees WHERE status = 'Unpaid';
