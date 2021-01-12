USE codeup_test_db;

SELECT * FROM albums;

SELECT * FROM albums WHERE release_date < 1990;

SELECT * FROM albums WHERE artist =  'Michael Jackson';

UPDATE albums set sales = (sales * 10);

UPDATE albums set release_date = (release_date - 100) WHERE release_date < 1900;

UPDATE albums set artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';