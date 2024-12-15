# Hostel Management System DBMS Project

This project is a **Hostel Management System** built using SQL. It is designed to efficiently manage hostel-related operations such as room allocation, fee tracking, visitor records, maintenance logs, and more.

---

## Features

1. **Database Structure**:
   - Students Table: Stores information about students residing in the hostel.
   - Rooms Table: Maintains details about room types, capacity, and availability.
   - Staff Table: Records details of hostel staff and their assigned duties.
   - Fees Table: Tracks payments made by students and their due dates.
   - Maintenance Table: Logs maintenance issues and their status.
   - Visitors Table: Keeps a record of visitors for each student.

2. **Key Functionalities**:
   - Room allocation and tracking availability.
   - Recording student details and their assigned rooms.
   - Managing fee payments and tracking unpaid dues.
   - Logging and monitoring maintenance activities.
   - Maintaining visitor records for security purposes.

3. **Sample Data and Queries**:
   - Preloaded sample data for testing.
   - Example SQL queries to check room availability, track unpaid fees, and more.

---

## Table Structure

### 1. **Rooms Table**
   - `room_id`: Unique ID for each room.
   - `room_type`: Type of room (Single, Double, Triple).
   - `capacity`: Maximum capacity of the room.
   - `occupied`: Current number of occupants.
   - `status`: Availability status of the room.

### 2. **Students Table**
   - `student_id`: Unique ID for each student.
   - `name`: Full name of the student.
   - `age`: Age of the student.
   - `gender`: Gender of the student.
   - `contact_number`: Contact information (unique).
   - `address`: Residential address of the student.
   - `room_id`: Room allocated to the student (Foreign Key).

### 3. **Staff Table**
   - `staff_id`: Unique ID for staff members.
   - `name`: Full name of the staff member.
   - `position`: Designation of the staff member.
   - `contact_number`: Contact information (unique).
   - `assigned_duties`: Description of assigned duties.

### 4. **Fees Table**
   - `payment_id`: Unique ID for each payment.
   - `student_id`: Student associated with the payment (Foreign Key).
   - `amount`: Amount paid.
   - `due_date`: Deadline for payment.
   - `status`: Payment status (Paid/Unpaid).
   - `payment_date`: Date of payment.

### 5. **Maintenance Table**
   - `maintenance_id`: Unique ID for each maintenance issue.
   - `room_id`: Room associated with the issue (Foreign Key).
   - `issue_description`: Description of the maintenance issue.
   - `reported_date`: Date when the issue was reported.
   - `status`: Current status of the issue (Pending/In Progress/Resolved).

### 6. **Visitors Table**
   - `visitor_id`: Unique ID for each visitor.
   - `student_id`: Student being visited (Foreign Key).
   - `visitor_name`: Name of the visitor.
   - `visit_date`: Date of the visit.
   - `contact_number`: Contact information of the visitor.

---

## Sample SQL Queries

1. **Check Room Availability**:
   ```sql
   SELECT * FROM Rooms WHERE status = 'Available';
   ```

2. **Allocate a Room to a Student**:
   ```sql
   UPDATE Rooms
   SET occupied = occupied + 1,
       status = CASE WHEN occupied + 1 = capacity THEN 'Occupied' ELSE 'Available' END
   WHERE room_id = 2;
   ```

3. **Track Unpaid Fees**:
   ```sql
   SELECT * FROM Fees WHERE status = 'Unpaid';
   ```

4. **Log a Maintenance Issue**:
   ```sql
   INSERT INTO Maintenance (room_id, issue_description, reported_date, status)
   VALUES (1, 'Leaking faucet', '2024-12-15', 'Pending');
   ```

---

## How to Use

1. **Set Up the Database**:
   - Use the provided SQL script to create the database and tables.
   - Populate the database with the sample data provided in the script.

2. **Run Queries**:
   - Use the example queries to interact with the database and retrieve specific information.
   - Modify queries as needed to suit your requirements.

3. **Extend the System**:
   - Add more tables or columns to capture additional data.
   - Create stored procedures or triggers to automate certain tasks.

---

## Prerequisites

- MySQL Workbench or any SQL-compatible client.
- A running instance of MySQL Server.

---

## Author

This project was created as part of a **DBMS project** for hostel management. Feel free to contribute or provide suggestions to enhance the system.

---

## License

This project is open-source and free to use for educational purposes.

