/* the average salary of female versus male employees in the entire company until year 2002.*/

/*CSV Output: ouput/mvf_avg_salary.csv*/
SELECT e.gender, d.dept_name, ROUND(AVG(s.salary),2) AS salary, YEAR(s.from_date) AS calendar_year
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN salaries s ON s.emp_no = e.emp_no
GROUP BY d.dept_no, e.gender, calendar_year
HAVING calendar_year <=2002
ORDER BY d.dept_no;

