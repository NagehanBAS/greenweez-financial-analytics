
# Greenweez | Financial & Operational Analytics

### End-to-End SQL Financial Analysis with Google BigQuery

A SQL-based financial analytics project examining e-commerce sales, product acquisition costs, shipping expenses, and operational profitability.

The project transforms transaction-level data into order-level financial metrics and daily management reporting using Google BigQuery.

## Project Overview

Understanding revenue alone is not enough to evaluate business performance. Financial analysis also requires visibility into product costs, fulfillment expenses, and the profitability of individual orders.

This project builds a structured analytical workflow to answer key commercial questions:

- How much revenue does the business generate?
- What is the cost of products sold?
- How profitable are sales before logistics expenses?
- How do shipping and logistics costs affect profitability?
- How do revenue, transaction volume, and profitability change over time?
- What is the average order value?

## Technology Stack

- **Google BigQuery** — Cloud data warehouse
- **SQL (GoogleSQL)** — Data transformation and analysis
- **LEFT JOIN / RIGHT JOIN** — Relational data integration
- **CTEs and aggregations** — SQL analytical concepts
- **Data quality checks** — Primary key uniqueness and NULL validation
- **GitHub** — Version control and project documentation

## Dataset

The analysis uses three source tables from the Greenweez educational dataset.

| Source table | Description | Key fields |
|---|---|---|
| `gwz_sales` | Transaction-level sales data | `date_date`, `orders_id`, `products_id`, `turnover`, `qty` |
| `gwz_product` | Product purchasing information | `products_id`, `purchase_price` |
| `gwz_ship` | Order-level shipping and logistics costs | `orders_id`, `shipping_fee`, `ship_cost`, `log_cost` |

**Analysis period:** April 1, 2021 – September 30, 2021

**Reporting coverage:** 183 calendar days

Source data is not included in this repository. Reproducing the analysis requires access to the relevant tables in Google BigQuery.

## Data Transformation Workflow

The project follows five main processing stages.

**1. Sales Margin Analysis**

Join transaction-level sales records with product purchasing prices using `products_id`.

Calculate:

- Purchase Cost = Quantity × Purchase Price
- Gross Margin = Turnover − Purchase Cost

Output: `gwz_sales_margin`

**2. Data Quality Validation**

Check for:

- Duplicate `orders_id` and `products_id` combinations
- Missing product purchasing prices

Both tests returned zero rows in the completed analysis.

**3. Order-Level Financial Aggregation**

Aggregate transaction-level records into individual orders.

Calculate order-level quantities, revenue, purchasing costs, and gross margins.

Output: `gwz_orders`

**4. Operational Profitability Analysis**

Join order-level financial data with shipping and logistics expenses using `orders_id`.

Calculate:

Operational Margin = Gross Margin + Shipping Fee − Shipping Cost − Logistics Cost

Output: `gwz_orders_operational`

**5. Daily Financial Reporting**

Aggregate order-level results by date to calculate daily commercial and operational KPIs.

Output: `gwz_finance_day`

## Financial KPI Results

The final daily financial dataset produced the following results for the six-month analysis period.

| KPI | Result |
|---|---:|
| Reporting Days | 183 |
| Total Turnover | 12,558,933.09 |
| Total Operational Margin | 2,927,221.48 |
| Operational Margin Rate | 23.31% |
| First Reporting Date | 2021-04-01 |
| Last Reporting Date | 2021-09-30 |

*Financial values are presented in dataset units; no currency designation is assumed.*

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

### 1. Revenue is not the same as operational profitability

The dataset generated approximately 12.56 million in turnover and 2.93 million in operational margin.

This highlights the importance of evaluating cost structures alongside revenue performance.

### 2. Logistics costs materially influence profitability

Shipping, delivery, and logistics expenses reduce the amount of gross margin retained by the business.

Integrating operational cost data creates a more meaningful measure of commercial performance than analyzing sales alone.

### 3. Order-level analysis improves financial visibility

Aggregating individual product transactions into order-level records enables more reliable reporting of order profitability, shipping costs, and average basket value.

### 4. Daily reporting supports commercial decision-making

Daily financial KPIs allow analysts and business stakeholders to monitor changes in sales volume, revenue, cost efficiency, and profitability.

This reporting structure can support future dashboards, performance reviews, and financial planning.

## Data Quality & Validation

Data validation was performed throughout the analytical workflow.

| Validation | Result |
|---|---|
| Sales order-product uniqueness | Passed |
| Missing product purchase prices | Passed |
| Order ID uniqueness | Passed |
| Operational order ID uniqueness | Passed |
| Missing shipping and logistics costs | Passed |

A successful validation query returned zero invalid records.

Both LEFT JOIN and RIGHT JOIN were evaluated during initial data exploration.

- LEFT JOIN result: 1,375,630 rows
- RIGHT JOIN result: 1,375,632 rows

LEFT JOIN was selected for the primary analysis to preserve sales and order records.

## Repository Structure

```text
greenweez-financial-analytics/
├── README.md
└── sql/
    ├── 01_sales_margin.sql
    ├── 02_sales_margin_quality_checks.sql
    ├── 03_orders_financial_summary.sql
    ├── 04_operational_margin.sql
    └── 05_daily_financial_kpis.sql
```

## How to Run

1. Open Google BigQuery.
2. Prepare the three source tables in a dataset.
3. Update the project and dataset identifiers in the SQL scripts as necessary.
4. Run the SQL scripts in numerical order.
5. Review the resulting financial tables and validation outputs.

The scripts create analytical tables within the specified BigQuery project and dataset. They should be executed in a workspace where the user has appropriate permissions.

## Skills Demonstrated

- SQL JOIN operations and relational data modeling
- Transaction-level to order-level aggregation
- Financial KPI design
- Gross and operational margin calculations
- Data quality assurance
- BigQuery analytical workflows
- E-commerce commercial performance analysis
- SQL documentation and reproducible reporting

## Potential Extensions

Future development opportunities include:

- Interactive financial dashboards
- Monthly profitability trends
- Operational margin percentage analysis by period
- Shipping cost efficiency monitoring
- Revenue and transaction volume comparisons
- Automated commercial performance reporting

## About This Project

This project was developed as part of a practical SQL and data analytics learning program and independently documented as a business-oriented analytics portfolio project.

Its focus is on translating raw commercial and operational data into structured financial reporting and decision-support metrics.

---

**Tools:** Google BigQuery · SQL · GitHub

**Focus Areas:** Financial Analytics · Commercial Analytics · Operational Profitability · Data Quality
