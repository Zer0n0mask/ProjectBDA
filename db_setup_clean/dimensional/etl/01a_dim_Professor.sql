DELETE FROM grad_dimensional.dim_professor;
-- *******************************************************************
INSERT INTO grad_dimensional.dim_professor (
	idprofessor,
	Name,
	LastName
)
SELECT * FROM grad_db.professor