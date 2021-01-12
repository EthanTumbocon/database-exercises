USE codeup_test_db;

CREATE TABLE IF NOT EXISTS albums(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(255) NOT NULL DEFAULT 'Unknown',
    name VARCHAR(255) NOT NULL DEFAULT 'Unknown',
    release_date INT UNSIGNED,
    sales FLOAT UNSIGNED,
    genre VARCHAR(100),
    PRIMARY KEY(id)
);