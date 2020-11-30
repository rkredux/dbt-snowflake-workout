WITH customers as (SELECT id, 
  first_name, 
  last_name
  FROM raw.jaffle_shop.customers) 

SELECT * FROM customers