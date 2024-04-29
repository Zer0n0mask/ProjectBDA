DELETE FROM grad_dimensional.fact_publication;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_publication (
title,
knowledge_area,
description,
idGroupAssociation,
idDate_publication
)

WITH temp AS(
	SELECT p.idPublication, p.journal, p.dateOfPublication, p.Knowledge_area, 
			r.idResearchWork, r.type, r.idProfessor, r.title, r.idGroupAssociation, r.idDegreeWork, r.defense_date
		FROM grad_db.researchwork AS r
		LEFT JOIN grad_db.publication AS p ON r.idResearchWork = p.idResearchWork
    )
SELECT 
		COALESCE(t.title, 'Not specified') AS fi_title ,
        COALESCE(t.Knowledge_area, 'Not specified') AS fi_Knowledge_area,
        'Not specified' AS fi_description,
        t.idGroupAssociation AS fi_idGroupAssociation,
        COALESCE(d.idDate, NULL) AS fi_idDate_publication
    FROM grad_db.publication AS p
    LEFT JOIN temp AS t ON p.idPublication = t.idPublication
    JOIN grad_dimensional.dim_date AS d ON p.dateOfPublication = d.date