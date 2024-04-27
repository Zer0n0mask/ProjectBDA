DELETE FROM grad_dimensional.fact_academicwork;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_academicwork (
type,
title,
knowledge_area,
description,
idProfessor,
idGroupAssociation,
idDate_publication,
idProgram
)

WITH temp AS(
	SELECT p.idPublication, p.journal, p.dateOfPublication, p.Knowledge_area, 
			r.idResearchWork, r.type, r.idProfessor, r.title, r.idGroupAssociation, r.idDegreeWork, r.defense_date
		FROM grad_db.researchwork AS r
		LEFT JOIN grad_db.publication AS p ON r.idResearchWork = p.idResearchWork
    )
SELECT 'Publication' AS fi_type, 
		COALESCE(t.title, 'Not specified') AS fi_title ,
        COALESCE(t.Knowledge_area, 'Not specified') AS fi_Knowledge_area,
        'Not specified' AS fi_description,
        t.idprofessor AS fi_professor ,
        t.idGroupAssociation AS fi_idGroupAssociation,
        COALESCE(d.idDate, NULL) AS fi_idDate_publication,
        NULL AS fi_idProgram        
    FROM grad_db.publication AS p
    LEFT JOIN temp AS t ON p.idPublication = t.idPublication
    JOIN grad_dimensional.dim_date AS d ON p.dateOfPublication = d.date

UNION ALL

SELECT 'ResearchWork' AS fi_type, 
		COALESCE(t.title, 'Not specified') AS fi_title ,
        COALESCE(t.Knowledge_area, 'Not specified') AS fi_Knowledge_area,
        'Not specified' AS fi_description,
        t.idprofessor AS fi_professor ,
        t.idGroupAssociation AS fi_idGroupAssociation,
        COALESCE(d2.idDate, NULL) AS fi_idDate_publication,
        NULL AS fi_idProgram
    FROM grad_db.researchwork AS r    
    LEFT JOIN temp AS t ON r.idResearchWork = t.idResearchWork
    LEFT JOIN grad_dimensional.dim_date AS d ON r.defense_date = d.date
    LEFT JOIN grad_dimensional.dim_date AS d2 ON t.dateOfPublication = d2.date
    
UNION ALL

SELECT 'DegreeWork' AS fi_type, 
		COALESCE(dw.title, 'Not specified') AS fi_title ,
        COALESCE(dw.knwolegde_area, 'Not specified') AS fi_Knowledge_area,
        COALESCE(dw.description, 'Not specified') AS fi_description,
        r.idprofessor AS fi_professor ,
        COALESCE(r.idGroupAssociation, NULL) AS fi_idGroupAssociation,
        NULL AS fi_idDate_publication,
        COALESCE(g.idProgram, NULL) AS fi_idProgram
	FROM grad_db.degreework AS dw
    LEFT JOIN grad_db.graduate_has_program AS g ON dw.idGraduateHasProgram = g.idGraduateHasProgram
    LEFT JOIN grad_db.researchwork AS r ON dw.idDegreeWork = r.idDegreeWork
    LEFT JOIN grad_dimensional.dim_date AS d ON dw.defense_date = d.date