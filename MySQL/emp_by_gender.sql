/* a breakdown between the male and female employees 
working in the company each year, starting from 1990 */

/*CSV Output: output/emp_by_gender.csv*/
SELECT 
    DATE_FORMAT(d.from_date, "%Y") AS calendar_year,
    SUM(CASE WHEN e.gender = "F" THEN 1 ELSE 0 END) AS female,
    SUM(CASE WHEN e.gender = "M" THEN 1 ELSE 0 END) AS male
FROM employees e
JOIN dept_emp d ON e.emp_no = d.emp_no
GROUP BY 1
HAVING calendar_year >= 1990
ORDER BY 1;


