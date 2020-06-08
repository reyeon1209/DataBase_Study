delimiter //
CREATE FUNCTION getAgeFunc(birthYear INTEGER)
	RETURNS INTEGER
BEGIN
	DECLARE age INTEGER;
    SET age = YEAR(CURDATE()) - birthYear;
    RETURN age;
END //
delimiter ;
    
SELECT userID, name, getAgeFunc(birthYear) AS '만 나이' FROM userTbl;

SHOW CREATE FUNCTION getAgeFunc;