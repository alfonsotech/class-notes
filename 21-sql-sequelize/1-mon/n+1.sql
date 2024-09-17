-- Initial query to get all cats
SELECT * FROM cats;

-- For each cat, execute another query to get their toys
SELECT * FROM cat_toys WHERE cat_id = ?;
-- ? = every single cat id
-- SELECT * FROM toys WHERE cat_id = 1; 
-- SELECT * FROM toys WHERE cat_id = 2;
-- SELECT * FROM toys WHERE cat_id = 3;
-- SELECT * FROM toys WHERE cat_id = 4;
-- SELECT * FROM toys WHERE cat_id = 5; 

-- Create a single query using JOIN
SELECT cats.*, toys.*
FROM cats
JOIN cat_toys ON cats.id = cat_toys.cat_id
JOIN toys ON cat_toys.toy_id = toys.id;
