CREATE TABLE employees (
    emp_id     INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    salary     DECIMAL(10,2)
);


INSERT INTO employees (emp_id, first_name, last_name, salary)
VALUES (1, 'John', 'Doe', 5000.00);

INSERT INTO employees (emp_id, first_name, last_name, salary)
VALUES (2, 'Jane', 'Smith', 6000.00);

-- Select all
SELECT * FROM employees;

-- Select with condition
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 5500;

UPDATE employees
SET salary = 6500.00
WHERE emp_id = 2;

DELETE FROM employees
WHERE emp_id = 1;


DROP TABLE employees;
