-- CREATE INDEX idx_archive_code  on sample_staff.contract (archive_code);
-- ALTER TABLE sample_staff.contract DROP INDEX idx_archive_code;

-- ALTER TABLE contract 
-- ADD INDEX idx_archive_code_sign_date ( archive_code ,sign_date );

SELECT `contract`.`archive_code`
FROM `contract` 
WHERE 1=1
 AND `contract`.`archive_code` = 'DA970'
 AND `contract`.`deleted_flag` = 0
 AND `contract`.`sign_date` >= '1990-01-01'
;
 
SELECT `contract`.`archive_code`
FROM `contract`
WHERE 1=1
 AND `contract`.`archive_code` = 'DA970'
 AND `contract`.`deleted_flag` = 0
 ;