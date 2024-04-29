DELETE FROM grad_dimensional.dim_graduate_has_fact_service;
ALTER TABLE grad_dimensional.dim_graduate_has_fact_service AUTO_INCREMENT = 1 ;

INSERT INTO grad_dimensional.dim_graduate_has_fact_service(dim_graduate_idGraduate, fact_service_idService)
SELECT g.idGraduate, g.idServicesToGraduates FROM grad_db.graduate_takes_servicestograduates AS g;


-- select * from grad_dimensional.fact_service;
-- select * from grad_db.servicestograduates;