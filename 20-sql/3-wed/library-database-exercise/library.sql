DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS book_category;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS library_cards;

CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    isbn TEXT UNIQUE NOT NULL,
    authors_id INTEGER REFERENCES authors(id)
);

CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE book_category (
    books_id INTEGER REFERENCES books(id),
    categories_id INTEGER REFERENCES categories(id)
);

CREATE TABLE members (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE library_cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    card_number TEXT UNIQUE NOT NULL,
    members_id INTEGER REFERENCES members(id)
);

CREATE TABLE book_loans (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    member_id INTEGER,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

-- SEED
INSERT INTO members (name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com');


INSERT INTO library_cards (card_number, members_id) VALUES
('LC001', 1),
('LC002', 2),
('LC003', 3);

-- Seed data for authors
INSERT INTO authors (name) VALUES
('Virginia Wolf'),
('George Orwell'),
('Jane Austen');


INSERT INTO books (title, isbn, authors_id) VALUES
('Orlando', '9780747532743', 1),
('1984', '9780451524935', 2),
('Pride and Prejudice', '9780141439518', 3),
('Animal Farm', '9780451526342', 2);


INSERT INTO categories (name) VALUES
('Fantasy'),
('Science Fiction'),
('Classic Literature'),
('Dystopian');


INSERT INTO book_category (books_id, categories_id) VALUES
(1, 1),  -- Virginia Wolf: Fantasy
(2, 2),  -- 1984: Science Fiction
(2, 4),  -- 1984: Dystopian
(3, 3),  -- Pride and Prejudice: Classic Literature
(4, 3),  -- Animal Farm: Classic Literature
(4, 4);  -- Animal Farm: Dystopian

-- QUERIES
SELECT * FROM members;

SELECT title FROM books;

SELECT title 
FROM books 
WHERE authors_id = (SELECT id FROM authors WHERE name = 'Virginia Wolf');

SELECT COUNT(*) AS total_books FROM books;

SELECT name 
FROM categories 
ORDER BY name ASC;