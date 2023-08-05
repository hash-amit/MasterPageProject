-- Create the database DD_MPP if it doesn't exist
CREATE DATABASE IF NOT EXISTS DD_MPP;

-- Use the DD_MPP database
USE DD_MPP;

-- Create TBL_USER_DESIGNATION table
CREATE TABLE TBL_USER_DESIGNATION (
    DID INT PRIMARY KEY NOT NULL,
    DESIGNATION VARCHAR(50) NOT NULL
);

-- Insert 10 records into TBL_USER_DESIGNATION table
INSERT INTO TBL_USER_DESIGNATION (DID, DESIGNATION)
VALUES
    (1, 'Software Engineer'),
    (2, 'Senior Software Engineer'),
    (3, 'Software Developer'),
    (4, 'Quality Assurance Engineer'),
    (5, 'Project Manager'),
    (6, 'Business Analyst'),
    (7, 'UI/UX Designer'),
    (8, 'Database Administrator'),
    (9, 'System Administrator'),
    (10, 'Data Scientist');

-- Create TBL_USER_GENDER table
CREATE TABLE TBL_USER_GENDER (
    GID INT PRIMARY KEY NOT NULL,
    GENDER VARCHAR(10) NOT NULL
);

-- Insert 3 records into TBL_USER_GENDER table
INSERT INTO TBL_USER_GENDER (GID, GENDER)
VALUES
    (1, 'Male'),
    (2, 'Female'),
    (3, 'Other');

-- Create TBL_USER_REGISTRATION table
CREATE TABLE TBL_USER_REGISTRATION (
    UID INT PRIMARY KEY NOT NULL,
    USER_FIRST_NAME VARCHAR(50) NOT NULL,
    USER_LAST_NAME VARCHAR(50) NOT NULL,
    USER_EMAIL VARCHAR(50) NOT NULL,
    USER_GENDER INT NOT NULL,
    USER_DESIGNATION INT NOT NULL,
    USER_PASSWORD VARCHAR(50) NOT NULL,
    FOREIGN KEY (USER_GENDER) REFERENCES TBL_USER_GENDER (GID),
    FOREIGN KEY (USER_DESIGNATION) REFERENCES TBL_USER_DESIGNATION (DID)
);

-- Sample data for TBL_USER_REGISTRATION (You can replace these with actual data)
INSERT INTO TBL_USER_REGISTRATION (UID, USER_FIRST_NAME, USER_LAST_NAME, USER_EMAIL, USER_GENDER, USER_DESIGNATION, USER_PASSWORD)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 1, 1, 'password123'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 2, 2, 'securepass'),
    (3, 'Mike', 'Johnson', 'mike.johnson@example.com', 1, 3, 'mysecretpass'),
    -- Add 7 more records here
    (4, 'Sarah', 'Williams', 'sarah.williams@example.com', 2, 4, 'password456'),
    (5, 'David', 'Lee', 'david.lee@example.com', 1, 5, 'mypassword'),
    (6, 'Emily', 'Brown', 'emily.brown@example.com', 2, 6, 'secure123'),
    -- Add 4 more records here
    (7, 'Alex', 'Martin', 'alex.martin@example.com', 1, 7, 'password789'),
    (8, 'Emma', 'Johnson', 'emma.johnson@example.com', 2, 8, 'pass123'),
    (9, 'Daniel', 'Davis', 'daniel.davis@example.com', 1, 9, 'mypassword456'),
    (10, 'Olivia', 'Smith', 'olivia.smith@example.com', 2, 10, 'securepass123');
