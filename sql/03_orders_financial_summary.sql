
-- Greenweez Financial Analytics
-- Step 3: Aggregate sales margins at the order level.
-- Each order_id should appear only once.

CREATE OR REPLACE TABLE
  `project-c980fc5b-d2fc-410c-816.course16.gwz_orders` AS

SELECT
    orders_id,
    MIN(date_date) AS date_date,
    SUM(qty) AS qty,
    ROUND(SUM(turnover), 2) AS turnover,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(margin), 2) AS margin
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_sales_margin`
GROUP BY orders_id;

-- Quality check: Detect duplicate order IDs.
-- Expected result: zero rows.

SELECT
    orders_id,
    COUNT(*) AS duplicate_count
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_orders`
GROUP BY orders_id
HAVING COUNT(*) > 1;
