DROP PROCEDURE IF EXISTS `INS_USER_LOGIN_DATA_GENERATOR`;

DELIMITER //

CREATE PROCEDURE `INS_USER_LOGIN_DATA_GENERATOR`()
	BEGIN
		DECLARE p_ip_address VARCHAR(20);
		DECLARE p_user_id INT;
		DECLARE p_loop_counter INT DEFAULT 10;
        
	WHILE p_loop_counter > 0 DO
		INSERT INTO `sample_staff`.`user_login`
				(`user_id`, `login_dt`, `ip_address`, `insert_dt`,
				`insert_process_code`)
		SELECT
			`user`.`id` AS user_id,
			NOW() AS login_dt,
			INET_ATON(`ip_address_varchar20`.`ip_address`) AS ip_address,
			NOW(),
			'INS_USER_LOGIN_DATA_GENERATOR' AS insert_process_code
		FROM `sample_staff`.`user`
        
		INNER JOIN `sample_ip`.`ip_address_varchar20` ON 1=1
			AND `sample_ip`.`ip_address_varchar20`.`id` < 100
            
		ORDER BY RAND()
		LIMIT 1000
		;
	SET p_loop_counter = p_loop_counter - 1;
	END WHILE;
END;
//
DELIMITER ;

CALL `INS_USER_LOGIN_DATA_GENERATOR`();