DROP PROCEDURE IF EXISTS INS_USER_STAT;

DELIMITER //

CREATE PROCEDURE INS_USER_STAT (IN i_user_id INT)



BEGIN
	
INSERT  INTO sample_staff.user_stat(user_id, date, hour,login_count,insert_dt,insert_process_code )
	
    SELECT tmp1.user_id,tmp1.login_date,tmp1.login_hour, login_count, NOW(),
    'INS_USER_STAT' as insert_process_code
    FROM
    (
		SELECT user_id, 
        DATE(login_dt) as login_date, 
        HOUR(login_dt) as login_hour , 
        count(*) as login_count
        
		FROM sample_staff.user_login
		WHERE user_id = i_user_id 
		GROUP BY user_id, login_date, login_hour
    ) tmp1
    ON DUPLICATE KEY UPDATE
    user_stat.login_count=tmp1.login_count,
    user_stat.update_process_code = CASE
    WHEN user_stat.login_count != tmp1.login_count
    THEN 'INS_USER_STAT'
    ELSE user_stat.update_process_code
    END,
    user_stat.update_dt = CASE
    WHEN user_stat.login_count != tmp1.login_count
    THEN NOW()
    ELSE user_stat.update_dt
    END;
    
END //

DELIMITER ;
 
  
        CALL  INS_USER_STAT(65);
		