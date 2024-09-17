-- Data Store - variables, arrays, objects, cookies, session storage, local storage
-- What is a database, what is it for?
-- Relational Databases, non-Relational Databases
-- SQL (Structured Query Language) 
-- SQL dialects: MySQL, PostgreSQL, SQLite
-- Tables, Rows(records), Columns(fields), Primary Keys
-- Basic SQL Commands: SELECT, FROM, WHERE

-- LET'S RUN SOME SQL IN THE TERMINAL
-- 1
CREATE TABLE puppies (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age_yrs NUMERIC(3,1),
  breed VARCHAR(100),
  weight_lbs INTEGER,
  microchipped BOOLEAN DEFAULT FALSE
);

DROP TABLE puppies;

-- 2
CREATE TABLE friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

INSERT INTO friends (id, first_name, last_name)
VALUES
  (1, 'Amy', 'Pond');

-- No need to specify `id` value, notice values order
INSERT INTO friends (last_name, first_name)
VALUES
('Pond', 'Amy');

-- Multiple Values Insert
INSERT INTO friends (first_name, last_name)
VALUES
  ('Rose', 'Tyler'),
  ('Martha', 'Jones'),
  ('Donna', 'Noble'),
  ('River', 'Song');

  SELECT * FROM friends;

-- Error: UNIQUE constraint failed: friends.id
INSERT INTO friends (id, first_name, last_name)
VALUES (5, 'Jenny', 'Who'); 

-- 3
CREATE TABLE puppies (
  id INTEGER,
  name VARCHAR(100),
  age_yrs DECIMAL(2,1),
  breed VARCHAR(100),
  weight_lbs INT,
  microchipped BOOLEAN
);

INSERT INTO puppies 
VALUES 
  (1, 'Cooper', 1, 'Miniature Schnauzer', 18, 1),
  (2, 'Indie', 0.5, 'Yorkshire Terrier', 13, 1),
  (3, 'Kota', 0.7, 'Australian Shepherd', 26, 0),
  (4, 'Zoe', 0.8, 'Korean Jindo', 32, 1),
  (5, 'Charley', 1.5, 'Basset Hound', 25, 0),
  (6, 'Ladybird', 0.6, 'Labradoodle', 20, 1),
  (7, 'Callie', 0.9, 'Corgi', 16, 0),
  (8, 'Jaxson', 0.4, 'Beagle', 19, 1),
  (9, 'Leinni', 1, 'Miniature Schnauzer', 25, 1),
  (10, 'Max', 1.6, 'German Shepherd', 65, 0);

  SELECT * FROM puppies;

  SELECT name, age_yrs, weight_lbs FROM puppies;

  SELECT * FROM puppies 
  WHERE id = 5;

-- Delete
  DELETE FROM puppies
  WHERE microchipped = 0;
  SELECT * FROM puppies;

  -- 4
  CREATE TABLE friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

INSERT INTO friends (first_name, last_name)
VALUES
('Amy', 'Pond'),
('Rose', 'Tyler'),
('Martha', 'Jones'),
('Donna', 'Noble'),
('River', 'Song');

UPDATE friends
SET last_name = 'Blue'
WHERE first_name = 'Amy' AND last_name = 'Pond';

SELECT * FROM friends;