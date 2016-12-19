/*CREATE INDEX idx_personal_code2 
on sample_staff.employee(personal_code(2)); */

 SELECT * from sample_staff.employee USE INDEX( idx_personal_code2)
	where personal_code = 'AA-751492';
    
     SELECT * from sample_staff.employee 
    USE INDEX( ak_employee)
	where personal_code = 'AA-751492';
    
     SELECT * from sample_staff.employee 
   
	where personal_code = 'AA-751492';