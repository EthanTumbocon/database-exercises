USE employees;

SELECT CONCAT(first_name, ' ' , last_name) AS 'All employees'
FROM employees;

SELECT first_name
FROM employees
WHERE first_name LIKE '%sus%'
    AND last_name NOT LIKE '%q%';

# returns result in date-time
SELECT NOW();

#return result as date
SELECT CURDATE();

#returns result as time
SELECT CURTIME();


SELECT UNIX_TIMESTAMP();


SELECT CONCAT(
  'Teaching people to code for ',
  UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
  ' seconds'
  );
