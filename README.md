# Crowdfunding ETL Project

## Overview
This project is a collaborative effort by Nathaniel Trief and Ethan Shipman to design and implement a comprehensive data pipeline for a crowdfunding platform. It consists of two main components:
1. **Database Schema Definition:** SQL scripts to create and manage the database.
2. **ETL Pipeline:** A Jupyter Notebook to extract, transform, and load (ETL) data into the database.

## Features
- **SQL Database Schema:**
  - A relational database with tables for `Contact`, `Category`, `Subcategory`, and `Campaign`.
  - Ensures data integrity using primary and foreign keys.
  - Includes constraints like `CHECK` and `NOT NULL` for robust data validation.

- **ETL Pipeline:**
  - Extracts data from various sources.
  - Transforms data to align with the database schema.
  - Loads data into the database for further analysis.

## Database Schema
The database schema consists of the following tables:
1. **Contact:** Stores contact information.
   - Columns: `contact_id`, `first_name`, `last_name`, `email`.

2. **Category:** Defines categories for crowdfunding campaigns.
   - Columns: `category_id`, `category`.

3. **Subcategory:** Represents specific subcategories under each category.
   - Columns: `subcategory_id`, `subcategory`.

4. **Campaign:** Captures the details of crowdfunding campaigns.
   - Columns: `cf_id`, `contact_id`, `company_name`, `description`, `goal`, `pledged`, `outcome`, `backers_count`, `country`, `currency`, `launch_date`, `end_date`, `category_id`, `subcategory_id`.

## ETL Notebook
The Jupyter Notebook, `ETL_Mini_Project_EShipman_NTrief.ipynb`, implements the following steps:
1. **Extraction:**
   - Reads data from CSV files or APIs.
   - Processes raw input into a structured format.

2. **Transformation:**
   - Cleans data to ensure quality and consistency.
   - Maps data to fit the database schema.

3. **Loading:**
   - Inserts transformed data into the database.

## Usage
1. **Setting Up the Database:**
   - Run the SQL script (`crowdfunding_db_schema.sql`) to create the database and tables.

2. **Running the ETL Pipeline:**
   - Open the Jupyter Notebook and execute the cells sequentially.
   - Ensure all dependencies are installed (e.g., `pandas`, `sqlalchemy`).

## Dependencies
- **Database:**
  - PostgreSQL or any compatible relational database.
- **Python Libraries:
  - `pandas`
  - `sqlalchemy`
  - `psycopg2`

## Authors
- Ethan Shipman
- Nathaniel Trief

## License
This project is open-source under the MIT License.
