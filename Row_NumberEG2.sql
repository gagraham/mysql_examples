SET @row_number = 0;
SET @dummy_salary_amount = 0;
SET @dummy_employee_id = 0;
SELECT
employee_id,
ROUND(AVG(`@row_number`), 1) AS average_month_when_salary_decreases
	FROM (
		SELECT
			`id`,
			`employee_id`,
			`salary_amount`,
			`from_date`,
			`to_date`,
			IF(`salary_amount` < @dummy_salary_amount AND
				@dummy_salary_amount != 0, 'lower than last', 'higher') AS comparison,
			@row_number := IF(`employee_id` != @dummy_employee_id, 1,
				@row_number + 1) AS '@row_number',
			@dummy_salary_amount := `salary_amount` AS '@dummy_salary_amount',
		@dummy_employee_id := `employee_id` AS '@dummy_employee_id'
		FROM (
			SELECT
				`id`,
				`employee_id`,
				`salary_amount`,
				`from_date`,
				`to_date`
			FROM `salary`
			WHERE `salary`.`employee_id` = 10004
			ORDER BY `salary`.`from_date` ASC
		) xTMP
) xTMP2
WHERE 1=1
AND comparison = 'lower than last'
GROUP BY
employee_id