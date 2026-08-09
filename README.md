# Data Engineering Internship

## Overview

This repository contains the weekly assignments, practical implementations, and projects completed during my **Data Engineering Internship at Celebal Technologies**.

During the internship, I worked with **SQL, Python, ETL, Azure, Apache Spark, PySpark, Delta Lake, Databricks, and data pipelines**.

The **Retail Data Warehouse & Analytics Platform using Medallion Architecture** is the main project of my internship, where I applied the concepts learned throughout the internship to build an end-to-end data engineering solution.

---

## Weekly Work

### Week 1 – Shopping Analysis
- Data cleaning and preprocessing
- Exploratory Data Analysis (EDA)
- Data visualization
- Jupyter Notebook implementation

### Week 2 – E-Commerce Sales SQL
- Database creation and data insertion
- SQL basics and filtering
- Aggregations
- JOINs
- Advanced SQL concepts

### Week 3 – Customer Sales Insights
- Customer, Order, and Product tables
- Subqueries
- CTEs
- Window Functions
- JOINs
- Customer sales analysis

### Week 4 – Azure Data Pipeline
- Azure Resource Group
- Azure Storage Account and Blob Storage
- Azure Data Factory
- Linked Services and Datasets
- Get Metadata and Copy Data activities
- End-to-end ETL pipeline

### Week 5 – Apache Spark Data Processing
- Spark DataFrames
- Data cleaning
- Null and duplicate handling
- Filtering
- Grouping and aggregation
- Data type casting
- Wide transformations and shuffle

### Week 6 – Spark Architecture & PySpark
- Spark Architecture
- Driver, Cluster Manager, and Executor
- Lazy Evaluation and DAG
- Fault Tolerance
- CSV and Parquet processing
- Predicate Pushdown
- PySpark transformations and actions

### Week 7 – Delta Lake
- Delta table creation
- Data cleaning and validation
- Incremental data processing
- Delta Lake MERGE
- Update and Insert operations
- Duplicate and row-count validation
- ACID transactions

### Week 8 – E-Commerce Order Analytics
- Synthetic data generation using Python and Faker
- Data cleaning using Pandas
- SQL analytics
- Revenue and customer analysis
- Window Functions and CTEs
- Cohort and retention analysis
- Customer segmentation and RFM
- Python CLI reporting
- Edge-case testing

---

# Main Project – Retail Data Warehouse & Analytics Platform

The **Retail Data Warehouse & Analytics Platform** is the main project of my internship.

The project processes raw **CRM and ERP data** using **Azure Databricks** and follows the **Medallion Architecture**.

```text
CRM / ERP Data
      ↓
Bronze Layer
   Raw Data
      ↓
Silver Layer
Clean & Transform
      ↓
Gold Layer
  Star Schema
      ↓
Business Analytics
      SQL
