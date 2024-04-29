DELETE FROM grad_dimensional.fact_researchwork;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_researchwork (
type,
title,
description,
knowledge_area,
UniqueIdentifier,
idGroupAssociation,
idDate_publication,
idProfessor
)

WITH temp AS(
	SELECT p.idPublication, p.journal, p.dateOfPublication, p.Knowledge_area, 
			r.idResearchWork, r.type, r.idProfessor, r.title, r.idGroupAssociation, r.idDegreeWork, r.defense_date
		FROM grad_db.researchwork AS r
		LEFT JOIN grad_db.publication AS p ON r.idResearchWork = p.idResearchWork
)
    
SELECT  r.type AS fi_type, 
		COALESCE(t.title, 'Not specified') AS fi_title ,
        'Not specified' AS fi_description,
        COALESCE(t.Knowledge_area, 'Not specified') AS fi_Knowledge_area,
        r.idResearchWork AS UniqueIdentifier,
        t.idGroupAssociation AS fi_idGroupAssociation,
        COALESCE(d2.idDate, NULL) AS idDate_publication,
        t.idprofessor AS fi_professor         
    FROM grad_db.researchwork AS r    
    LEFT JOIN temp AS t ON r.idResearchWork = t.idResearchWork
    LEFT JOIN grad_dimensional.dim_date AS d ON r.defense_date = d.date
    LEFT JOIN grad_dimensional.dim_date AS d2 ON t.dateOfPublication = d2.date