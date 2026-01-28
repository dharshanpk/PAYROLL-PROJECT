
Payroll SaaS Database Schema

CREATE DATABASE IF NOT EXISTS payroll_db;
USE payroll_db;

1. Departments Table

CREATE TABLE IF NOT EXISTS departments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);


2. Employees Table

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('HR','EMPLOYEE') NOT NULL,
    department_id INT,
    base_salary DECIMAL(10,2) NOT NULL,
    join_date DATE,
    status ENUM('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',

    CONSTRAINT fk_emp_departmrnt
       FOREIGN KEY(department_id)
       REFERENCES departments(id)
       ON DELETE SET NULL
);

3. Clients Table 

CREATE TABLE IF NOT EXISTS clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    contact_number VARCHAR(150)
);

4. Attendance Table

CREATE TABLE IF NOT EXISTS attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('PRESENT','ABSENT','LEAVE') NOT NULL,

    CONSTRAINT fk_att_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id)
        ON DELETE CASCADE
);

5. Payroll Table

CREATE TABLE IF NOT EXISTS payroll (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    month VARCHAR(20) NOT NULL,
    gross_salary DECIMAL(10,2) NOT NULL,
    deductions DECIMAL(10,2) DEFAULT 0,
    net_salary DECIMAL(10,2) NOT NULL,
    generated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pay_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id)
        ON DELETE CASCADE
);