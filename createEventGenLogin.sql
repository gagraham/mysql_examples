DROP EVENT IF EXISTS `sample_staff`.`ev_generate_login_data`;

DELIMITER //

CREATE EVENT `sample_staff`.`ev_generate_login_data`
	ON SCHEDULE EVERY 30 SECOND
	STARTS NOW()
	ENDS NOW() + INTERVAL 10 MINUTE
	COMMENT 'Randomly generate data to sample_staff.user_login table.'
    
    
	DO CALL `INS_USER_LOGIN_DATA_GENERATOR`()

;
//
DELIMITER ;
