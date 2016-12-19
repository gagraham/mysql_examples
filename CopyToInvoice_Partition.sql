INSERT into sample_staff.invoice_partition
(
-- id,
employee_id,
invoiced_date,
paid_flag,
insert_dt,
insert_user_id,
insert_process_code,
update_dt,
update_user_id,
update_process_code,
deleted_flag, 
department_code
)
 
SELECT
	-- invoice.id,
    invoice.employee_id,
    invoice.invoiced_date,
    invoice.paid_flag,
    invoice.insert_dt,
    invoice.insert_user_id,
    invoice.insert_process_code,
    invoice.update_dt,
    invoice.update_user_id,
    invoice.update_process_code,
    invoice.deleted_flag,
    department.code 
FROM sample_staff.invoice 

	INNER JOIN sample_staff.department_employee_rel  ON 1=1
		AND invoice.employee_id = department_employee_rel.employee_id
		AND invoice.invoiced_date 
		BETWEEN department_employee_rel.from_date 
			AND department_employee_rel.to_date
	
    INNER JOIN sample_staff.department ON 1=1
		AND department_employee_rel.department_id = department.id 
        
;

