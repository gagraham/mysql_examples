SELECT count(*) from sample_staff.user_login 
where login_dt < (NOW() - INTERVAL 30 MINUTE)
LIMIT 10;

SELECT count(*) from sample_staff.user_login;

SELECT user_id, login_dt, NOW() from user_login where login_dt < (NOW() - INTERVAL 75 MINUTE)
LIMIT 10;


DROP PROCEDURE IF EXISTS `DEL_USER_LOGIN_DATA`;

DELIMITER //

CREATE PROCEDURE `DEL_USER_LOGIN_DATA`()
	BEGIN
    DELETE FROM sample_staff.user_login 
    WHERE login_dt < (NOW() - INTERVAL 30 MINUTE);
    
    SELECT count(*) from sample_staff.user_login 
	WHERE login_dt < (NOW() - INTERVAL 30 MINUTE)
    
LIMIT 10;
		
END;
//
DELIMITER ;

CALL `DEL_USER_LOGIN_DATA`();