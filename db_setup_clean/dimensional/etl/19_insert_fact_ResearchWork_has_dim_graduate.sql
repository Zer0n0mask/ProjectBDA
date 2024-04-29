DELETE FROM grad_dimensional.fact_researchwork_has_dim_graduate;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_researchwork_has_dim_graduate (
fact_ResearchWork_idResearch,
dim_graduate_idGraduate
)
select frw.idResearch, idGraduate
from grad_dimensional.fact_researchwork as frw 
join grad_db.researchwork as rw on frw.idResearch = rw.idResearchWork
join grad_db.researchwork_has_graduate as rwhp on rwhp.idResearchWork = rw.idResearchWork;