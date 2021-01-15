USE jupiter_db;

CREATE TABLE roles (`codeup_test_db@localhost`
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                    name VARCHAR(100) NOT NULL,
                    PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

SHOW TABLES;

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

SELECT * FROM roles;
SELECT * FROM users;

# INNER JOIN/ this is going to return records that have values for user_name AND role_name
SELECT users.name as user_name, roles.name as role_name
FROM users
         JOIN roles ON users.role_id = roles.id;

#LEFT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
         LEFT JOIN roles ON users.role_id = roles.id;

#RIGHT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;

# ============================== JOINS

# Use joins when you need columns of data across multiple tables

# Use foreign keys to ensure referential integrity
#   (can't insert record with id for record that doesn't exist) and to clearly describe DB structure


# Posts
#
# id(PK) | title | content | user_id (FK) | created_at | updated_at
#
# Users
#
# id(PK) | email | pass    | created_at | updated_at

drop table if exists pets;
drop table if exists owners;

CREATE TABLE owners (
                        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(30) NOT NULL,
                        address VARCHAR(255) DEFAULT 'Undisclosed'
);

CREATE TABLE pets
(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    owner_id INT UNSIGNED,
    age INT,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES owners (id)
);

INSERT INTO owners (name, address)
VALUES ('Darth Vader', '1138 Death Star Rd.');

INSERT INTO pets (name, owner_id, age)
VALUES ('Puddles', 1, 2);

INSERT INTO pets (name, owner_id, age)
VALUES ('Patch', 1, 3);

SELECT * FROM pets;
SELECT * FROM owners;


# ============================== BASIC JOINS

# list the name and address of a pet // based on owner id

SELECT pets.name, owners.address
FROM pets
         JOIN owners ON pets.owner_id = owners.id;

# list the number of pets at each address

SELECT owners.address, COUNT(owners.address) FROM pets
                                                      JOIN owners ON owners.id = pets.owner_id
GROUP BY owners.address;

# List the address with the fewest pets. If a tie occurs, return the alphabetically first address.

SELECT owners.address, COUNT(*) FROM owners
                                         JOIN pets ON pets.owner_id = owners.id
GROUP BY owners.address
ORDER BY COUNT(*) ASC, owners.address
LIMIT 1;

# Find the average age of pets for each address

select o.address, AVG(p.age) from pets as p
                                      join owners as o on o.id = p.owner_id
group by o.address;

# Output the "{NAME_OF_PET} is owned by {NAME_OF_OWNER}"

SELECT CONCAT(pets.name, ' is owned by ', owners.name) AS Message FROM pets
                                                                           JOIN owners
                                                                                ON owners.id = pets.owner_id;



# ============================== BASIC JOINS WITH ALIASES

USE employees;

SELECT * FROM employees;
SELECT * FROM titles;

# output all current employee names and their current titles
SELECT CONCAT(employees.first_name, ' ', employees.last_name), titles.title
FROM employees
         JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date > NOW()
ORDER BY titles.title;

DESCRIBE titles;

# using aliases
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, t.title
FROM employees AS e
         JOIN titles AS t
              ON e.emp_no = t.emp_no
WHERE t.to_date > NOW()
ORDER BY t.title;


# output name and current department for employee number 10001
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name, de.to_date
FROM employees AS e
         JOIN dept_emp AS de
              ON de.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;
