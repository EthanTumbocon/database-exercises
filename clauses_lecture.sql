USE employees;

SELECT DISTINCT first_name, last_name
FROM employees
WHERE first_name LIKE '%E%';

SELECT first_name, last_name
FROM employees
WHERE last_name IN ('Pearson', 'Luks', 'Peyn');

SELECT emp_no, to_date
FROM titles;

DESCRIBE titles;

SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name IN ('Herbert', 'Baek')
    AND emp_no < 20000;

SELECT emp_no, first_name,last_name
FROM employees
WHERE emp_no < 20000
  AND (
        last_name IN ('Herbert', 'Baek')
        OR first_name = 'Shridhar'
    );
