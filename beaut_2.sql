/*Create a new view v_user_login which will select user's recent logins. Attributes to select:

* user_login.id
* user_login.user_id
* user.name
* user_login.ip_address* user_login.ip_address  /* show in a standard notation xxx.xxx.xxx.xxx */ 
/*---* user_login.login_dt */

CREATE VIEW v_user_login  AS
	SELECT
		user_login.id as user_login_id ,
        user_login.user_id,
        user.name,
        user_login.ip_address,
        user_login.login_dt
	FROM sample_staff.user 
    
		INNER JOIN sample_staff.user_login ON 1=1 
			AND user_login.user_id  = user.id 
            AND user_login.login_dt = current_timestamp()
            ;
            
		