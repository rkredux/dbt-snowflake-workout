{{
    config(materialized="table")
}}

WITH customer_orders AS (
    SELECT * FROM {{ ref('int_orders_groupby_customers') }}
), 
customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
)

SELECT 
customers.*, 
co.first_order_date, 
co.last_order_date, 
COALESCE(co.total_orders, 0) as order_count
FROM customers
LEFT OUTER JOIN customer_orders co
ON customers.id = co.customerid
