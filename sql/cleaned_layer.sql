DROP SCHEMA IF EXISTS cleaned_layer CASCADE;
CREATE SCHEMA cleaned_layer;

CREATE TABLE cleaned_layer.customer_purchases_clean AS
SELECT
    user_id,
    age,
    annual_income,
    purchase_amount,
    loyalty_score,
    region,
    purchase_frequency
FROM raw_layer.customer_purchases_raw
WHERE
    user_id IS NOT NULL
    AND purchase_amount > 0;