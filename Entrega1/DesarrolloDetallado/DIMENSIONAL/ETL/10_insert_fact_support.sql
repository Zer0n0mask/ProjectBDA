USE grad_db;
USE grad_dimensional;

DELETE FROM grad_dimensional.fact_studentsupport;
ALTER TABLE grad_dimensional.fact_studentsupport AUTO_INCREMENT = 1;

INSERT INTO grad_dimensional.fact_studentsupport(isExternal, isRetributed, type, idGraduate, idAdministrativedependency, idDepartment)
SELECT s.isExternal, s.isMonetaryRetributed, s.type, s.Graduate_idGraduate, s.idAdministrativeDependency, s.idDepartment FROM grad_db.studentsupport AS s;
