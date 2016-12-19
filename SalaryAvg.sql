SELECT ROUND(AVG(salary_amount)) from sample_staff.salary;

SELECT 
	department_employee_rel.department_id, 
    department.name,
	ROUND(AVG(salary.salary_amount))
FROM  sample_staff.salary 

	INNER JOIN sample_staff.department_employee_rel ON 1=1
    AND department_employee_rel.employee_id = salary.employee_id
    
    INNER JOIN sample_staff.department ON 1=1
    AND department_employee_rel.department_id = department.id
 
WHERE 1=1 
	
	AND year(salary.to_date) = '2000' 
	AND month(salary.to_date) = '1'
 
 GROUP BY department_employee_rel.department_id, department.name;
  
--  SELECT year(salary.to_date) from sample_staff.salary 
 -- WHERE  1=1 
--   and year(salary.to_date) = '2000' 
--   and month(salary.to_date) = '1';
 
 
--  year_month (in the form for example "01/2000", and focus only on data from date "2000-01-01")
-- department_id,department_name,department_average_salary,company_average_salary
-- department_vs_company (values: "lower" or "higher" or "same")
-- Store the company average in a session variable for easier & faster comparison.