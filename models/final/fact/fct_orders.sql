{{
    config(materialized="table")
}}

WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
), 
orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
)

SELECT 
orders.*, 
customers.first_name, 
customers.last_name
FROM orders
LEFT OUTER JOIN customers
ON orders.customerid = customers.id