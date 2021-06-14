SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	titles.title, 
	titles.from_date, 
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;




-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

SELECT * FROM unique_titles

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (*), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

select * FROM retiring_titles;

-- Create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON(employees.emp_no)employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE dept_emp.to_date = ('1999-01-01') 
AND employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY employees.emp_no;

select * from mentorship_eligibility;

