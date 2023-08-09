SHOW DATABASES;

SHOW TABLES FROM company_constraints;

USE company_constraints;

CREATE VIEW employees_salary_27000_view AS
	SELECT CONCAT(Fname, Minit, Lname) AS Name, Salary, Dno AS Dept_number FROM employee
	WHERE Salary > 26999;

SELECT * FROM employees_salary_27000_view;

SELECT * FROM employee;

CREATE VIEW employees_salary_view AS
	SELECT CONCAT(Fname, Minit, Lname) AS Name, Salary, Dno AS Dept_number FROM employee
	WHERE Sex = 'M';

SELECT * FROM dependent;

DROP VIEW employees_salary_view;

CREATE OR REPLACE VIEW employees_dependent_view AS
	SELECT CONCAT(Fname, Minit, Lname) AS Name, e.Dno AS Departament, d.Dependent_name AS Dependent
	FROM employee e
	INNER JOIN dependent d ON e.Ssn = d.Essn;

SELECT * FROM employees_dependent_view;
