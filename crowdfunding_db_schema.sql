-- Step 1: Create the Database
DROP DATABASE IF EXISTS crowdfunding_db;
CREATE DATABASE crowdfunding_db;
\c crowdfunding_db; -- Connect to the database (for PostgreSQL)

-- Step 2: Create Tables
-- Create Contact table
CREATE TABLE Contact (
    contact_id INT PRIMARY KEY, -- Unique identifier for contacts
    name VARCHAR(255) NOT NULL, -- Name of the contact
    other_contact_info TEXT -- Other contact details
);

-- Create Category table
CREATE TABLE Category (
    category_id VARCHAR(10) PRIMARY KEY, -- Unique identifier for categories
    category VARCHAR(255) NOT NULL -- Name of the category
);

-- Create Subcategory table
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY, -- Unique identifier for subcategories
    subcategory VARCHAR(255) NOT NULL, -- Name of the subcategory
    category_id VARCHAR(10) NOT NULL, -- Foreign key referencing Category table
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create Campaign table
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

-- Step 3: Import Data from CSV Files
-- Adjust the file paths below to the actual locations of your CSV files.

-- Import data into Contact table
COPY Contact(contact_id, name, other_contact_info)
FROM '/path/to/contacts.csv'
DELIMITER ','
CSV HEADER;

-- Import data into Category table
COPY Category(category_id, category)
FROM '/path/to/category.csv'
DELIMITER ','
CSV HEADER;

-- Import data into Subcategory table
COPY Subcategory(subcategory_id, subcategory, category_id)
FROM '/path/to/subcategory.csv'
DELIMITER ','
CSV HEADER;

-- Import data into Campaign table
COPY Campaign(cf_id, contact_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launch_date, end_date, category_id, subcategory_id)
FROM '/path/to/campaign.csv'
DELIMITER ','
CSV HEADER;

-- Step 4: Display Data from Each Table
SELECT * FROM Contact;
SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Campaign;
