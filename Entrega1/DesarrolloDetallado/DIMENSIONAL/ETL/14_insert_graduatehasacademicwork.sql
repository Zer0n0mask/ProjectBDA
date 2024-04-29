USE grad_db;
USE grad_dimensional;

DELETE FROM grad_dimensional.dim_graduate_has_academicwork;
ALTER TABLE grad_dimensional.dim_graduate_has_academicwork AUTO_INCREMENT = 1 ;

INSERT INTO grad_dimensional.dim_graduate_has_academicwork(dim_graduate_idGraduate, academicWork_idResPubDeg)
SELECT gp.idGraduate, aw.idResPubDeg
FROM grad_dimensional.fact_academicwork AS aw
JOIN grad_db.degreework AS d ON aw.idDegreeWork = d.idDegreeWork
JOIN grad_db.graduate_has_program AS gp ON d.idGraduateHasProgram = gp.idGraduateHasProgram;

INSERT INTO grad_dimensional.dim_graduate_has_academicwork(dim_graduate_idGraduate, academicWork_idResPubDeg)
SELECT rg.idGraduate, aw.idResPubDeg
FROM grad_dimensional.fact_academicwork AS aw
JOIN grad_db.researchwork AS r ON aw.idResearchWork = r.idResearchWork
JOIN grad_db.researchwork_has_graduate AS rg ON rg.idResearchWork = r.idResearchWork;

