USE codeup_test_db;

SELECT name AS 'The name of all albums by Pink Floyd';
FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date AS 'The year the Sgt Peppers''s Lonely Hearts Club Band '
FROM albums
Where name = 'Sgt Peppers''s Lonely Hearts Club Band';

SELECT genre AS 'The genres for Nevermind'
FROM albums
Where name = 'Nevermind';

SELECT name AS 'Albums released in the 90''s'
FROM albums
WHERE release_date BETWEEN 1990 and 1998;

SELECT name as 'Albums with less than 20 million sales'
FROM albums
WHERE sales < 20;

SELECT name AS 'All Rock albums'
FROM albums
WHERE genre = 'Rock'
