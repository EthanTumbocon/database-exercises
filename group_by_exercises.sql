USE employees;

SELECT DISTINCT title FROM titles;

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name asc;

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e';

SELECT last_name
from employees
WHERE last_name LIKE '%q';

SELECT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;


