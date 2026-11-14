
-- Greenweez Financial Analytics
-- Step 2: Validate sales margin data quality.
-- Both checks should return zero rows when successful.

-- Check 1: Detect duplicate order-product combinations.
SELECT
    orders_id,
    products_id,
    COUNT(*) AS duplicate_count
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_sales_margin`
GROUP BY orders_id, products_id
HAVING COUNT(*) > 1;

-- Check 2: Identify missing purchase prices.
SELECT *
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_sales_margin`
WHERE purchase_price IS NULL;
