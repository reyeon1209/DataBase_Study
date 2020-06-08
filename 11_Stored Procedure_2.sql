delimiter //
CREATE PROCEDURE cursorProc2()
BEGIN
	DECLARE userHeight INTEGER;
    DECLARE cnt INT DEFAULT 0;
    DECLARE totalHeight INT DEFAULT 0;
    
    DECLARE endofrow BOOLEAN DEFAULT FALSE;
    
    DECLARE userCuror CURSOR FOR SELECT height FROM usertbl;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET endofrow = TRUE;
    
    OPEN userCuror;
    
    cursor_loop: LOOP
		FETCH userCuror INTO userHeight;
    
		IF endofrow THEN LEAVE cursor_loop;
		END IF;
		
		SET cnt = cnt + 1;
		SET totalHeight = totalHeight + userHeight;
    END LOOP cursor_loop;
    
    SELECT CONCAT('고객 키의 평균 ==>', (totalHeight/cnt));
    
    CLOSE userCuror;
END //
delimiter ;
    
CALL cursorProc2();