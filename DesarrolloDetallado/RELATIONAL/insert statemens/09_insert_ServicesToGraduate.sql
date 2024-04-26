-- DELETE FROM ServicesToGraduates;
INSERT INTO grad_db.ServicesToGraduates (type, description, knowledge_area, location, value, start_date, final_date, idAdministrativeDependency, idDepartment, idGroupAssociation)
VALUES
-- Harvard University Services
('Oferta de empleo', 'Oportunidad de empleo como ingeniero de software', 'Ingeniería de Software', 'Harvard University', 150000, '2024-05-10', '2024-05-20', 1, 1, 1),
('Curso', 'Curso avanzado de finanzas corporativas', 'Finanzas', 'Harvard Business School', 250, '2024-06-15', '2024-06-20', 2, 2, 2),
('Charla', 'Charla sobre inteligencia artificial y sus aplicaciones', 'Inteligencia Artificial', 'Harvard School of Engineering and Applied Sciences', NULL, '2024-07-20', NULL, 3, 3, 3),
('Préstamo de material bibliográfico', 'Préstamo de libros de derecho constitucional', 'Derecho', 'Harvard Law School', NULL, '2024-08-25', NULL, 4, 4, 4),
('Bases de datos', 'Acceso a bases de datos científicas', 'Ciencia de Datos', 'Harvard Department of Physics', NULL, '2024-09-30', NULL, 5, 5, 5),

-- Stanford University Services
('Curso', 'Curso intensivo de programación en Python', 'Programación', 'Stanford School of Engineering', 120000, '2024-05-12', '2024-05-15', 6, 6, 6),
('Charla', 'Charla sobre medicina personalizada', 'Medicina', 'Stanford School of Medicine', NULL, '2024-06-18', NULL, 7, 7, 7),
('Préstamo de material bibliográfico', 'Préstamo de libros de filosofía', 'Filosofía', 'Stanford Department of Philosophy', NULL, '2024-07-22', NULL, 8, 8, 8),
('Bases de datos', 'Acceso a bases de datos de educación', 'Educación', 'Stanford Graduate School of Education', NULL, '2024-08-28', NULL, 9, 9, 9),
('Oferta de empleo', 'Oportunidad de empleo como cirujano', 'Medicina', 'Stanford Department of Surgery', 80000, '2024-09-25', '2024-10-25', 10, 10, 10),

-- MIT Services
('Charla', 'Charla sobre energías renovables', 'Energías Renovables', 'MIT Department of Mechanical Engineering', NULL, '2024-05-15', NULL, 1, 11, 1),
('Préstamo de material bibliográfico', 'Préstamo de libros de química orgánica', 'Química', 'MIT Department of Chemistry', NULL, '2024-06-20', NULL, 2, 12, 2),
('Bases de datos', 'Acceso a bases de datos de planificación urbana', 'Planificación Urbana', 'MIT Department of Urban Studies and Planning', NULL, '2024-07-25', NULL, 3, 13, 3),
('Oferta de empleo', 'Oportunidad de empleo como consultor de gestión', 'Gestión', 'MIT Sloan School of Management', 60000, '2024-08-30', '2024-09-30', 4, 14, 4),
('Curso', 'Curso de lingüística computacional', 'Lingüística', 'MIT Department of Linguistics and Philosophy', 300, '2024-09-28', '2024-10-05', 5, 15, 5),

-- University of Oxford Services
('Charla', 'Charla sobre derecho internacional', 'Derecho Internacional', 'University of Oxford Faculty of Law', NULL, '2024-05-18', NULL, 6, 16, 6),
('Préstamo de material bibliográfico', 'Préstamo de libros de biología', 'Biología', 'University of Oxford Department of Zoology', NULL, '2024-06-22', NULL, 7, 17, 7),
('Bases de datos', 'Acceso a bases de datos de psiquiatría', 'Psiquiatría', 'University of Oxford Department of Psychiatry', NULL, '2024-07-27', NULL, 8, 18, 8),
('Oferta de empleo', 'Oportunidad de empleo como economista', 'Economía', 'University of Oxford Department of Economics', 55000, '2024-08-31', '2024-09-30', 9, 19, 9),
('Curso', 'Curso de literatura inglesa', 'Literatura Inglesa', 'University of Oxford Faculty of English Language and Literature', 200, '2024-09-29', '2024-10-03', 10, 20, 10),

-- Additional Services
('Curso', 'Curso de genética avanzada', 'Genética', 'University of Cambridge Department of Genetics', 300, '2024-05-20', '2024-05-30', 1, 21, 1),
('Charla', 'Charla sobre el universo y la astrofísica', 'Astrofísica', 'University of Cambridge Institute of Astronomy', NULL, '2024-06-25', NULL, 2, 22, 2),
('Préstamo de material bibliográfico', 'Préstamo de libros de matemáticas aplicadas', 'Matemáticas', 'University of Cambridge Department of Applied Mathematics and Theoretical Physics', NULL, '2024-07-30', NULL, 3, 23, 3);
