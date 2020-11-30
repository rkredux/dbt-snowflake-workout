SELECT
customerid, 
MAX(order_date) AS last_order_date, 
MIN(order_date) AS first_order_date, 
COUNT(id) AS total_orders 
FROM {{ref('stg_orders')}}
GROUP BY customerid