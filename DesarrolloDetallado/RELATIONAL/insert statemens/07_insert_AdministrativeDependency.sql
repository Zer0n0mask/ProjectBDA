DELETE FROM grad_db.AdministrativeDependency;

INSERT INTO grad_db.AdministrativeDependency (AdministrativeDependency_name, idUniversity, idFaculty)
VALUES
    ('Student Affairs Office', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Academic Services Center', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Research and Innovation Department', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Career Development Office', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('International Programs Office', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Student Housing Department', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Financial Aid Office', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Health and Wellness Center', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Diversity and Inclusion Office', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1),
    ('Alumni Relations Department', FLOOR(RAND() * 20) + 1, FLOOR(RAND() * 100) + 1);
