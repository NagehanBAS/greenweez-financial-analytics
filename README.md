
# Greenweez | Financial & Operational Analytics

### End-to-End SQL Financial Analysis with Google BigQuery

A SQL-based financial analytics project examining e-commerce sales, product acquisition costs, shipping expenses, and operational profitability.

The project transforms transaction-level data into order-level financial metrics and daily management reporting using Google BigQuery.

## Project Overview

Revenue alone is not enough to evaluate commercial performance. Understanding profitability also requires visibility into product acquisition costs, fulfillment expenses, and the financial contribution of individual orders.

This project develops a structured analytical workflow to answer key business questions:

- How much revenue does the business generate?
- What are the associated product purchasing costs?
- How profitable are sales before logistics expenses?
- How do shipping and logistics costs affect operational profitability?
- How do revenue, transaction volume, and profitability change over time?
- What is the average order value?

## Technology Stack

- **Google BigQuery** — Cloud-based data warehouse
- **GoogleSQL** — Data transformation and financial analysis
- **LEFT JOIN and RIGHT JOIN** — Relational data integration and comparison
- **SQL aggregations** — Order-level and daily reporting
- **Data quality validation** — Duplicate detection and NULL checks
- **GitHub** — SQL version control and project documentation

## Dataset

The analysis uses three source tables from the Greenweez educational dataset.

| Source Table | Description | Key Fields |
|---|---|---|
| `gwz_sales` | Transaction-level sales data | `date_date`, `orders_id`, `products_id`, `turnover`, `qty` |
| `gwz_product` | Product purchasing information | `products_id`, `purchase_price` |
| `gwz_ship` | Order-level shipping and logistics costs | `orders_id`, `shipping_fee`, `ship_cost`, `log_cost` |

**Analysis period:** April 1, 2021 – September 30, 2021

**Reporting coverage:** 183 calendar days

The source dataset is not distributed in this repository. Reproducing the analysis requires access to the relevant BigQuery source tables.

## Data Transformation Workflow

The analytical pipeline consists of five main stages.

### 1. Sales Margin Analysis

Transaction-level sales records are joined with product purchase prices using `products_id`.

A LEFT JOIN preserves sales records while adding the corresponding product acquisition costs.

**Financial calculations:**

- Purchase Cost = Quantity × Purchase Price
- Gross Margin = Turnover − Purchase Cost

**Output:** `gwz_sales_margin`

### 2. Sales Data Quality Validation

Two validation checks are performed:

- Duplicate detection using the combination of `orders_id` and `products_id`
- Identification of missing `purchase_price` values

Both tests returned zero invalid records in the completed analysis.

### 3. Order-Level Financial Aggregation

Sales transactions are aggregated by `orders_id` to calculate:

- Total products sold
- Order turnover
- Total purchase cost
- Gross margin

This transformation produces one record per order, supporting subsequent shipping cost integration.

**Output:** `gwz_orders`

### 4. Operational Profitability Analysis

Order-level financial records are joined with shipping and logistics data using `orders_id`.

**Operational Margin = Gross Margin + Shipping Fee − Shipping Cost − Logistics Cost**

The resulting table combines financial and operational information at the order level.

Additional data quality checks validate order uniqueness and the completeness of shipping-related cost fields.

**Output:** `gwz_orders_operational`

### 5. Daily Financial Reporting

Order-level financial and operational data is aggregated by date.

The resulting daily reporting table includes:

- Transaction count
- Products sold
- Turnover
- Purchase cost
- Gross margin
- Shipping fees
- Shipping costs
- Logistics costs
- Operational margin
- Average order value

**Average Order Value = Total Turnover / Number of Orders**

**Output:** `gwz_finance_day`

## Financial Performance Results

The final reporting dataset covers 183 days from April 1 through September 30, 2021.

| KPI | Result |
|---|---:|
| Reporting Days | 183 |
| Total Turnover | 12,558,933.09 |
| Total Operational Margin | 2,927,221.48 |
| Operational Margin Rate | 23.31% |
| First Reporting Date | 2021-04-01 |
| Last Reporting Date | 2021-09-30 |

*Financial amounts are reported in dataset units; no currency designation is assumed.*

### Selected Daily Performance: September 30, 2021

| KPI | Result |
|---|---:|
| Transactions | 686 |
| Products Sold | 10,086 |
| Turnover | 53,780.08 |
| Purchase Cost | 38,474.35 |
| Gross Margin | 15,305.73 |
| Operational Margin | 11,287.08 |
| Average Order Value | 78.40 |

## Business Insights

### 1. Revenue Does Not Equal Operational Profitability

The business generated approximately 12.56 million in turnover and 2.93 million in operational margin during the analysis period.

The operational margin rate of approximately 23.31% indicates that profitability assessment requires more than revenue monitoring.

Combining financial and operational costs provides a clearer picture of business performance.

### 2. Logistics Expenses Influence Profitability

Shipping, fulfillment, and logistics costs directly influence the profitability retained from sales.

Integrating these expenses into financial reporting provides better visibility into operational cost efficiency and profitability.

This approach supports more informed commercial and operational decisions.

### 3. Order-Level Aggregation Improves Financial Visibility

Transforming individual product transactions into order-level records creates a consistent foundation for calculating shipping expenses and operational profitability.

It also prevents order-level shipping costs from being incorrectly applied to every product transaction.

### 4. Daily Financial KPIs Support Decision-Making

Daily reporting allows business stakeholders to monitor:

- Revenue and transaction trends
- Average order value
- Gross margin performance
- Logistics cost impact
- Operational profitability

These metrics provide a foundation for management reporting, commercial performance reviews, and future analytical dashboards.

## Data Quality and Validation

Quality checks were performed during the transformation process.

| Validation | Result |
|---|---|
| Sales order-product uniqueness | Passed |
| Missing product purchase prices | Passed |
| Order ID uniqueness | Passed |
| Operational order ID uniqueness | Passed |
| Missing shipping and logistics costs | Passed |

Each successful validation returned zero invalid records.

### LEFT JOIN vs RIGHT JOIN Comparison

Both JOIN types were compared during exploratory analysis.

| JOIN Type | Row Count |
|---|---:|
| LEFT JOIN | 1,375,630 |
| RIGHT JOIN | 1,375,632 |

The row counts differ by two records.

LEFT JOIN was selected for the primary financial analysis because preserving sales and order records is essential for reliable commercial reporting.

## Repository Structure

    greenweez-financial-analytics/
    ├── README.md
    └── sql/
        ├── 01_sales_margin.sql
        ├── 02_sales_margin_quality_checks.sql
        ├── 03_orders_financial_summary.sql
        ├── 04_operational_margin.sql
        └── 05_daily_financial_kpis.sql

## SQL Scripts

| File | Purpose |
|---|---|
| `01_sales_margin.sql` | Join sales and product purchasing data to calculate margins |
| `02_sales_margin_quality_checks.sql` | Check duplicate records and missing purchase prices |
| `03_orders_financial_summary.sql` | Aggregate sales data into order-level financial metrics |
| `04_operational_margin.sql` | Integrate shipping expenses and calculate operational profitability |
| `05_daily_financial_kpis.sql` | Generate daily financial KPIs and validate reporting totals |

## How to Reproduce the Analysis

1. Open Google BigQuery.
2. Prepare `gwz_sales`, `gwz_product`, and `gwz_ship` in a BigQuery dataset.
3. Update the project and dataset identifiers in the SQL scripts.
4. Execute the scripts in numerical order.
5. Verify the generated analytical tables and data quality results.
6. Review the final daily financial reporting table.

The SQL scripts use `CREATE OR REPLACE TABLE` statements and should be executed in a workspace where the user has the required permissions.

## Skills Demonstrated

- Google BigQuery and GoogleSQL
- Relational JOIN operations
- Transaction-level financial modeling
- Order-level aggregation
- Financial and operational KPI calculations
- Gross margin and operational margin analysis
- Data quality validation
- E-commerce business performance reporting
- Commercial analytics and decision support
- SQL documentation and reproducible analytical workflows

## Future Development Opportunities

The analytical model can be extended with:

- Interactive financial dashboards
- Monthly revenue and profitability trends
- Shipping cost efficiency analysis
- Operational margin rate monitoring
- Revenue and order volume comparisons
- Automated management reporting

These are potential enhancements and are not represented as completed components of the current project.

## About This Project

This project was developed as part of a practical SQL and data analytics learning program and documented as a business-oriented analytics portfolio project.

The objective is to demonstrate how raw sales, product purchasing, and logistics data can be transformed into structured financial reporting that supports commercial and operational decision-making.

---

**Tools:** Google BigQuery · GoogleSQL · GitHub

**Focus Areas:** Financial Analytics · Commercial Analytics · Operational Profitability · Data Quality
