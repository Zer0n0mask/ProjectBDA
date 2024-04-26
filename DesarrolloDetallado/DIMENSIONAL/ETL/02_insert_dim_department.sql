DELETE FROM grad_dimensional.dim_department;

INSERT INTO grad_dimensional.dim_department(
id_department,
name,
faculty)
SELECT idDepartment as id_department,
department_name as name,
f.faculty_name as faculty
	FROM grad_db.department AS d
    JOIN grad_db.faculty AS f ON d.idFaculty = f.idFaculty
