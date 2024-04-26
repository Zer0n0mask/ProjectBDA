-- company
DELETE FROM grad_dimensional.dim_company;
INSERT INTO grad_dimensional.dim_company (id_company, name, areaOfWork)
SELECT * FROM grad_db.company as cdb;
-- SELECT * FROM grad_dimensional.dim_company;
