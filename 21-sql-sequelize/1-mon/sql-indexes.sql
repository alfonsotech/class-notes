
-- Syntax
CREATE INDEX index_name ON table_name(column_list);


-- Good index for frequent lookups by cat name
CREATE INDEX idx_cats_name ON cats(name);

-- Potentially unnecessary index on toys color (low cardinality)
CREATE INDEX idx_toys_color ON toys(color);

-- Useful index for improving join performance
CREATE INDEX idx_cat_toys_cat_id ON cat_toys(cat_id);

-- Run explain plan
EXPLAIN QUERY PLAN
SELECT * FROM cats WHERE name = 'Finn';

Explain QUERY PLAN
SELECT * FROM cats WHERE breed = 'Siamese';

CREATE INDEX idx_cats_breed ON cats(breed);

--Mulitple columns

CREATE INDEX idx_cats_color_breed ON cats(color, breed);

SELECT * FROM cats WHERE color = 'orange' AND breed = 'Tabby';

SELECT * FROM cats WHERE color = 'orange';

-- Remove Index
DROP INDEX idx_cats_color_breed;

-- Search For Indexes
-- # To search for all indexes
sqlite> .indexes # returns a list of indexes in the entire database

-- # To search for all indexes by table
sqlite> .indexes ?table_name? # returns a list of all indexes on that table
--                               # ex: .indexes bakers => all indexes in the bakers table

-- # To search for indexes by keyword
sqlite> .indexes %keyword% # returns a list of all indexes including the keyword

-- What happens to indexes if you alter a table?