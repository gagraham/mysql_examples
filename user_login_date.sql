
SHOW 
CREATE PROCEDURE `INS_USER_LOGIN_DATA_GENERATOR`;

SELECT count(*) from sample_staff.user_login;

SHOW EVENTS;

SELECT user_id,login_dt,DATE(login_dt) from sample_staff.user_login LIMIT 10;

SELECT user_id,login_dt,NOW() from sample_staff.user_login 
where DATE(login_dt) < (NOW() - INTERVAL 10 MINUTE)
LIMIT 10;