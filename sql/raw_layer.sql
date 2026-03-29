DROP SCHEMA IF EXISTS raw_layer CASCADE;
CREATE SCHEMA raw_layer;

CREATE TABLE raw_layer.customer_purchases_raw (
    user_id INT,
    age INT,
    annual_income FLOAT,
    purchase_amount FLOAT,
    loyalty_score FLOAT,
    region TEXT,
    purchase_frequency INT
);

COPY raw_layer.customer_purchases_raw
FROM '/data/Customer_purchases.csv'
DELIMITER ','
CSV HEADER;