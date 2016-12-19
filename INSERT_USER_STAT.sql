/* Create a new procedure INS_USER_STAT to aggregate stats about user logins. 
The procedure should have 1 input parameter: user_id.

Save the following data to sample_staff.user_stat:

user_id
login_date
login_hour
login_count */

DROP PROCEDURE IF EXISTS INS_USER_STAT;

DELIMITER //

CREATE PROCEDURE INS_USER_STAT (IN i_user_id INT)



BEGIN
	
INSERT  INTO sample_staff.user_stat(user_id, date, hour,login_count,insert_dt )
	
    SELECT tmp1.user_id,tmp1.login_date,tmp1.login_hour, login_count, NOW() 
    FROM
    (
		SELECT user_id, 
        DATE(login_dt) as login_date, 
        HOUR(login_dt) as login_hour , 
        count(*) as login_count
        
		FROM sample_staff.user_login
		WHERE user_id = i_user_id 
		GROUP BY user_id, login_date, login_hour
    ) tmp1;
    
END //

DELIMITER ;
		
        
        CALL  INS_USER_STAT(65);