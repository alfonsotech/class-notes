--    - COUNT - How many times does this entry occur
--         - count(X) or count(*)
--         - The count(X) function returns a count of the number  of times that X is not NULL in a group. The count(*) function (with no arguments) returns the total number of rows in the group.
--     - MIN - The lowest value
--     - MAX - The highest value
--     - SUM or TOTAL - Adds up the values
--     - AVG - The average of the values

-- COUNT
SELECT COUNT(*) FROM employees;
SELECT COUNT(DISTINCT department) FROM employees;

-- SUM
SELECT SUM(price) FROM tools;

-- AVG
SELECT AVG(price) FROM tools WHERE department_id = 2;

-- MIN
SELECT MIN(price) FROM tools;

-- MAX
SELECT MAX(purchase_date) FROM purchases;

