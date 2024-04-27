use grad_db;
-- Clear the University table
DELETE FROM `grad_db`.`University`;

-- Insert 15 entries with realistic names for universities
INSERT INTO `grad_db`.`University` (`idUniversity`, `university_name`, `campus_name`, `country`)
VALUES
(1, 'Harvard University', 'Main Campus', 'USA'),
(2, 'Stanford University', 'Main Campus', 'USA'),
(3, 'Massachusetts Institute of Technology', 'Main Campus', 'USA'),
(4, 'University of Oxford', 'Main Campus', 'UK'),
(5, 'University of Cambridge', 'Main Campus', 'UK'),
(6, 'ETH Zurich - Swiss Federal Institute of Technology', 'Main Campus', 'Switzerland'),
(7, 'National University of Singapore', 'Main Campus', 'Singapore'),
(8, 'University of Toronto', 'Main Campus', 'Canada'),
(9, 'University of Tokyo', 'Main Campus', 'Japan'),
(10, 'University of Melbourne', 'Main Campus', 'Australia'),
(11, 'Peking University', 'Main Campus', 'China'),
(12, 'Sorbonne University', 'Main Campus', 'France'),
(13, 'Heidelberg University', 'Main Campus', 'Germany'),
(14, 'University of São Paulo', 'Main Campus', 'Brazil'),
(15, 'University of Cape Town', 'Main Campus', 'South Africa'),
(16, 'Universidad Nacional de Colombia', 'Bogota', 'Colombia'),
(17, 'Universidad Nacional de Colombia', 'Medellin', 'Colombia'),
(18, 'Universidad Nacional de Colombia', 'Manizales', 'Colombia'),
(19, 'Universidad Nacional de Colombia', 'Caribe', 'Colombia'),
(20, 'Universidad Nacional de Colombia', 'La Paz', 'Colombia');
