USE grad_db;
USE grad_dimensional;

DELETE FROM grad_dimensional.fact_service;
ALTER TABLE grad_dimensional.fact_service AUTO_INCREMENT = 1;

INSERT INTO grad_dimensional.fact_service(
	idService,
	type,
	location,
	valueService_USD,
	description,
	knowledge_area,
	duration_days,
	idAdministrativedependency,
	idGroupAssociation,
	idDepartment,
	idEmploymentOffer,
	idStartDate)
SELECT 	s.idServicesToGraduates as idService,
		s.type, 
        s.location,
        IFNULL(s.value,0) as valueService_USD, 
        s.description,         
        s.knowledge_area, 
        DATEDIFF(s.final_date, s.start_date) AS duration_days,
        s.idAdministrativeDependency, 
		s.idGroupAssociation, 
        s.idDepartment, 
        eo.idEmploymentOffer, 
        d.idDate as idStartDate
FROM grad_db.ServicesToGraduates AS s
LEFT JOIN grad_db.EmploymentOffer AS eo ON eo.idServicesToGraduates = s.idServicesToGraduates
LEFT JOIN grad_dimensional.dim_date AS d ON d.date =  s.start_date
LEFT JOIN grad_dimensional.dim_date AS d2 ON d2.date =  s.final_date;

    