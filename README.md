# End-to-End Data Warehouse & ETL Pipeline using SQL Server & SSIS

## Overview

This project demonstrates the implementation of a production-style Data Warehouse using SQL Server and SSIS. It follows the Bronze → Silver → Gold (Medallion) architecture to extract, transform, and load CRM and ERP data into an analytics-ready Star Schema.

## Architecture

```
CRM / ERP Sources
        │
        ▼
Bronze (Raw Data)
        │
        ▼
Silver (Cleaned & Transformed)
        │
        ▼
Gold (Star Schema)
```

## Technologies

* SQL Server
* SQL Server Integration Services (SSIS)
* SQL Server Management Studio (SSMS)
* T-SQL

## Project Structure

```
Project
│
├── Bronze
├── Silver
├── Gold
├── SSIS Packages
├── SQL Scripts
└── README.md
```

## ETL Process

* Extract data from CRM and ERP sources
* Load raw data into the Bronze layer
* Clean and validate data in the Silver layer
* Transform and load data into the Gold layer
* Build a Star Schema for reporting

## Data Warehouse

**Fact Table**

* FactSales

**Dimension Tables**

* DimCustomers
* DimProducts

## Performance Optimization

* Lookup Transformations
* Merge Join
* Clustered & Non-Clustered Indexes
* Columnstore Indexes
* Table Partitioning

## Skills Demonstrated

* Data Warehousing
* ETL Development
* SQL Server
* SSIS
* T-SQL
* Star Schema Design
* Data Quality
* Query Optimization

## Screenshots

Add screenshots of:

* Architecture
* SSIS Packages
* Data Flow
* Star Schema
* Query Results
