-- what tools are priced above the average?
SELECT name, price
FROM tools
WHERE price > (
    SELECT AVG(price)
    FROM tools
);


-- Customers who have made purchases in the last 30 days
SELECT first_name, last_name
FROM customers
WHERE id IN (
    SELECT DISTINCT customer_id
    FROM purchases
    WHERE purchase_date >= DATE('now', '-30 days')
);
