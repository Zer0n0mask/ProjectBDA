
DELETE FROM grad_dimensional.fact_job;

INSERT INTO grad_dimensional.fact_job (
    idJob, 
	type, 
    salary, 
    work_area, 
    position, 
    location, 
    idDate_start, 
    tenure_months, 
    idCompany, 
	idGraduate, 
	idEmploymentOffer)
SELECT 
	idJob, 
    type, 
    salary, 
    work_area, 
    position, 
    location, 
    sd.idDate AS StartDateId, 
    FLOOR(DATEDIFF(j.final_date, j.start_date) / 30) AS tenure_months, 
    idCompany, 
	idGraduate, 
    idEmploymentOffer
    
    FROM grad_db.job AS j
    JOIN grad_dimensional.dim_date AS sd ON sd.date = j.start_date 
    JOIN grad_dimensional.dim_date AS fd ON fd.date = j.final_date;