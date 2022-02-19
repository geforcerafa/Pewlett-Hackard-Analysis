-- DELIVERABLE 1, PART 1, CHALLENGE
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- DELIVERABLE 1, PART 2 CHALLENGE
SELECT DISTINCT ON (r.emp_no) r.emp_no,
    r.first_name,
	r.last_name,
    r.title
INTO unique_titles
FROM retirement_titles as r
WHERE r.to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- DELIVERABLE 1, PART 3 retiring_titles
SELECT COUNT(u.title), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY count (u.title) DESC;

-- DELIVERABLE 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC, to_date DESC;