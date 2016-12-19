
DROP VIEW  IF EXISTS v_average_salary;

CREATE VIEW v_average_salary AS
(

SELECT
 tmp1.dept_id,
 department.name as dept_name,
 tmp1.average_monthly_salary,
 monthly,
 yearly  
 FROM sample_staff.department 
 
 INNER JOIN 
(
SELECT  
	MONTH(salary.from_date) AS monthly, 
	YEAR(salary.from_date) AS yearly, 
    department.id as dept_id,
	ROUND(AVG(salary.salary_amount),2 ) as average_monthly_salary 
FROM sample_staff.salary 
	INNER JOIN sample_staff.department_employee_rel ON 1=1
    AND salary.employee_id = department_employee_rel.employee_id
    
    INNER JOIN sample_staff.department ON 1=1
    AND department_employee_rel.department_id = department.id
    
GROUP BY monthly, yearly,dept_id
) tmp1 ON 1=1 

AND department.id = tmp1.dept_id 
ORDER BY tmp1.monthly,tmp1.yearly,dept_name 

);

SELECT * from v_average_salary where dept_id=2;
