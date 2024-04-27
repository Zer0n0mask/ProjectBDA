USE grad_db;
USE grad_dimensional;

DELETE FROM grad_dimensional.fact_studentsupport;
ALTER TABLE grad_dimensional.fact_studentsupport AUTO_INCREMENT = 1;

INSERT INTO grad_dimensional.fact_studentsupport(
	idStudentSupport,
	Founding_Source,
	Payment_Class,
	type,
	idGraduate,
	idAdministrativedependency,
	idDepartment)
SELECT 
	s.idStudentSupport, 
    CASE
		WHEN s.isExternal = 1 THEN "External"
        ELSE "Internal"
	END AS Founding_Source,
    CASE
		WHEN s.isMonetaryRetributed = 1 THEN "Monetary"
        ELSE "Services"
	END AS Payment_Class,
	s.type, 
	s.Graduate_idGraduate, 
	s.idAdministrativeDependency, 
	s.idDepartment 
FROM grad_db.studentsupport AS s;
