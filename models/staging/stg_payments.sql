WITH payments AS (SELECT 
orderid,
paymentmethod, 
status, 
amount, 
created
FROM raw.stripe.payment)

SELECT * FROM payments