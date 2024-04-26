USE grad_db;
USE grad_dimensional;

DELETE FROM grad_dimensional.fact_service;
ALTER TABLE grad_dimensional.fact_service AUTO_INCREMENT = 1;

INSERT INTO grad_dimensional.fact_service(type, description, knowledge_area, location, valueService, idAdministrativedependency, idGroupAssociation, idDepartment, idEmploymentOffer, idStartDate, duration_days)
SELECT s.type, s.description, s.knowledge_area, s.location, s.value, s.idAdministrativeDependency, 
	s.idGroupAssociation, s.idDepartment, eo.idEmploymentOffer, d.idDate, d2.idDate
FROM grad_db.ServicesToGraduates AS s
LEFT JOIN grad_db.EmploymentOffer AS eo ON eo.idServicesToGraduates = s.idServicesToGraduates
LEFT JOIN grad_dimensional.dim_date AS d ON d.date =  s.start_date
LEFT JOIN grad_dimensional.dim_date AS d2 ON d2.date =  s.final_date;
