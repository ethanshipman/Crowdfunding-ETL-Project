--  Create the Database
DROP DATABASE IF EXISTS crowdfunding_db;
CREATE DATABASE crowdfunding_db;

--  Create Tables
-- Create Contact table
DROP TABLE IF EXISTS Contact CASCADE;
CREATE TABLE Contact (
    contact_id INT PRIMARY KEY, -- Unique identifier for contacts
    first_name VARCHAR(255) NOT NULL, -- First name of the contact
    last_name VARCHAR(255) NOT NULL, -- Last name of the contact
    email VARCHAR(255) -- Email of the contact
);

-- Create Category table
DROP TABLE IF EXISTS Category CASCADE;
CREATE TABLE Category (
    category_id VARCHAR(10) PRIMARY KEY, -- Unique identifier for categories
    category VARCHAR(255) NOT NULL -- Name of the category
);

-- Create Subcategory table
DROP TABLE IF EXISTS Subcategory CASCADE;
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY, -- Unique identifier for subcategories
    subcategory VARCHAR(255) NOT NULL -- Name of the subcategory
    -- category_id will be added later
);

-- Create Campaign table
DROP TABLE IF EXISTS Campaign;
CREATE TABLE Campaign (
    cf_id INT PRIMARY KEY, -- Unique identifier for campaigns
    contact_id INT NOT NULL, -- Foreign key referencing Contact table
    company_name VARCHAR(255) NOT NULL,
    description TEXT,
    goal DECIMAL(15, 2) NOT NULL, -- Campaign goal
    pledged DECIMAL(15, 2) DEFAULT 0.0, -- Pledged amount
    outcome VARCHAR(50) NOT NULL CHECK (outcome IN ('successful', 'failed', 'canceled', 'live')), -- Valid outcomes
    backers_count INT DEFAULT 0, -- Number of backers
    country VARCHAR(50),
    currency VARCHAR(10) NOT NULL,
    launch_date TIMESTAMP NOT NULL, -- Use TIMESTAMP for date and time
    end_date TIMESTAMP NOT NULL, -- Use TIMESTAMP for date and time
    category_id VARCHAR(10) NOT NULL, -- Foreign key referencing Category table
    subcategory_id VARCHAR(10) NOT NULL, -- Foreign key referencing Subcategory table
    FOREIGN KEY (contact_id) REFERENCES Contact(contact_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id)
);

-- Display Data from Each Table
SELECT * FROM Contact;
SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Campaign;
