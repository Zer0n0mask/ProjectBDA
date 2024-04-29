USE grad_db;
-- Delete existing records
DELETE FROM graduate_has_program;
ALTER TABLE graduate_has_program AUTO_INCREMENT = 1;


-- DELETE FROM TempGraduateHasProgram;
CREATE TEMPORARY TABLE IF NOT EXISTS TempGraduateHasProgram (
	idGraduate INT,
	idProgram INT
);
    
INSERT INTO TempGraduateHasProgram (idGraduate, idProgram)
SELECT g.idGraduate, p.idProgram
FROM Graduate AS g
CROSS JOIN Program AS p
ORDER BY RAND()
LIMIT 100;

-- select * from TempGraduateHasProgram;

-- loop
DROP PROCEDURE IF EXISTS cursor_ROWPERROW;
DELIMITER ;;

CREATE PROCEDURE cursor_ROWPERROW()
BEGIN
  DECLARE cursor_ID_grad INT;
  DECLARE cursor_ID_program INT;
  DECLARE init_date DATE;
  DECLARE year_diff INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT idGraduate,idProgram FROM TempGraduateHasProgram;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_ID_grad, cursor_ID_program;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SET init_date = DATE_ADD('2000-01-01', INTERVAL FLOOR(RAND() * DATEDIFF('2020-01-01', '2000-01-01')) DAY);
    SET year_diff = FLOOR(RAND() * (6)) + 4;
    INSERT INTO graduate_has_program(idGraduate, idProgram, start_date, end_date, academic_avg) 
		VALUES(cursor_ID_grad, cursor_ID_program, init_date, DATE_ADD(init_date, INTERVAL year_diff YEAR), ROUND(RAND()*5, 1));
  END LOOP;
  CLOSE cursor_i;
END;
;;

CALL cursor_ROWPERROW();

-- SELECT ROUND(RAND() * 5, 1); -- Rounds to 1 decimal place

-- select * from graduate_has_program;
-- select * from TempGraduateHasProgram;