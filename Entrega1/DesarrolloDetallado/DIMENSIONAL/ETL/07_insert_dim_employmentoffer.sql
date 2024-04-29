DELETE FROM grad_dimensional.dim_employmentoffer;

INSERT INTO grad_dimensional.dim_employmentoffer(
id_employmentOffer,
companyName,
availableUntil,
contactEmail,
seekingKnowledgeArea,
seekingAcademic_lvl
)
SELECT 
idEmploymentOffer,
company_name,
available_until_date,
contact_email,
seeking_knowledge_area,
seeking_academic_lvl
FROM grad_db.employmentoffer