USE codeup_test_db;

SELECT * FROM albums WHERE release_date > 1991;

SELECT * FROM albums WHERE genre = 'Disco';

SELECT * FROM albums WHERE artist = 'Whitney Houston / Various Artists';

DELETE from albums WHERE artist = 'Whitney Houston / Various Artists';

DELETE FROM albums WHERE genre = 'Disco';

DELETE FROM albums where release_date > 1991;