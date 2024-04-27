-- ALTER TABLE Job
-- DROP PRIMARY KEY,
-- Si hay una restricción de clave primaria compuesta y solo deseas eliminar una columna específica,
-- debes especificar las columnas restantes en la restricción de clave primaria
-- ADD PRIMARY KEY (idJob);

-- show columns from Job;
-- select * from employmentoffer;
USE grad_db;
DELETE FROM Job;
ALTER TABLE Job AUTO_INCREMENT = 1;
INSERT INTO grad_db.Job (type, salary, start_date, final_date, work_area, position, location, idCompany, idGraduate, idEmploymentOffer)
VALUES
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Software Development', 'Software Engineer', 'City A', 1, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Entrepeneur', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, 'Finance', 'Financial Analyst', 'City B', 2, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Contractort', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, 'Technology', 'IT Consultant', 'City C', 3, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Law', 'Legal Assistant', 'City D', 4, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Unemployeed', NULL, DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, NULL, NULL, NULL, 5, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Consulting', 'Consultant', 'City E', 6, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Healthcare', 'Nurse', 'City F', 7, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Contractort', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, 'Research', 'Researcher', 'City G', 8, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Education', 'Teacher', 'City H', 9, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Entrepeneur', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, 'Engineering', 'Engineering Consultant', 'City I', 10, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Marketing', 'Marketing Manager', 'City J', 11, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Healthcare', 'Physician', 'City K', 12, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Contractort', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, 'Finance', 'Financial Advisor', 'City L', 13, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Technology', 'Software Developer', 'City M', 14, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Employeed', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 'Engineering', 'Engineer', 'City N', 15, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1)),
('Entrepeneur', ROUND(RAND() * 2000000 + 1000000), DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), NULL, 'Marketing', 'Entrepreneur', 'City O', 16, (SELECT idGraduate FROM Graduate ORDER BY RAND() LIMIT 1), (SELECT idEmploymentOffer FROM EmploymentOffer ORDER BY RAND() LIMIT 1));

-- select * from job;