-- Delete existing records
-- DELETE FROM EmploymentOffer;
-- select * from servicestograduates;
-- Insert new records
INSERT INTO grad_db.EmploymentOffer (idServicesToGraduates, company_name, available_until_date, contact_email, seeking_knowledge_area, seeking_academic_lvl)
VALUES
(1, 'ABC Tech', '2024-06-30', 'hr@abc.com', 'Software Engineering', 'Graduate'),
(2, 'Finance Corp', '2024-07-15', 'jobs@financecorp.com', 'Finance', 'Doctorate'),
(3, 'AI Innovations', '2024-08-10', 'info@aiinnovations.com', 'Artificial Intelligence', 'Graduate'),
(4, 'Constitutional Law Firm', '2024-08-25', 'recruitment@lawfirm.com', 'Law', NULL),
(5, 'Data Analytics Inc.', '2024-09-20', 'careers@datainc.com', 'Data Science', 'Graduate'),
(6, 'Python Solutions', '2024-10-05', 'info@pythonsolutions.com', 'Software Development', 'Undergraduate'),
(7, 'Precision Medicine Labs', '2024-10-20', 'hr@precisionlabs.com', 'Medicine', 'Doctorate'),
(8, 'Philosophy Forum', '2024-11-15', 'philosophy@forum.com', 'Philosophy', 'Graduate'),
(9, 'Education Analytics', '2024-12-10', 'info@educationanalytics.com', 'Education', 'Graduate'),
(10, 'Surgical Specialists', '2025-01-05', 'careers@surgicalspecialists.com', 'Medicine', 'Graduate'),
(11, 'Renewable Solutions Ltd.', '2025-02-01', 'info@renewablesolutions.com', 'Renewable Energy', 'Undergraduate'),
(12, 'Chemical Research Institute', '2025-02-28', 'research@chemicalinstitute.com', 'Chemistry', NULL),
(13, 'Urban Planning Associates', '2025-03-15', 'jobs@urbanplanning.com', 'Urban Planning', 'Graduate'),
(14, 'Management Consultancy Group', '2025-04-10', 'careers@managementgroup.com', 'Management', 'Doctorate'),
(15, 'Language Technology Solutions', '2025-05-05', 'info@languagetech.com', 'Linguistics', 'Graduate');
