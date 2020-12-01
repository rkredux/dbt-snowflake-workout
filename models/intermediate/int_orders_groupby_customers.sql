WITH orders AS (
    SELECT 
        id,
        customerid, 
        order_date
    FROM {{ ref('stg_orders') }}
), 
successful_payments AS (
    SELECT 
        orderid, 
        amount
    FROM {{ ref('stg_payments') }}
    WHERE status = 'success'
), 
orders_with_payments AS (
    SELECT
    orders.id, 
    orders.customerid, 
    orders.order_date, 
    successful_payments.amount
    FROM orders
    LEFT OUTER JOIN successful_payments
    ON orders.id = successful_payments.orderid

), 
orders_with_payments_grouped_by_customer AS (
    SELECT 
    customerid,
    MAX(order_date) AS last_order_date, 
    MIN(order_date) AS first_order_date, 
    COUNT(id) AS total_orders, 
    SUM(amount) AS life_time_value
    FROM orders_with_payments
    GROUP BY customerid
)

SELECT *
FROM orders_with_payments_grouped_by_customer



