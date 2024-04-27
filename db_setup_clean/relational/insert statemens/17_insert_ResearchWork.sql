USE grad_db;

-- Delete existing records from ResearchWork table
DELETE FROM ResearchWork;

-- Reset the auto-increment value for the idResearchWork column
ALTER TABLE ResearchWork AUTO_INCREMENT = 1;

-- Inserting records into ResearchWork table
INSERT INTO ResearchWork (type, idProfessor, title, idGroupAssociation, idDegreeWork, defense_date)
VALUES
    ('Article', 1, 'Exploring the Impact of Climate Change on Biodiversity', 1, NULL, '2023-07-10'),
    ('Article', 2, 'The Role of Artificial Intelligence in Healthcare', 2, NULL, '2023-07-15'),
    ('Article', 3, 'Advancements in Renewable Energy Technologies', 3, NULL, '2023-07-20'),
    ('Article', 4, 'Urban Resilience Strategies for Climate Adaptation', 4, NULL, '2023-07-25'),
    ('Article', 5, 'Exploring Sustainable Agriculture Practices', 5, NULL, '2023-07-30'),
    ('Presentation', 6, 'Innovations in Biomedical Engineering', NULL, NULL, '2023-08-05'),
    ('Presentation', 7, 'Data-driven Decision Making in Business', NULL, NULL, '2023-08-10'),
    ('Presentation', 8, 'Smart Cities: Urban Innovations for the Future', NULL, NULL, '2023-08-15'),
    ('Presentation', 9, 'Cybersecurity Challenges in the Digital Age', NULL, NULL, '2023-08-20'),
    ('Presentation', 10, 'The Future of Work: Trends and Transformations', NULL, NULL, '2023-08-25'),
    ('Other', NULL, 'Research Proposal: Investigating Quantum Computing Applications', NULL, 1, '2023-09-01'),
    ('Other', NULL, 'Literature Review: Emerging Trends in Machine Learning', NULL, 2, '2023-09-05'),
    ('Other', NULL, 'Case Study Analysis: Sustainable Urban Development Projects', NULL, 3, '2023-09-10'),
    ('Other', NULL, 'Policy Brief: Addressing Global Health Challenges', NULL, 4, '2023-09-15'),
    ('Other', NULL, 'Experimental Study: Evaluating the Efficacy of Novel Drug Formulations', NULL, 5, '2023-09-20');
