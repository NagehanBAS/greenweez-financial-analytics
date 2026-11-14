
-- Greenweez Financial Analytics
-- Step 1: Calculate purchase costs and gross margins
-- using a LEFT JOIN between sales and products.

CREATE OR REPLACE TABLE
  `project-c980fc5b-d2fc-410c-816.course16.gwz_sales_margin` AS

SELECT
    s.*,
    p.purchase_price,
    ROUND(s.qty * p.purchase_price, 2) AS purchase_cost,
    ROUND(s.turnover - (s.qty * p.purchase_price), 2) AS margin
FROM `project-c980fc5b-d2fc-410c-816.course16.gwz_sales` AS s
LEFT JOIN `project-c980fc5b-d2fc-410c-816.course16.gwz_product` AS p
    ON s.products_id = p.products_id;
