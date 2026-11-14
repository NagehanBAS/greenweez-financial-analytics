
-- Greenweez Financial Analytics
-- Step 5: Aggregate financial performance by day.
-- Calculate revenue, costs, profitability, order volume,
-- and average order value.

CREATE OR REPLACE TABLE
  `project-c980fc5b-d2fc-410c-816.course16.gwz_finance_day` AS

SELECT
    date_date,
    COUNT(*) AS transactions,
    SUM(qty) AS products_sold,
    ROUND(SUM(turnover), 2) AS turnover,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(margin), 2) AS margin,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(ship_cost), 2) AS ship_cost,
    ROUND(SUM(log_cost), 2) AS log_cost,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    ROUND(SAFE_DIVIDE(SUM(turnover), COUNT(*)), 2) AS avg_basket
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_orders_operational`
GROUP BY date_date;

-- Display the 10 most recent days.
SELECT *
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_finance_day`
ORDER BY date_date DESC
LIMIT 10;

-- Validate the full reporting period and financial totals.
SELECT
    COUNT(*) AS total_days,
    MIN(date_date) AS first_date,
    MAX(date_date) AS last_date,
    ROUND(SUM(turnover), 2) AS total_turnover,
    ROUND(SUM(operational_margin), 2) AS total_operational_margin
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_finance_day`;
