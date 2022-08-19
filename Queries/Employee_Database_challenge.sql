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
