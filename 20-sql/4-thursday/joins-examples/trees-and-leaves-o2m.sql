-- One-to-Many example
DROP TABLE IF EXISTS leaves;
DROP TABLE IF EXISTS trees;

CREATE TABLE trees (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tree_type VARCHAR(50)
);

CREATE TABLE leaves (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  color VARCHAR(50),
  tree_id INTEGER,
  FOREIGN KEY (tree_id) REFERENCES trees(id) 
);

INSERT INTO trees (tree_type) VALUES ('Oak'), ('Maple');
INSERT INTO leaves (color, tree_id) VALUES ('Green', 1), ('Yellow', 1), ('Red', 2);

-- retrieving information about trees and their leaves
SELECT trees.tree_type, leaves.color FROM leaves 
JOIN trees ON leaves.tree_id = trees.id;


-- The "right" table is the table that comes after `JOIN`
-- The "left" table is the table that comes after `FROM` 
-- trees <-> leaves

