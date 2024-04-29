USE grad_db;
USE grad_dimensional;

DELETE FROM grad_dimensional.dim_program;
ALTER TABLE grad_dimensional.dim_program AUTO_INCREMENT = 1;

INSERT INTO grad_dimensional.dim_program(academic_lvl, program_name, programDuration, university_name, faculty_name, department_name, campus_name, country)
SELECT p.academic_lvl, p.program_name, p.duration, u.university_name, f.faculty_name, d.department_name, u.campus_name, u.country
FROM grad_db.Program AS p
JOIN grad_db.Department AS d ON d.idDepartment = p.idDepartment
JOIN grad_db.faculty AS f ON f.idFaculty = d.idFaculty
JOIN grad_db.university AS u ON u.idUniversity = f.idUniversity;
