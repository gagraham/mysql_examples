-- always drop the procedure first
DROP PROCEDURE IF EXISTS `SAVE_ALL_USER_LOGIN_STAT`;
DELIMITER //
CREATE PROCEDURE `SAVE_ALL_USER_LOGIN_STAT`()
BEGIN
DECLARE v_finished TINYINT;
DECLARE user_id INT DEFAULT 0;
DECLARE all_users_cursor CURSOR FOR
	SELECT `user`.`id` AS user_id
	FROM `sample_staff`.`user`
	WHERE 1=1
	AND user.deleted_flag = 0
;
DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET v_finished  = TRUE;
	OPEN all_users_cursor;
user_loop: LOOP
	FETCH all_users_cursor INTO user_id;
	IF v_finished  THEN
		LEAVE user_loop;
	END IF;
CALL INS_USER_STAT(user_id);
END LOOP user_loop;
CLOSE all_users_cursor;
SELECT count(*) from sample_staff.user_stat where date(insert_dt) = DATE(NOW());
END//
DELIMITER ;

CALL SAVE_ALL_USER_LOGIN_STAT;

SELECT count(*) from sample_staff.user_stat where date(insert_dt) = DATE(NOW());
