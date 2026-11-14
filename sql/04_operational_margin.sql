
-- Greenweez Financial Analytics
-- Step 4: Combine order-level financial data with shipping costs.
-- Calculate operational margin after logistics expenses.

CREATE OR REPLACE TABLE
  `project-c980fc5b-d2fc-410c-816.course16.gwz_orders_operational` AS

SELECT
    o.*,
    s.shipping_fee,
    s.ship_cost,
    s.log_cost,
    ROUND(
        o.margin + s.shipping_fee - (s.ship_cost + s.log_cost),
        2
    ) AS operational_margin
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_orders` AS o
LEFT JOIN `project-c980fc5b-d2fc-410c-816.course16.gwz_ship` AS s
    ON o.orders_id = s.orders_id;

-- Quality check: Identify duplicate order IDs.
-- Expected result: zero rows.

SELECT
    orders_id,
    COUNT(*) AS duplicate_count
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_orders_operational`
GROUP BY orders_id
HAVING COUNT(*) > 1;

-- Quality check: Identify missing shipping or logistics costs.
-- Expected result: zero rows.

SELECT *
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_orders_operational`
WHERE shipping_fee IS NULL
   OR ship_cost IS NULL
   OR log_cost IS NULL;
