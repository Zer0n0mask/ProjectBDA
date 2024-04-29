-- Group Association
DESCRIBE grad_db.groupassociation;
-- idGroupAssociation, type, name, knowledge_area
DESCRIBE grad_dimensional.dim_groupassociation;
-- idGroupAssociation, type, name, knowledgeArea

DELETE FROM grad_dimensional.dim_groupassociation;
INSERT INTO grad_dimensional.dim_groupassociation (idGroupAssociation, type, name, knowledgeArea)
SELECT * FROM grad_db.groupassociation
-- SELECT * FROM grad_dimensional.dim_groupassociation