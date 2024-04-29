-- Dimension graduate
DELETE FROM grad_dimensional.dim_graduate;
INSERT INTO grad_dimensional.dim_graduate (idGraduate, docTipe, name, lastname, gender, ethnics, pbm, stratum, birthday, address, 
personal_EmailAddress, edu_EmailAddress, first_Phone, second_Phone)
SELECT g.idGraduate, g.docTipe, g.name, g.lastname, g.gender, g.ethnics, g.pbm, g.stratum, g.birthday,
		c2.address, c2.personal_EmailAddress, c2.edu_EmailAddress, c2.first_Phone, c2.second_Phone
        FROM (SELECT g.idGraduate, MAX(c.idContactInfo) AS last
	FROM grad_db.graduate AS g
	JOIN grad_db.contactinfo AS c ON g.idGraduate = c.idGraduate
	GROUP BY g.idGraduate) AS foundMax 
		JOIN grad_db.contactinfo AS c2 ON foundMax.last =c2.idContactInfo
        JOIN grad_db.graduate AS g ON foundMax.idGraduate=g.idGraduate; 