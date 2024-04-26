DELETE FROM grad_dimensional.dim_administrativedependency;

INSERT INTO grad_dimensional.dim_administrativedependency(
id_administrativedependency,
name,
faculty_name,
university_name)

SELECT ad.idAdministrativeDependency, ad.AdministrativeDependency_name,
		u.university_name, 
        f.faculty_name		
FROM grad_db.administrativedependency AS ad
	JOIN grad_db.university AS u ON ad.idUniversity = u.idUniversity
    JOIN grad_db.faculty AS f ON ad.idFaculty = f.idFaculty;
    