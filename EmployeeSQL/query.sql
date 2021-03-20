--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;
--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE
hire_date >= '01-01-1986'
AND hire_date <= '12-31-1986';
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, "Departments".dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN "Departments" ON dept_manager.dept_no = "Departments".dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, "Departments".dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" ON dept_emp.dept_no ="Departments".dept_no;
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM "Departments";
-- The department number of Sales department is d007
SELECT employees.emp_no, employees.last_name, employees.first_name, "Departments".dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN "Departments" ON dept_emp.dept_no = "Departments".dept_no
WHERE "Departments".dept_no = 'd007';
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN "Departments"
ON "Departments".dept_no=dept_emp.dept_no
WHERE "Departments".dept_name in ('Sales', 'Development')
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;