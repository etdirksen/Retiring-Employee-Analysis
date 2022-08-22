-- DELIVERABLE 1
-- Create retirement_titles table 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (e.birth_date  BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.to_date DESC;



-- Use Dictinct with Orderby to remove duplicate titles
DROP TABLE IF EXISTS unique_titles CASCADE;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    t.title
INTO unique_titles
FROM employees AS e
    INNER JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (e.birth_date  BETWEEN '1952-01-01' AND '1955-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no, t.to_date DESC;

SELECT *
FROM unique_titles;



-- Get count of titles from unique_titles table
SELECT COUNT(title),
    title
INTO retiring_titles_count
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


-- --------------------------------------------------------------------------------------------------------


-- DELIVERABLE 2
-- Create table to return employees eligible for the mentorship program.
DROP TABLE IF EXISTS mentorship_eligibility CASCADE;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees AS e
    JOIN dept_employee as de
    ON (e.emp_no = de.emp_no)
    JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;



SELECT e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    ei.to_date
FROM employees as e
    INNER JOIN emp_info as ei
    ON (e.emp_no = ei.emp_no);
    
SELECT *
FROM unique_titles
WHERE to_date = '9999-01-01';
    