USE grad_db;
DELETE FROM StudentSupport;

INSERT INTO grad_db.StudentSupport (isExternal, isMonetaryRetributed, type, Graduate_idGraduate, idAdministrativeDependency, idDepartment)
VALUES
(1, 1, 'SocioEconómico vivienda', 745207, 1, NULL),
(0, 1, 'Beca promedio', 297188, 2, NULL),
(1, 0, 'Estudiante auxiliar', 482750, 3, NULL),
(0, 0, 'Auxiliar docente', 245386, 4, NULL),
(1, 1, 'SocioEconómico transporte', 547657, 5, NULL),
(0, 1, 'Monitor', 898191, 6, NULL),
(1, 0, 'Estudiante auxiliar', 704363, 7, NULL),
(0, 0, 'Publicación de artículos académicos', 227399, 8, NULL),
(1, 1, 'SocioEconómico alimentación', 621100, 9, NULL),
(0, 1, 'Beca promedio', 832720, 10, NULL),
(1, 0, 'Estudiante auxiliar', 889093, 1, NULL),
(0, 0, 'Auxiliar docente', 591032, 2, NULL),
(1, 1, 'Movilidad saliente internacional', 496078, 3, NULL),
(0, 1, 'Monitor', 415037, 4, NULL),
(1, 0, 'SocioEconómico vivienda', 217804, 5, NULL);
