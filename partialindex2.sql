SELECT *
FROM `sample_ip`.`ip_address_varchar20`  

/*IGNORE INDEX(`idx_ip_address_3chars`,`idx_ip_address_7chars`) */

USE INDEX()
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
; 
-- Execution time: 4 seconds

SELECT *
FROM `sample_ip`.`ip_address_varchar20` USE INDEX (`idx_ip_address_3chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
; 
-- Execution time: 40ms

SELECT *
FROM `sample_ip`.`ip_address_varchar20` USE INDEX (`idx_ip_address_7chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
; 

SELECT *
FROM `sample_ip`.`ip_address_varchar20` USE INDEX (`idx_ip_address_all_chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
; 