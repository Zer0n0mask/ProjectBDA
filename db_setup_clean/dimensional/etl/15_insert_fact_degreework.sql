DELETE FROM grad_dimensional.fact_degreework;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_degreework (
type,
title,
knowledge_area,
description,
avgAcademicHistory,
UniqueIdentifier,
idGroupAssociation,
idDate_defense,
idProgram,
idProfessor
)

SELECT 	dw.type AS fi_type, 
		COALESCE(dw.title, 'Not specified') AS fi_title ,
        COALESCE(dw.knowledge_area, 'Not specified') AS fi_Knowledge_area,
        COALESCE(dw.description, 'Not specified') AS fi_description, 
        COALESCE(g.academic_avg, 0) AS fi_avgAcademicHistory, -- , p.*, t.*, d.*
        dw.idDegreeWork AS UniqueIdentifier,
        COALESCE(r.idGroupAssociation, NULL) AS fi_idGroupAssociation,
        COALESCE(d.idDate, NULL) AS fi_idDate_defense,
        COALESCE(g.idProgram, NULL) AS fi_idProgram,      
        r.idprofessor AS fi_professor
    FROM grad_db.degreework AS dw
    LEFT JOIN grad_db.graduate_has_program AS g ON dw.idGraduateHasProgram = g.idGraduateHasProgram
    LEFT JOIN (SELECT 
					idDegreeWork, 
					idGroupAssociation,
                    idprofessor
				FROM grad_db.researchwork 
                WHERE 
					idDegreeWork IS NOT NULL 
					AND 
                    idGroupAssociation IS NOT NULL
				) AS r ON dw.idDegreeWork = r.idDegreeWork
    LEFT JOIN grad_dimensional.dim_date AS d ON dw.defense_date = d.date