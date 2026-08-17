# Retail Data Warehouse & Analytics Platform

## Project Overview

This project is a retail data engineering project built using Azure Databricks.

The main goal of this project is to take raw CRM and ERP data, clean and transform it, and create a business-ready data warehouse using the Medallion Architecture.

The project follows three main layers:

- Bronze – Raw data
- Silver – Cleaned and transformed data
- Gold – Business-ready data

I used PySpark mainly for schema inspection and data processing, while SQL was used for data cleaning, validation, transformation, and business analysis.

---

## Architecture

CRM / ERP CSV Files
        |
        v
   Bronze Layer
    Raw Data
        |
        v
   Silver Layer
 Cleaning & Transformation
        |
        v
    Gold Layer
   Star Schema
        |
        v
 Business Analytics
       SQL

---

## Technologies Used

- Azure Databricks
- Python
- PySpark
- SQL
- Git
- GitHub
- Medallion Architecture
- Star Schema
- Data Warehousing

---

## Project Structure

Retail-Medallion-Project/
│
├── bronze_raw_data/
│   └── Raw CRM and ERP data
│
├── source_crm/
│   └── CRM source CSV files
│
├── source_erp/
│   └── ERP source CSV files
│
├── notebooks/
│   ├── 00_Setup
│   ├── 01_Bronze_Ingestion
│   ├── 02_Silver_Customers
│   ├── 03_Silver_Products
│   ├── 04_Silver_Sales
│   ├── 05_Silver_ERP_cust
│   ├── 06_Silver_ERP_loc
│   ├── 07_Silver_ERP_px_cat
│   ├── 08_Gold_StarSchema
│   ├── 09_Business_SQL
│   ├── 10_Data_Validation
│   └── 11_SCD_Historization
│
├── sql/
│   └── SQL queries
│
├── screenshots/
│   └── Important output screenshots
│
├── doc/
│   └── Project documentation
│
└── README.md

---

# Medallion Architecture

## 1. Bronze Layer

The Bronze layer stores the raw data received from the CRM and ERP systems.

The main purpose of this layer is to keep the original source data before applying transformations.

The Bronze layer contains data such as:

- Customer information
- Product information
- Sales information
- ERP customer data
- ERP location data
- ERP product/category data

No major cleaning or transformation is performed at this stage.

Notebook:

01_Bronze_Ingestion

---

## 2. Silver Layer

The Silver layer is used for cleaning and transforming the raw data.

In this layer, I performed different data quality checks and transformations.

### Main activities

- Schema inspection
- Missing value checking
- Duplicate record detection
- Invalid value checking
- Date validation
- Data cleaning
- Data transformation
- Final data validation

I mainly used PySpark for schema inspection and data processing, and SQL for data manipulation and validation.

### Silver notebooks

- 02_Silver_Customers
- 03_Silver_Products
- 04_Silver_Sales
- 05_Silver_ERP_cust
- 06_Silver_ERP_loc
- 07_Silver_ERP_px_cat

---

## Customer Data Cleaning

Customer data was checked for missing values and duplicate customer IDs.

The following fields were checked:

- Customer ID
- Customer Key
- First Name
- Last Name
- Gender
- Creation Date

Duplicate customer records were identified using SQL before creating the cleaned customer dataset.

---

## Product Data Cleaning

Product data was checked for:

- Missing product cost
- Missing product line
- Missing product information
- Duplicate product records
- Invalid values

The cleaned product data was then used for creating the Gold product dimension.

---

## Sales Data Cleaning

Sales data required additional validation.

I checked for:

- Missing order IDs
- Missing product keys
- Missing customer IDs
- Negative sales values
- Negative prices
- Invalid order dates
- Duplicate order/product combinations

Invalid records were handled before using the data for the Gold layer.

For negative prices, the value was corrected where the sales and quantity values allowed the price to be derived.

Invalid sales records and invalid dates were removed from the cleaned analytical sales data where appropriate.

---

# Gold Layer

The Gold layer contains the final business-ready data.

The data is organized using a Star Schema.

The main Gold tables are:

- fact_sales
- dim_customer
- dim_product
- dim_date

---

# Star Schema

The Gold layer follows a Star Schema where the fact table stores transaction information and dimension tables store descriptive information.

fact_sales
    |
    |---- dim_customer
    |
    |---- dim_product
    |
    |---- dim_date

---

## Fact Sales

The fact_sales table contains transaction-level sales information.

Main columns:

- order_id
- product_sk
- customer_sk
- order_date_sk
- order_date
- quantity
- unit_price
- sales_amount

This table is used as the main source for business analysis.

---

## Product Dimension

The dim_product table contains product-related descriptive information.

Main columns:

- product_sk
- product_id
- product_key
- product_name
- product_cost
- product_line

---

## Customer Dimension

The dim_customer table contains customer-related descriptive information.

It uses a generated surrogate key (customer_sk) and is connected to the sales fact table using customer_sk.

---

## Date Dimension

The dim_date table contains date-related attributes used for analytical reporting.

It uses a generated surrogate key (date_sk) and is connected to the sales fact table using order_date_sk.

---

# SCD Type 2 Historization

SCD Type 2 historization was implemented for the customer and product dimensions.

The dimensions use:

- Surrogate keys
- Row hash
- Effective date
- End date
- Current-record indicator

A row hash is used to detect changes in dimension attributes.

When a change is detected in an existing current record:

- The existing record is closed by setting the end date.
- The existing record is marked as not current.
- A new version of the record is inserted.
- The new version receives a new surrogate key.
- The new version is marked as current.

This allows historical versions of customer and product records to be maintained.

Notebook:

11_SCD_Historization

---

# Data Validation

Data validation was performed throughout the project.

## Missing Values

NULL values were checked using SQL.

Example:

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN cst_id IS NULL THEN 1 ELSE 0 END) AS null_cst_id,
    SUM(CASE WHEN cst_key IS NULL THEN 1 ELSE 0 END) AS null_cst_key
FROM bronze_customer_info;

---

## Duplicate Records

Duplicate records were identified using GROUP BY and HAVING.

Example:

SELECT
    cst_id,
    COUNT(*) AS record_count
FROM customer_data
GROUP BY cst_id
HAVING COUNT(*) > 1;

---

## Sales Validation

The sales data was checked for negative values and invalid dates.

Invalid date values were safely handled using try_to_date().

Example:

YEAR(
    try_to_date(
        CAST(order_date AS STRING),
        'yyyyMMdd'
    )
)

---

## Gold Relationship Validation

The Gold layer was also checked to make sure fact records could be connected with the appropriate dimension records.

The main relationships checked were:

- fact_sales → dim_customer
- fact_sales → dim_product
- fact_sales → dim_date

Additional validation was performed for:

- Duplicate surrogate keys
- Orphan customer keys
- Orphan product keys
- Orphan date keys
- Current dimension records

---

# Business SQL Analysis

After creating the Gold layer, SQL was used to perform business analysis.

The main analysis includes:

- Total revenue
- Total orders
- Top-selling products
- Sales by product line
- Top customers
- Revenue by year

Notebook:

09_Business_SQL

---

## Total Revenue and Orders

SELECT
    SUM(sales_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales;

This query gives the overall sales revenue and number of unique orders.

---

## Revenue by Year

The order date was stored as an integer in the source data, so it was converted into a proper date before extracting the year.

SELECT
    YEAR(
        try_to_date(
            CAST(order_date AS STRING),
            'yyyyMMdd'
        )
    ) AS sales_year,
    SUM(sales_amount) AS total_revenue
FROM fact_sales
WHERE order_date != 0
  AND sales_amount >= 0
  AND try_to_date(
        CAST(order_date AS STRING),
        'yyyyMMdd'
      ) IS NOT NULL
GROUP BY YEAR(
    try_to_date(
        CAST(order_date AS STRING),
        'yyyyMMdd'
    )
)
ORDER BY sales_year;

The validated output contains sales for:

- 2010
- 2011
- 2012
- 2013
- 2014

---

# Screenshots

The screenshots folder contains only the important outputs from the project.

Instead of adding screenshots of every query, only important validation and business outputs are included.

The screenshots demonstrate:

- Bronze ingestion
- Silver customer validation
- Silver product validation
- Silver sales validation
- Gold table validation
- Fact sales validation
- Gold relationship validation
- Total revenue and orders
- Top products
- Sales by product line
- Top customers
- Revenue by year
- Final data validation

---

# Notebook Workflow

The notebooks are executed in the following order:

00_Setup
   |
01_Bronze_Ingestion
   |
02_Silver_Customers
   |
03_Silver_Products
   |
04_Silver_Sales
   |
05_Silver_ERP_cust
   |
06_Silver_ERP_loc
   |
07_Silver_ERP_px_cat
   |
08_Gold_StarSchema
   |
09_Business_SQL
   |
10_Data_Validation
   |
11_SCD_Historization

---

# What I Learned

Through this project, I practiced and understood:

- Medallion Architecture
- Azure Databricks
- PySpark
- SQL
- Python
- Data ingestion
- Data cleaning
- Data validation
- Missing value handling
- Duplicate detection
- Date conversion
- Invalid data handling
- Fact and dimension tables
- Star Schema
- Surrogate keys
- SCD Type 2 historization
- Data warehouse concepts
- SQL joins
- SQL aggregations
- Business analytics
- Git and GitHub

One of the main things I learned from this project was how raw data moves through different layers and gradually becomes clean and business-ready data.

I also learned how PySpark and SQL can be used together.

PySpark is useful for schema inspection and data processing, while SQL is very convenient for filtering, validation, joins, aggregation, and business analysis.

---

# How to Run the Project

1. Open the project in Azure Databricks.
2. Configure the required workspace and catalog.
3. Run 00_Setup.
4. Run 01_Bronze_Ingestion.
5. Run the Silver-layer notebooks in order.
6. Run 08_Gold_StarSchema.
7. Run 09_Business_SQL.
8. Run 10_Data_Validation.
9. Run 11_SCD_Historization.
10. Review the final tables and outputs.
11. Check the screenshots folder for important validation and business outputs.

---

# Project Objective

The objective of this project is to build a centralized and reliable retail data platform using Azure Databricks.

The project takes raw CRM and ERP data and processes it through the Bronze, Silver, and Gold layers.

The final Gold layer provides clean, structured, and business-ready data that can be used for SQL analytics and reporting.

---

## Known Limitations

The previously identified limitations related to surrogate keys and SCD historization have been addressed.

- Surrogate keys have been implemented for the Gold dimension tables.
- SCD Type 2 historization has been implemented for customer and product dimensions.

No major limitations were identified within the current project scope.

# Conclusion

This project demonstrates a complete retail data engineering workflow using Azure Databricks.

Raw CRM and ERP data is first stored in the Bronze layer. The data is then cleaned and validated in the Silver layer. Finally, the cleaned data is transformed into a Star Schema in the Gold layer.

The Gold layer can then be used for business analysis using SQL.

SCD Type 2 historization was implemented to maintain historical versions of customer and product dimension records.

This project helped me understand the complete flow of a data engineering pipeline, from raw data ingestion to data cleaning, transformation, validation, dimensional modeling, historization, and business analytics.

---

# Author

Vidhi Upadhyay

B.Tech Computer Science & Engineering

Skills: Python | SQL | PySpark | Azure Databricks | Data Engineering | Git | GitHub
