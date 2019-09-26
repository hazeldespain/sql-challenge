-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT 
	employees.emp_no AS "employee number",
	employees.last_name AS "last name",
	employees.first_name AS "first name",
	employees.gender AS gender,
	salaries.salary AS salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT * FROM employees 
WHERE (employees.hire_date < '1/1/87') AND (employees.hire_date > '12/31/85');

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT 
	dept_manager.dept_no AS "department number",
	departments.dept_name AS "department name",
	dept_manager.emp_no AS "manager employee number",
	employees.last_name AS "last name",
	employees.first_name AS "first name",
	dept_manager.from_date AS "start date",
	dept_manager.to_date AS "end date"
FROM departments, dept_manager, employees
WHERE 
	(departments.dept_no = dept_manager.dept_no) AND
	(dept_manager.emp_no = employees.emp_no);

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no AS "employee number",
	employees.last_name AS "last name",
	employees.first_name AS "first name",
	departments.dept_name AS "department name" 
FROM employees, dept_emp, departments
WHERE (dept_emp.emp_no = employees.emp_no) AND (dept_emp.dept_no = departments.dept_no);

--5. List all employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT *
FROM employees
WHERE (employees.last_name LIKE 'B%') AND (employees.first_name = 'Hercules');

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no AS "employee number",
	employees.last_name AS "last name",
	employees.first_name AS "first name",
	departments.dept_name AS "department name"
FROM employees, departments, dept_emp
WHERE (dept_emp.emp_no = employees.emp_no) AND 
	(dept_emp.dept_no = departments.dept_no) AND 
	(departments.dept_name LIKE 'S%'); 

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no AS "employee number",
	employees.last_name AS "last name",
	employees.first_name AS "first name",
	departments.dept_name AS "department name"
FROM employees, departments, dept_emp
WHERE (dept_emp.emp_no = employees.emp_no) AND 
	(dept_emp.dept_no = departments.dept_no) AND 
	((departments.dept_name LIKE 'S%') OR (departments.dept_name LIKE 'D%')); 
	
--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT 
	employees.last_name AS "last name",
	COUNT(employees.last_name) AS "frequency"
FROM employees
GROUP BY "last name"
ORDER BY
	"frequency" DESC; 


