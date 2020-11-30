WITH orders AS (SELECT 
id, 
user_id as customerid, 
order_date, 
status
FROM raw.jaffle_shop.orders)

SELECT * FROM orders