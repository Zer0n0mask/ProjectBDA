-- Clear the Faculty table
DELETE FROM `grad_db`.`Faculty`;

-- Insert faculties covering different fields of science
INSERT INTO `grad_db`.`Faculty` (`idFaculty`, `faculty_name`, `idUniversity`)
VALUES
(1, 'Faculty of Medicine', 1), -- Harvard University
(2, 'Faculty of Engineering', 1),
(3, 'Faculty of Law', 1),
(4, 'Faculty of Arts and Sciences', 1),
(5, 'Faculty of Business Administration', 1),
(6, 'School of Engineering', 2), -- Stanford University
(7, 'School of Medicine', 2),
(8, 'School of Humanities and Sciences', 2),
(9, 'Graduate School of Education', 2),
(10, 'School of Earth, Energy & Environmental Sciences', 2),
(11, 'School of Engineering and Applied Sciences', 3), -- MIT
(12, 'School of Science', 3),
(13, 'School of Architecture and Planning', 3),
(14, 'School of Management', 3),
(15, 'School of Humanities, Arts, and Social Sciences', 3),
(16, 'Faculty of Law', 4), -- University of Oxford
(17, 'Faculty of Natural Sciences', 4),
(18, 'Faculty of Medicine', 4),
(19, 'Faculty of Social Sciences', 4),
(20, 'Faculty of Arts', 4),
(21, 'Faculty of Biology', 5), -- University of Cambridge
(22, 'Faculty of Physics and Astronomy', 5),
(23, 'Faculty of Mathematics', 5),
(24, 'Faculty of Chemistry', 5),
(25, 'Faculty of History', 5),
(26, 'Faculty of Engineering', 6), -- ETH Zurich
(27, 'Faculty of Mathematics and Natural Sciences', 6),
(28, 'Faculty of Humanities, Social, and Political Sciences', 6),
(29, 'Faculty of Computer Science', 6),
(30, 'Faculty of Architecture and Civil Engineering', 6),
(31, 'Faculty of Arts and Social Sciences', 7), -- National University of Singapore
(32, 'Faculty of Engineering', 7),
(33, 'Faculty of Science', 7),
(34, 'Yong Loo Lin School of Medicine', 7),
(35, 'School of Business', 7),
(36, 'Faculty of Arts and Science', 8), -- University of Toronto
(37, 'Faculty of Engineering', 8),
(38, 'Faculty of Medicine', 8),
(39, 'Faculty of Law', 8),
(40, 'Faculty of Applied Science and Engineering', 8),
(41, 'Faculty of Medicine', 9), -- University of Tokyo
(42, 'Faculty of Engineering', 9),
(43, 'Faculty of Law', 9),
(44, 'Faculty of Science', 9),
(45, 'Faculty of Agriculture', 9),
(46, 'Faculty of Science', 10), -- University of Melbourne
(47, 'Melbourne School of Engineering', 10),
(48, 'Faculty of Medicine, Dentistry, and Health Sciences', 10),
(49, 'Faculty of Arts', 10),
(50, 'Faculty of Business and Economics', 10),
(51, 'School of Physics', 11), -- Peking University
(52, 'School of Economics', 11),
(53, 'School of Information Science and Technology', 11),
(54, 'School of Life Sciences', 11),
(55, 'School of International Studies', 11),
(56, 'Faculty of Sciences', 12), -- Sorbonne University
(57, 'Faculty of Medicine', 12),
(58, 'Faculty of Law and Political Science', 12),
(59, 'Faculty of Arts and Humanities', 12),
(60, 'Faculty of Economic and Management Sciences', 12),
(61, 'Faculty of Biosciences', 13), -- Heidelberg University
(62, 'Faculty of Chemistry and Earth Sciences', 13),
(63, 'Faculty of Mathematics and Computer Science', 13),
(64, 'Faculty of Physics and Astronomy', 13),
(65, 'Faculty of Behavioral and Cultural Studies', 13),
(66, 'Faculty of Philosophy, Letters and Human Sciences', 14), -- University of São Paulo
(67, 'Faculty of Medicine', 14),
(68, 'Faculty of Economics, Administration and Accounting', 14),
(69, 'Faculty of Law', 14),
(70, 'Faculty of Education', 14),
(71, 'Faculty of Commerce', 15), -- University of Cape Town
(72, 'Faculty of Engineering & the Built Environment', 15),
(73, 'Faculty of Health Sciences', 15),
(74, 'Faculty of Law', 15),
(75, 'Faculty of Humanities', 15),
(76, 'Faculty of Science', 16), -- Universidad Nacional de Colombia (Bogota)
(77, 'Faculty of Engineering', 16),
(78, 'Faculty of Medicine', 16),
(79, 'Faculty of Social Sciences', 16),
(80, 'Faculty of Arts', 16),
(81, 'Faculty of Science', 17), -- Universidad Nacional de Colombia (Medellin)
(82, 'Faculty of Engineering', 17),
(83, 'Faculty of Medicine', 17),
(84, 'Faculty of Social Sciences', 17),
(85, 'Faculty of Arts', 17),
(86, 'Faculty of Science', 18), -- Universidad Nacional de Colombia (Manizales)
(87, 'Faculty of Engineering', 18),
(88, 'Faculty of Medicine', 18),
(89, 'Faculty of Social Sciences', 18),
(90, 'Faculty of Arts', 18),
(91, 'Faculty of Science', 19), -- Universidad Nacional de Colombia (Caribe)
(92, 'Faculty of Engineering', 19),
(93, 'Faculty of Medicine', 19),
(94, 'Faculty of Social Sciences', 19),
(95, 'Faculty of Arts', 19),
(96, 'Faculty of Science', 20), -- Universidad Nacional de Colombia (La Paz)
(97, 'Faculty of Engineering', 20),
(98, 'Faculty of Medicine', 20),
(99, 'Faculty of Social Sciences', 20),
(100, 'Faculty of Arts', 20);
