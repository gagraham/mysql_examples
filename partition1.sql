
SELECT distinct 
invoice.employee_id, 
invoice.invoiced_date,
department_employee_rel.department_id,
department.code 
 -- department_employee_rel.from_date,
 -- department_employee_rel.to_date

FROM sample_staff.invoice
	INNER JOIN sample_staff.department_employee_rel  ON 1=1
    AND invoice.employee_id = department_employee_rel.employee_id
    AND invoice.invoiced_date 
		BETWEEN department_employee_rel.from_date 
			AND department_employee_rel.to_date
	
    INNER JOIN sample_staff.department ON 1=1
    AND department_employee_rel.department_id = department.id 
	ORDER BY invoice.employee_id;
    