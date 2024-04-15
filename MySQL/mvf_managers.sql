/* Compare the number of male managers to the number of female managers 
from different departments for each year, starting from 1990 */

/*CSV Output: output/mvf_managers.csv*/
SELECT dept_emp.dept_name, dept_emp.gender,dept_emp.emp_no,dept_emp.from_date,dept_emp.to_date,e.calendar_year,
	CASE
		WHEN YEAR(dept_emp.from_date) <= e.calendar_year AND YEAR(dept_emp.to_date) >= e.calendar_year THEN 1
        ELSE 0
    END AS active_as_manager
FROM 
	(SELECT YEAR(e.hire_date) AS calendar_year
	FROM employees e
	GROUP BY calendar_year
	ORDER BY 1) e
CROSS JOIN
	(SELECT d.dept_name, ee.gender,dm.emp_no,dm.from_date,dm.to_date
FROM dept_emp de 
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees ee ON ee.emp_no = de.emp_no
JOIN dept_manager dm ON dm.emp_no = ee.emp_no) dept_emp
ORDER BY dept_emp.emp_no, e.calendar_year;


