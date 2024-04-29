DELETE FROM grad_dimensional.fact_degreework_has_dim_graduate;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_degreework_has_dim_graduate (
fact_DegreeWork_idDegreeWork,
dim_graduate_idGraduate
)
select fdw.idDegreework, idGraduate
from grad_dimensional.fact_degreework as fdw 
join grad_db.degreework as dw on fdw.idDegreeWork = dw.idDegreeWork
join grad_db.graduate_has_program as ghp on dw.idGraduateHasProgram = ghp.idGraduateHasProgram;