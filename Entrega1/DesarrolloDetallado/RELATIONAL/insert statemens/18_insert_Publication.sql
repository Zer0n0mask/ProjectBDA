USE grad_db;
-- Inserting records into Publication table
DELETE FROM grad_db.Publication;
INSERT INTO grad_db.Publication (journal, dateOfPublication, Knowledge_area, idResearchWork)
VALUES
    ('Journal of Environmental Science', '2023-06-15', 'Environmental Science', 1),
    ('International Journal of Medicine', '2023-07-01', 'Medicine', 2),
    ('Journal of Renewable Energy', '2023-07-10', 'Renewable Energy', 3),
    ('Urban Studies Journal', '2023-07-20', 'Urban Planning', 4),
    ('Agricultural Research Journal', '2023-08-05', 'Agriculture', NULL ),
    ('IEEE Transactions on Biomedical Engineering', '2023-08-15', 'Biomedical Engineering', NULL ),
    ('Harvard Business Review', '2023-09-01', 'Business', NULL),
    ('Journal of Cybersecurity', '2023-09-10', 'Cybersecurity', 8),
    ('International Journal of Workforce Management', '2023-09-20', 'Human Resources', 9),
    ('Nature Communications', '2023-10-01', 'Interdisciplinary Science', 10);
