# Big Data Medallion Architecture

## Project Overview:

This project is implementing the ELT processes using the medallion architecture pipeline in PostgreSQL.
The dataset is representing customer purchasing behaviour and is processed through the bronze, silver and gold layers.

## Problem Statement:

The goal of this projest is to analyze customer's purchasing behaviour across different regions using medallion architecture. The analysis is focused on identifying patterns in spending the money, loyalty scores and how often customers are shopping.

## Architecture:

This project is based on the medallion architecture:
- Bronze Layer (raw_layer)
    Raw data ingested directly from the CSV file without any modifications.
- Silver Layer (cleaned_layer)
    Filtered and cleaned data with basic validation 
- Gold Layer (analytics_layer)
    Aggregated data used for visualization

## Data Flow:

Customer_purchases.csv -> raw_layer -> cleaned_layer -> analytics_layer

## Data Processing Steps:
- ### Raw Layer
  - Loading raw data from CSV to the PostgreSQL
- ### Cleaned Layer
  - Filtering rows where 'user_id' is NULL and where 'purchase_ammount' <= 0
  - Removing invalid records
- ### Analytics Layer
  - Aggregating data by region
  - Calculating total number of customers and average spending/loyality score/purchase frequency

## Data Quality Risks:
- ### Duplicate records
  The datasets may contain duplicate primary entities, leading to biased aggregation results.
- ### Biased with smaller datasets
  With around 250 rows, the dataset may not be representative, leading to unreliable insight.
- ### Logical inconsistencies
  Unrealistic values such as very high purchase frequency with low income may indicate data errors.

### The project has the additional 'visualization.py' class with graphs of the Gold layer results.

