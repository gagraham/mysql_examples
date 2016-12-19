INSERT INTO event_logger(id,event_name,counter,insert_dt)
VALUES(NULL,'Test event','0',NOW());

DROP EVENT IF EXISTS `sample_staff`.`ev_test_event_counter`;

DELIMITER //

CREATE EVENT `sample_staff`.`ev_test_event_counter`
	ON SCHEDULE EVERY 1 SECOND
    STARTS NOW()
    ENDS NOW() + INTERVAL 1 minute
    DO
		BEGIN
			UPDATE `event_logger`
            SET counter = counter + 1
            WHERE event_name = 'Test event'
            ;
		END
//

DELIMITER ;

SHOW EVENTS;
SHOW VARIABLES LIKE 'event_scheduler';
SET GLOBAL EVENT_SCHEDULER = 1;


