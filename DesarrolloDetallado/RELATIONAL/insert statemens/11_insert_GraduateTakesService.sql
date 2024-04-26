-- ALTER TABLE Graduate_takes_ServicesToGraduates
-- DROP PRIMARY KEY;
-- Delete existing records

USE grad_db;
DELETE FROM grad_db.Graduate_takes_ServicesToGraduates;

-- DELETE FROM TempGraduateTakesServices;
CREATE TEMPORARY TABLE IF NOT EXISTS TempGraduateTakesServices (
	idGraduate INT,
	idServicesToGraduates INT
);
    
INSERT INTO TempGraduateTakesServices (idGraduate, idServicesToGraduates)
SELECT g.idGraduate, s.idServicesToGraduates
FROM Graduate AS g
CROSS JOIN ServicesToGraduates AS s
ORDER BY RAND()
LIMIT 15;


-- loop
DROP PROCEDURE IF EXISTS cursor_ROWPERROW;
DELIMITER ;;

CREATE PROCEDURE cursor_ROWPERROW()
BEGIN
  DECLARE cursor_ID_grad INT;
  DECLARE cursor_ID_service INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT idGraduate,idServicesToGraduates FROM TempGraduateTakesServices;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_ID_grad, cursor_ID_service;
    IF done THEN
      LEAVE read_loop;
    END IF;
    INSERT INTO grad_db.Graduate_takes_ServicesToGraduates(idGraduate, idServicesToGraduates, taken_service_date) 
		VALUES(cursor_ID_grad, cursor_ID_service, DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * DATEDIFF('2024-01-01', '2022-01-01')) DAY) );
  END LOOP;
  CLOSE cursor_i;
END;
;;

CALL cursor_ROWPERROW();


select * from graduate_takes_servicestograduates;
select * from TempGraduateTakesServices;