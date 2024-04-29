DELETE FROM grad_dimensional.fact_publication_has_dim_graduate;

-- *******************************************************************
INSERT INTO grad_dimensional.fact_publication_has_dim_graduate (
fact_Publication_idPublication,
dim_graduate_idGraduate
)
select fp.idPublication,rwhp.idGraduate
from grad_dimensional.fact_publication as fp
join grad_db.publication as p on fp.idPublication = p.idPublication
join grad_db.researchwork_has_graduate as rwhp on p.idResearchWork = rwhp.idResearchWork;