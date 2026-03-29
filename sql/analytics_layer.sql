DROP SCHEMA IF EXISTS analytics_layer CASCADE;
CREATE SCHEMA analytics_layer;

CREATE TABLE analytics_layer.customer_summary AS
SELECT
    region,
    COUNT(*) AS total_customers,
    AVG(purchase_amount) AS avg_spent,
    AVG(loyalty_score) AS avg_loyalty,
    AVG(purchase_frequency) AS avg_frequency
FROM cleaned_layer.customer_purchases_clean
GROUP BY region;