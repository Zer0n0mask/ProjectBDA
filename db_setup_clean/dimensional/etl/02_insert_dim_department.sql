DELETE FROM grad_dimensional.dim_department;

INSERT INTO grad_dimensional.dim_department(
idDepartment,
department_name,
faculty_name, 
campus_name, 
university_name, 
country)

SELECT d.iddepartment as idDepartment, d.department_name, f.faculty_name, u.campus_name,  u.university_name, u.country
FROM grad_db.Department AS d 
JOIN grad_db.faculty AS f ON f.idFaculty = d.idFaculty
JOIN grad_db.university AS u ON u.idUniversity = f.idUniversity;