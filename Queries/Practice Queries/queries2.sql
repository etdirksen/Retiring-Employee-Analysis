-- Put info for retirement-eligible employees into a new table
DROP TABLE IF EXISTS retirement_info;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * 
FROM retirement_info;



-- Retirement eligibility count
SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');



-- Retirement eligibility by year
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

SELECT first_name, last_name, title
FROM employees as e
LEFT JOIN titles as e ON e.emp_no = t.emp_no




-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;




-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_employee as de
ON ri.emp_no = de.emp_no;





-- Create new table for retirement-eligible & active employees at PH
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employee as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');





-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO TABLE dept_counts
FROM current_emp as ce
LEFT JOIN dept_employee as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;



-- (1) Employee Information: A list of employees containing their 
-- unique employee number, their last name, first name, gender, and salary
SELECT e.emp_no, 
    e.first_name,
    e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
    INNER JOIN salaries as s
    ON (e.emp_no = s.emp_no)
    INNER JOIN dept_employee as de
    ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');



-- (2) Management: A list of managers for each department, 
-- including the department number, dept. name, and the manager's employee number, 
-- last name, first name, and the starting and ending employment dates
SELECT dm.emp_no,
    dm.dept_no,
    dm.from_date,
    dm.to_date,
    d.dept_name,
    ce.first_name,
    ce.last_name
INTO manager_info
FROM dept_manager as dm
    INNER JOIN departments as d
    ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp as ce
    ON (dm.emp_no = ce.emp_no);
    
SELECT *
FROM manager_info;



-- (3) Department Retirees: An updated current_emp list that includes everything 
-- it currently has, but also the employee's departments
SELECT ce.emp_no,
    ce.first_name,
    ce.last_name,
    d.dept_name
INTO dept_info
FROM current_emp AS ce
    INNER JOIN dept_employee AS de
    ON (ce.emp_no = de.emp_no)
    INNER JOIN departments AS d
    ON (de.dept_no = d.dept_no)



-- tailored list: from retirement_info, bring only those in Sales
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    di.dept_name
FROM retirement_info AS ri
    JOIN dept_info AS di
    ON (ri.emp_no = di.emp_no)
ORDER BY emp_no;



SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    di.dept_name
FROM retirement_info AS ri
    JOIN dept_info AS di
    ON (ri.emp_no = di.emp_no)
WHERE di.dept_name = 'Sales';



-- tailored list: from retirement_info, bring those in Sales or in Development
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    di.dept_name
FROM retirement_info AS ri
    JOIN dept_info AS di
    ON (ri.emp_no = di.emp_no)
WHERE di.dept_name IN ('Sales', 'Development')
ORDER BY ri.emp_no;



-- Challenge 7: retiring employees per title


-- Challenge 7: identify employees who are eligible to participate in a mentorship program



