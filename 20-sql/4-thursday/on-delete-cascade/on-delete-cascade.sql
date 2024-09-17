-- sqlite> PRAGMA foreign_keys = ON;
-- sqlite> .read on-delete-cascade.sql

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS reviews;

CREATE TABLE employees (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name text NOT NULL,
   department text NOT NULL
);

CREATE TABLE reviews (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE
);

-- SEEDS
INSERT INTO employees (name, department) VALUES
('Cooper', 'Accounting'),
('Indie', 'HR'),
('Kota', 'Project Manager');


INSERT INTO reviews (employee_id) VALUES
(1),
(3),
(2),
(3);


-- QUERIES
SELECT * FROM employees;
SELECT * FROM reviews;
DELETE FROM employees WHERE name = 'Kota';
SELECT * FROM employees;
SELECT * FROM reviews;