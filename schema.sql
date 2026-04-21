-- ============================================================
-- Employee Login Portal - MySQL Database Schema
-- Run this file in phpMyAdmin (XAMPP) SQL tab
-- ============================================================

-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS employee_portal;
USE employee_portal;

-- Step 2: Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS users;

-- ============================================================
-- TABLE: users
-- Stores login credentials for all users (employees + managers)
-- ============================================================
CREATE TABLE users (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100)  NOT NULL,
    email       VARCHAR(150)  NOT NULL UNIQUE,
    password    VARCHAR(255)  NOT NULL,          -- bcrypt hashed
    role        ENUM('employee','manager') NOT NULL DEFAULT 'employee',
    created_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE: employees
-- Stores professional profile data for each employee user
-- Linked 1-to-1 with the users table via user_id
-- ============================================================
CREATE TABLE employees (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT          NOT NULL UNIQUE,
    department      VARCHAR(100) DEFAULT NULL,
    job_title       VARCHAR(100) DEFAULT NULL,
    experience      DECIMAL(4,1) DEFAULT NULL,   -- years, e.g. 3.5
    salary          DECIMAL(12,2) DEFAULT NULL,  -- monthly, INR
    phone           VARCHAR(20)  DEFAULT NULL,
    address         TEXT         DEFAULT NULL,
    date_of_joining DATE         DEFAULT NULL,
    skills          TEXT         DEFAULT NULL,   -- comma-separated
    profile_updated TINYINT(1)   DEFAULT 0,      -- 0 = not filled yet
    created_at      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ============================================================
-- INDEX: speed up common queries
-- ============================================================
CREATE INDEX idx_users_email  ON users(email);
CREATE INDEX idx_emp_dept     ON employees(department);
CREATE INDEX idx_emp_user_id  ON employees(user_id);

-- ============================================================
-- SAMPLE DATA
-- Passwords are bcrypt hashes of the plaintext shown in comments
-- All sample passwords = "Password@123"
-- ============================================================

INSERT INTO users (name, email, password, role) VALUES
-- Managers
('Admin Manager',   'manager@portal.com',  '$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'manager'),
('Sarah Johnson',   'sarah@portal.com',    '$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'manager'),
-- Employees
('Arjun Mehta',     'arjun@portal.com',    '$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'employee'),
('Priya Sharma',    'priya@portal.com',    '$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'employee'),
('Rohan Das',       'rohan@portal.com',    '$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'employee'),
('Kavya Nair',      'kavya@portal.com',    '$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'employee'),
('Siddharth Rao',   'siddharth@portal.com','$2b$10$KIXv1dPEQzMfq0W3r4Tz8.9b5yWm.3jGj0YLqkY/VF6mTjpMDCwHC', 'employee');

-- Employee profile data (linked to user IDs 3-7 above)
INSERT INTO employees (user_id, department, job_title, experience, salary, phone, date_of_joining, skills, profile_updated) VALUES
(3, 'Engineering',  'Backend Developer',    3.5, 75000.00, '9876543210', '2021-06-01', 'Node.js, MySQL, Express, REST APIs', 1),
(4, 'Design',       'UI/UX Designer',       2.0, 60000.00, '9876543211', '2022-03-15', 'Figma, Adobe XD, HTML, CSS',         1),
(5, 'Engineering',  'Frontend Developer',   1.5, 55000.00, '9876543212', '2023-01-10', 'React, JavaScript, Bootstrap',       1),
(6, 'HR',           'HR Executive',         4.0, 65000.00, '9876543213', '2020-09-01', 'Recruitment, Payroll, Compliance',   1),
(7, 'Engineering',  'DevOps Engineer',      5.0, 90000.00, '9876543214', '2019-11-20', 'AWS, Docker, CI/CD, Linux',          1);

-- ============================================================
-- USEFUL QUERIES FOR REFERENCE
-- ============================================================

-- View all users with their employee details:
-- SELECT u.id, u.name, u.email, u.role, e.department, e.job_title, e.salary
-- FROM users u LEFT JOIN employees e ON u.id = e.user_id;

-- Count employees per department:
-- SELECT department, COUNT(*) as total FROM employees GROUP BY department;
