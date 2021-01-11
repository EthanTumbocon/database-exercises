USE codeup_test_db;

CREATE TABLE transactions (
   id INT,
   date DATE,
   description VARCHAR(255),
   amount decimal(10,2),
);

CREATE TABLE IF NOT EXISTS items (
    id INT,
    price DECIMAL(10,2),
    description VARCHAR(255),
    name VARCHAR(255),
    category VARCHAR(255)
    );