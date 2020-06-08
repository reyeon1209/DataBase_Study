use exec;
delimiter //
CREATE PROCEDURE caseProc(
   IN uName VARCHAR(10)
)
BEGIN
	DECLARE bYear INTEGER;
    DECLARE tti VARCHAR(3);
   
   SELECT birthYear INTO bYear FROM userTbl WHERE userName = uName;
   
    CASE 
        WHEN (bYear % 12 = 0) THEN SET tti = '원숭이';
        WHEN (bYear % 12 = 1) THEN SET tti = '닭';
        WHEN (bYear % 12 = 2) THEN SET tti = '개';
        WHEN (bYear % 12 = 3) THEN SET tti = '돼지';
        WHEN (bYear % 12 = 4) THEN SET tti = '쥐';
        WHEN (bYear % 12 = 5) THEN SET tti = '소';
        WHEN (bYear % 12 = 6) THEN SET tti = '호랑이';
        WHEN (bYear % 12 = 7) THEN SET tti = '토끼';
        WHEN (bYear % 12 = 8) THEN SET tti = '용';
        WHEN (bYear % 12 = 9) THEN SET tti = '뱀';
        WHEN (bYear % 12 = 10) THEN SET tti = '말';
        ELSE SET tti = '양';
    END CASE;

	SELECT CONCAT(uName, '의 띠 ==>', tti);
END //
delimiter ;

CALL caseProc('박수홍');
