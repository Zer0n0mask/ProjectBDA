-- Job fact 
DESCRIBE grad_dimensional.fact_job;
-- idJob, type, salary, work_area, position	location, idDate_start, idDate_end, idCompany, idGraduate, idEmploymentOffer
DESCRIBE grad_db.job;
-- idJob, type, salary, start_date, final_date, work_area, position, location, idCompany, idGraduate, idEmploymentOffer
DELETE FROM grad_dimensional.fact_job;

INSERT INTO grad_dimensional.fact_job (idJob, type, salary, work_area, position, location, idDate_start, idDate_end, idCompany, 
idGraduate, idEmploymentOffer)
SELECT idJob, type, salary, work_area, position, location, sd.idDate AS StartDateId, fd.idDate AS FinalDateId, idCompany, 
idGraduate, idEmploymentOffer
    FROM grad_db.job AS j
    JOIN grad_dimensional.dim_date AS sd ON sd.date = j.start_date 
    JOIN grad_dimensional.dim_date AS fd ON fd.date = j.final_date;