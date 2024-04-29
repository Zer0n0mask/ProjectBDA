-- Clear the Department table
DELETE FROM `grad_db`.`Department`;

-- Insert at least one department per each faculty
INSERT INTO `grad_db`.`Department` (`idDepartment`, `department_name`, `idFaculty`)
VALUES
(1, 'Department of Medicine', 1), -- Harvard University, Faculty of Medicine
(2, 'Department of Engineering', 2), -- Harvard University, Faculty of Engineering
(3, 'Department of Law', 3), -- Harvard University, Faculty of Law
(4, 'Department of Physics', 4), -- Harvard University, Faculty of Arts and Sciences
(5, 'Department of Finance', 5), -- Harvard University, Faculty of Business Administration
(6, 'Department of Electrical Engineering', 6), -- Stanford University, School of Engineering
(7, 'Department of Surgery', 7), -- Stanford University, School of Medicine
(8, 'Department of Philosophy', 8), -- Stanford University, School of Humanities and Sciences
(9, 'Department of Education', 9), -- Stanford University, Graduate School of Education
(10, 'Department of Geology', 10), -- Stanford University, School of Earth, Energy & Environmental Sciences
(11, 'Department of Mechanical Engineering', 11), -- MIT, School of Engineering and Applied Sciences
(12, 'Department of Chemistry', 12), -- MIT, School of Science
(13, 'Department of Urban Planning', 13), -- MIT, School of Architecture and Planning
(14, 'Department of Management', 14), -- MIT, School of Management
(15, 'Department of Linguistics', 15), -- MIT, School of Humanities, Arts, and Social Sciences
(16, 'Department of International Law', 16), -- University of Oxford, Faculty of Law
(17, 'Department of Biology', 17), -- University of Oxford, Faculty of Natural Sciences
(18, 'Department of Psychiatry', 18), -- University of Oxford, Faculty of Medicine
(19, 'Department of Economics', 19), -- University of Oxford, Faculty of Social Sciences
(20, 'Department of Literature', 20), -- University of Oxford, Faculty of Arts
(21, 'Department of Genetics', 21), -- University of Cambridge, Faculty of Biology
(22, 'Department of Astrophysics', 22), -- University of Cambridge, Faculty of Physics and Astronomy
(23, 'Department of Applied Mathematics', 23), -- University of Cambridge, Faculty of Mathematics
(24, 'Department of Organic Chemistry', 24), -- University of Cambridge, Faculty of Chemistry
(25, 'Department of Archaeology', 25), -- University of Cambridge, Faculty of History
(26, 'Department of Civil Engineering', 26), -- ETH Zurich, Faculty of Engineering
(27, 'Department of Mathematics', 27), -- ETH Zurich, Faculty of Mathematics and Natural Sciences
(28, 'Department of Sociology', 28), -- ETH Zurich, Faculty of Humanities, Social, and Political Sciences
(29, 'Department of Computer Science', 29), -- ETH Zurich, Faculty of Computer Science
(30, 'Department of Architecture', 30), -- ETH Zurich, Faculty of Architecture and Civil Engineering
(31, 'Department of Sociology', 31), -- National University of Singapore, Faculty of Arts and Social Sciences
(32, 'Department of Electrical Engineering', 32), -- National University of Singapore, Faculty of Engineering
(33, 'Department of Biology', 33), -- National University of Singapore, Faculty of Science
(34, 'Department of Medicine', 34), -- National University of Singapore, Yong Loo Lin School of Medicine
(35, 'Department of Business Administration', 35), -- National University of Singapore, School of Business
(36, 'Department of History', 36), -- University of Toronto, Faculty of Arts and Science
(37, 'Department of Mechanical Engineering', 37), -- University of Toronto, Faculty of Engineering
(38, 'Department of Surgery', 38), -- University of Toronto, Faculty of Medicine
(39, 'Department of Law', 39), -- University of Toronto, Faculty of Law
(40, 'Department of Aerospace Engineering', 40), -- University of Toronto, Faculty of Applied Science and Engineering
(41, 'Department of Medicine', 41), -- University of Tokyo, Faculty of Medicine
(42, 'Department of Civil Engineering', 42), -- University of Tokyo, Faculty of Engineering
(43, 'Department of International Law', 43), -- University of Tokyo, Faculty of Law
(44, 'Department of Physics', 44), -- University of Tokyo, Faculty of Science
(45, 'Department of Agriculture', 45), -- University of Tokyo, Faculty of Agriculture
(46, 'Department of Environmental Science', 46), -- University of Melbourne, Faculty of Science
(47, 'Department of Mechanical Engineering', 47), -- University of Melbourne, Melbourne School of Engineering
(48, 'Department of Dentistry', 48), -- University of Melbourne, Faculty of Medicine, Dentistry, and Health Sciences
(49, 'Department of Literature', 49), -- University of Melbourne, Faculty of Arts
(50, 'Department of Economics', 50), -- University of Melbourne, Faculty of Business and Economics
(51, 'Department of Quantum Physics', 51), -- Peking University, School of Physics
(52, 'Department of Economics', 52), -- Peking University, School of Economics
(53, 'Department of Information Technology', 53), -- Peking University, School of Information Science and Technology
(54, 'Department of Biology', 54), -- Peking University, School of Life Sciences
(55, 'Department of International Relations', 55), -- Peking University, School of International Studies
(56, 'Department of Mathematics', 56), -- Sorbonne University, Faculty of Sciences
(57, 'Department of Surgery', 57), -- Sorbonne University, Faculty of Medicine
(58, 'Department of Political Science', 58), -- Sorbonne University, Faculty of Law and Political Science
(59, 'Department of Literature', 59), -- Sorbonne University, Faculty of Arts and Humanities
(60, 'Department of Business Administration', 60), -- Sorbonne University, Faculty of Economic and Management Sciences
(61, 'Department of Genetics', 61), -- Heidelberg University, Faculty of Biosciences
(62, 'Department of Chemistry', 62), -- Heidelberg University, Faculty of Chemistry and Earth Sciences
(63, 'Department of Computer Science', 63), -- Heidelberg University, Faculty of Mathematics and Computer Science
(64, 'Department of Astronomy', 64), -- Heidelberg University, Faculty of Physics and Astronomy
(65, 'Department of Cultural Studies', 65), -- Heidelberg University, Faculty of Behavioral and Cultural Studies
(66, 'Department of Philosophy', 66), -- University of São Paulo, Faculty of Philosophy, Letters and Human Sciences
(67, 'Department of Neurology', 67), -- University of São Paulo, Faculty of Medicine
(68, 'Department of Economics', 68), -- University of São Paulo, Faculty of Economics, Administration and Accounting
(69, 'Department of Law', 69), -- University of São Paulo, Faculty of Law
(70, 'Department of Education', 70), -- University of São Paulo, Faculty of Education
(71, 'Department of Business Administration', 71), -- University of Cape Town, Faculty of Commerce
(72, 'Department of Civil Engineering', 72), -- University of Cape Town, Faculty of Engineering & the Built Environment
(73, 'Department of Medicine', 73), -- University of Cape Town, Faculty of Health Sciences
(74, 'Department of Law', 74), -- University of Cape Town, Faculty of Law
(75, 'Department of Literature', 75), -- University of Cape Town, Faculty of Humanities
(76, 'Department of Biology', 76), -- Universidad Nacional de Colombia (Bogota), Faculty of Science
(77, 'Department of Civil Engineering', 77), -- Universidad Nacional de Colombia (Bogota), Faculty of Engineering
(78, 'Department of Surgery', 78), -- Universidad Nacional de Colombia (Bogota), Faculty of Medicine
(79, 'Department of Sociology', 79), -- Universidad Nacional de Colombia (Bogota), Faculty of Social Sciences
(80, 'Department of Literature', 80), -- Universidad Nacional de Colombia (Bogota), Faculty of Arts
(81, 'Department of Physics', 81), -- Universidad Nacional de Colombia (Medellin), Faculty of Science
(82, 'Department of Electrical Engineering', 82), -- Universidad Nacional de Colombia (Medellin), Faculty of Engineering
(83, 'Department of Medicine', 83), -- Universidad Nacional de Colombia (Medellin), Faculty of Medicine
(84, 'Department of Anthropology', 84), -- Universidad Nacional de Colombia (Medellin), Faculty of Social Sciences
(85, 'Department of History', 85), -- Universidad Nacional de Colombia (Medellin), Faculty of Arts
(86, 'Department of Mathematics', 86), -- Universidad Nacional de Colombia (Manizales), Faculty of Science
(87, 'Department of Mechanical Engineering', 87), -- Universidad Nacional de Colombia (Manizales), Faculty of Engineering
(88, 'Department of Surgery', 88), -- Universidad Nacional de Colombia (Manizales), Faculty of Medicine
(89, 'Department of Psychology', 89), -- Universidad Nacional de Colombia (Manizales), Faculty of Social Sciences
(90, 'Department of Literature', 90), -- Universidad Nacional de Colombia (Manizales), Faculty of Arts
(91, 'Department of Chemistry', 91), -- Universidad Nacional de Colombia (Caribe), Faculty of Science
(92, 'Department of Civil Engineering', 92), -- Universidad Nacional de Colombia (Caribe), Faculty of Engineering
(93, 'Department of Neurology', 93), -- Universidad Nacional de Colombia (Caribe), Faculty of Medicine
(94, 'Department of Economics', 94), -- Universidad Nacional de Colombia (Caribe), Faculty of Social Sciences
(95, 'Department of Literature', 95), -- Universidad Nacional de Colombia (Caribe), Faculty of Arts
(96, 'Department of Geography', 96), -- Universidad Nacional de Colombia (La Paz), Faculty of Science
(97, 'Department of Electrical Engineering', 97), -- Universidad Nacional de Colombia (La Paz), Faculty of Engineering
(98, 'Department of Surgery', 98), -- Universidad Nacional de Colombia (La Paz), Faculty of Medicine
(99, 'Department of Sociology', 99), -- Universidad Nacional de Colombia (La Paz), Faculty of Social Sciences
(100, 'Department of Literature', 100), -- Universidad Nacional de Colombia (La Paz), Faculty of Arts
(101, 'Department of Surgery', 1), -- Oxford University, Faculty of Medicine
(102, 'Department of Mechanical Engineering', 2), -- Oxford University, Faculty of Engineering
(103, 'Department of Criminal Law', 3), -- Oxford University, Faculty of Law
(104, 'Department of Astrophysics', 4), -- Oxford University, Faculty of Arts and Sciences
(105, 'Department of Finance', 5), -- Oxford University, Faculty of Business Administration
(106, 'Department of Environmental Science', 6), -- Cambridge University, School of Engineering
(107, 'Department of Internal Medicine', 7), -- Cambridge University, School of Medicine
(108, 'Department of Linguistics', 8), -- Cambridge University, School of Humanities and Sciences
(109, 'Department of Educational Psychology', 9), -- Cambridge University, Graduate School of Education
(110, 'Department of Geology', 10), -- Cambridge University, School of Earth, Energy & Environmental Sciences
(111, 'Department of Aerospace Engineering', 11), -- MIT University, School of Engineering and Applied Sciences
(112, 'Department of Biology', 12), -- MIT University, School of Science
(113, 'Department of Urban Design', 13), -- MIT University, School of Architecture and Planning
(114, 'Department of Marketing', 14), -- MIT University, School of Management
(115, 'Department of Literature', 15), -- MIT University, School of Humanities, Arts, and Social Sciences
(116, 'Department of International Trade Law', 16), -- Stanford University, Faculty of Law
(117, 'Department of Genetics', 17), -- Stanford University, Faculty of Natural Sciences
(118, 'Department of Cardiology', 18), -- Stanford University, Faculty of Medicine
(119, 'Department of Sociology', 19), -- Stanford University, Faculty of Social Sciences
(120, 'Department of Music', 20), -- Stanford University, Faculty of Arts
(121, 'Department of Marine Biology', 21), -- ETH Zurich, Faculty of Biology
(122, 'Department of Pure Mathematics', 22), -- ETH Zurich, Faculty of Physics and Astronomy
(123, 'Department of Statistics', 23), -- ETH Zurich, Faculty of Mathematics
(124, 'Department of Inorganic Chemistry', 24), -- ETH Zurich, Faculty of Chemistry
(125, 'Department of Archaeology', 25), -- ETH Zurich, Faculty of History
(126, 'Department of Electrical Systems', 26), -- National University of Singapore, Faculty of Engineering
(127, 'Department of Botany', 27), -- National University of Singapore, Faculty of Science
(128, 'Department of Pediatrics', 28), -- National University of Singapore, Faculty of Humanities, Social, and Political Sciences
(129, 'Department of Computer Engineering', 29), -- National University of Singapore, Faculty of Computer Science
(130, 'Department of Urban Architecture', 30), -- National University of Singapore, Faculty of Architecture and Civil Engineering
(131, 'Department of Journalism', 31), -- University of Toronto, Faculty of Arts and Science
(132, 'Department of Chemical Engineering', 32), -- University of Toronto, Faculty of Engineering
(133, 'Department of Neurology', 33), -- University of Toronto, Faculty of Medicine
(134, 'Department of Corporate Law', 34), -- University of Toronto, Faculty of Law
(135, 'Department of Aerospace Engineering', 35), -- University of Toronto, Faculty of Applied Science and Engineering
(136, 'Department of Dermatology', 36), -- University of Tokyo, Faculty of Medicine
(137, 'Department of Structural Engineering', 37), -- University of Tokyo, Faculty of Engineering
(138, 'Department of International Trade Law', 38), -- University of Tokyo, Faculty of Law
(139, 'Department of Astronomy', 39), -- University of Tokyo, Faculty of Science
(140, 'Department of Botany', 40), -- University of Tokyo, Faculty of Agriculture
(141, 'Department of Zoology', 41), -- University of Melbourne, Faculty of Science
(142, 'Department of Civil Infrastructure', 42), -- University of Melbourne, Melbourne School of Engineering
(143, 'Department of Radiology', 43), -- University of Melbourne, Faculty of Medicine, Dentistry, and Health Sciences
(144, 'Department of Comparative Literature', 44), -- University of Melbourne, Faculty of Arts
(145, 'Department of Financial Economics', 45), -- University of Melbourne, Faculty of Business and Economics
(146, 'Department of Nuclear Physics', 46), -- Peking University, School of Physics
(147, 'Department of Macroeconomics', 47), -- Peking University, School of Economics
(148, 'Department of Software Engineering', 48), -- Peking University, School of Information Science and Technology
(149, 'Department of Biochemistry', 49), -- Peking University, School of Life Sciences
(150, 'Department of Diplomatic Relations', 50), -- Peking University, School of International Studies
(151, 'Department of Geology', 51), -- Sorbonne University, Faculty of Sciences
(152, 'Department of Radiology', 52), -- Sorbonne University, Faculty of Medicine
(153, 'Department of International Relations', 53), -- Sorbonne University, Faculty of Law and Political Science
(154, 'Department of Fine Arts', 54), -- Sorbonne University, Faculty of Arts and Humanities
(155, 'Department of Business Management', 55), -- Sorbonne University, Faculty of Economic and Management Sciences
(156, 'Department of Genetics', 56), -- Heidelberg University, Faculty of Biosciences
(157, 'Department of Earth Sciences', 57), -- Heidelberg University, Faculty of Chemistry and Earth Sciences
(158, 'Department of Software Engineering', 58), -- Heidelberg University, Faculty of Mathematics and Computer Science
(159, 'Department of Astrophysics', 59), -- Heidelberg University, Faculty of Physics and Astronomy
(160, 'Department of Social Anthropology', 60), -- Heidelberg University, Faculty of Behavioral and Cultural Studies
(161, 'Department of Philosophy', 61), -- University of São Paulo, Faculty of Philosophy, Letters and Human Sciences
(162, 'Department of Psychiatry', 62), -- University of São Paulo, Faculty of Medicine
(163, 'Department of Business Administration', 63), -- University of São Paulo, Faculty of Economics, Administration and Accounting
(164, 'Department of Environmental Law', 64), -- University of São Paulo, Faculty of Law
(165, 'Department of Education', 65), -- University of São Paulo, Faculty of Education
(166, 'Department of Economics', 66), -- University of Cape Town, Faculty of Commerce
(167, 'Department of Civil Infrastructure', 67), -- University of Cape Town, Faculty of Engineering & the Built Environment
(168, 'Department of Radiology', 68), -- University of Cape Town, Faculty of Health Sciences
(169, 'Department of Environmental Law', 69), -- University of Cape Town, Faculty of Law
(170, 'Department of Linguistics', 70), -- University of Cape Town, Faculty of Humanities
(171, 'Department of Marine Biology', 71), -- Universidad Nacional de Colombia (Bogota), Faculty of Science
(172, 'Department of Mechanical Engineering', 72), -- Universidad Nacional de Colombia (Bogota), Faculty of Engineering
(173, 'Department of Gynecology', 73), -- Universidad Nacional de Colombia (Bogota), Faculty of Medicine
(174, 'Department of Political Science', 74), -- Universidad Nacional de Colombia (Bogota), Faculty of Social Sciences
(175, 'Department of Fine Arts', 75), -- Universidad Nacional de Colombia (Bogota), Faculty of Arts
(176, 'Department of Astrophysics', 76), -- Universidad Nacional de Colombia (Medellin), Faculty of Science
(177, 'Department of Electrical Engineering', 77), -- Universidad Nacional de Colombia (Medellin), Faculty of Engineering
(178, 'Department of Neurology', 78), -- Universidad Nacional de Colombia (Medellin), Faculty of Medicine
(179, 'Department of Economics', 79), -- Universidad Nacional de Colombia (Medellin), Faculty of Social Sciences
(180, 'Department of Literature', 80), -- Universidad Nacional de Colombia (Medellin), Faculty of Arts
(181, 'Department of Microbiology', 81), -- Universidad Nacional de Colombia (Manizales), Faculty of Science
(182, 'Department of Chemical Engineering', 82), -- Universidad Nacional de Colombia (Manizales), Faculty of Engineering
(183, 'Department of Cardiology', 83), -- Universidad Nacional de Colombia (Manizales), Faculty of Medicine
(184, 'Department of Sociology', 84), -- Universidad Nacional de Colombia (Manizales), Faculty of Social Sciences
(185, 'Department of Archaeology', 85), -- Universidad Nacional de Colombia (Manizales), Faculty of Arts
(186, 'Department of Environmental Sciences', 86), -- Universidad Nacional de Colombia (Caribe), Faculty of Science
(187, 'Department of Civil Engineering', 87), -- Universidad Nacional de Colombia (Caribe), Faculty of Engineering
(188, 'Department of Psychiatry', 88), -- Universidad Nacional de Colombia (Caribe), Faculty of Medicine
(189, 'Department of Sociology', 89), -- Universidad Nacional de Colombia (Caribe), Faculty of Social Sciences
(190, 'Department of Literature', 90), -- Universidad Nacional de Colombia (Caribe), Faculty of Arts
(191, 'Department of Marine Biology', 91), -- Universidad Nacional de Colombia (La Paz), Faculty of Science
(192, 'Department of Electrical Engineering', 92), -- Universidad Nacional de Colombia (La Paz), Faculty of Engineering
(193, 'Department of Neurology', 93), -- Universidad Nacional de Colombia (La Paz), Faculty of Medicine
(194, 'Department of Economics', 94), -- Universidad Nacional de Colombia (La Paz), Faculty of Social Sciences
(195, 'Department of Literature', 95), -- Universidad Nacional de Colombia (La Paz), Faculty of Arts
(201, 'Department of Cardiology', 1), -- Oxford University, Faculty of Medicine
(202, 'Department of Mechanical Engineering', 2), -- Oxford University, Faculty of Engineering
(203, 'Department of Corporate Law', 3), -- Oxford University, Faculty of Law
(204, 'Department of Astrophysics', 4), -- Oxford University, Faculty of Arts and Sciences
(205, 'Department of Accounting', 5), -- Oxford University, Faculty of Business Administration
(206, 'Department of Biomedical Engineering', 6), -- Cambridge University, School of Engineering
(207, 'Department of Pediatrics', 7), -- Cambridge University, School of Medicine
(208, 'Department of Literature', 8), -- Cambridge University, School of Humanities and Sciences
(209, 'Department of Psychology', 9), -- Cambridge University, Graduate School of Education
(210, 'Department of Environmental Science', 10), -- Cambridge University, School of Earth, Energy & Environmental Sciences
(211, 'Department of Aerospace Engineering', 11), -- MIT University, School of Engineering and Applied Sciences
(212, 'Department of Molecular Biology', 12), -- MIT University, School of Science
(213, 'Department of Urban Development', 13), -- MIT University, School of Architecture and Planning
(214, 'Department of Supply Chain Management', 14), -- MIT University, School of Management
(215, 'Department of Linguistics', 15), -- MIT University, School of Humanities, Arts, and Social Sciences
(216, 'Department of Criminal Law', 16), -- Stanford University, Faculty of Law
(217, 'Department of Environmental Science', 17), -- Stanford University, Faculty of Natural Sciences
(218, 'Department of Neurology', 18), -- Stanford University, Faculty of Medicine
(219, 'Department of Sociology', 19), -- Stanford University, Faculty of Social Sciences
(220, 'Department of Archaeology', 20), -- Stanford University, Faculty of Arts
(221, 'Department of Marine Biology', 21), -- ETH Zurich, Faculty of Biology
(222, 'Department of Pure Mathematics', 22), -- ETH Zurich, Faculty of Physics and Astronomy
(223, 'Department of Statistics', 23), -- ETH Zurich, Faculty of Mathematics
(224, 'Department of Inorganic Chemistry', 24), -- ETH Zurich, Faculty of Chemistry
(225, 'Department of Linguistics', 25), -- ETH Zurich, Faculty of History
(226, 'Department of Structural Engineering', 26), -- National University of Singapore, Faculty of Engineering
(227, 'Department of Astronomy', 27), -- National University of Singapore, Faculty of Mathematics and Natural Sciences
(228, 'Department of Anthropology', 28), -- National University of Singapore, Faculty of Humanities, Social, and Political Sciences
(229, 'Department of Data Science', 29), -- National University of Singapore, Faculty of Computer Science
(230, 'Department of Urban Planning', 30), -- National University of Singapore, Faculty of Architecture and Civil Engineering
(231, 'Department of International Relations', 31), -- University of Toronto, Faculty of Arts and Science
(232, 'Department of Electrical and Computer Engineering', 32), -- University of Toronto, Faculty of Engineering
(233, 'Department of Anesthesiology', 33), -- University of Toronto, Faculty of Medicine
(234, 'Department of Tax Law', 34), -- University of Toronto, Faculty of Law
(235, 'Department of Civil Engineering', 35), -- University of Toronto, Faculty of Applied Science and Engineering
(236, 'Department of Internal Medicine', 36), -- University of Tokyo, Faculty of Medicine
(237, 'Department of Architecture', 37), -- University of Tokyo, Faculty of Engineering
(238, 'Department of Criminal Law', 38), -- University of Tokyo, Faculty of Law
(239, 'Department of Computer Science', 39), -- University of Tokyo, Faculty of Science
(240, 'Department of Horticulture', 40), -- University of Tokyo, Faculty of Agriculture
(241, 'Department of Marine Science', 41), -- University of Melbourne, Faculty of Science
(242, 'Department of Civil Engineering', 42), -- University of Melbourne, Melbourne School of Engineering
(243, 'Department of Dermatology', 43), -- University of Melbourne, Faculty of Medicine, Dentistry, and Health Sciences
(244, 'Department of Film Studies', 44), -- University of Melbourne, Faculty of Arts
(245, 'Department of Marketing', 45), -- University of Melbourne, Faculty of Business and Economics
(246, 'Department of Quantum Mechanics', 46), -- Peking University, School of Physics
(247, 'Department of Political Economy', 47), -- Peking University, School of Economics
(248, 'Department of Computer Engineering', 48), -- Peking University, School of Information Science and Technology
(249, 'Department of Biochemistry', 49), -- Peking University, School of Life Sciences
(250, 'Department of International Law', 50), -- Peking University, School of International Studies
(251, 'Department of Bioinformatics', 51), -- Sorbonne University, Faculty of Sciences
(252, 'Department of Obstetrics and Gynecology', 52), -- Sorbonne University, Faculty of Medicine
(253, 'Department of Political Science', 53), -- Sorbonne University, Faculty of Law and Political Science
(254, 'Department of Archaeology', 54), -- Sorbonne University, Faculty of Arts and Humanities
(255, 'Department of Business Analytics', 55), -- Sorbonne University, Faculty of Economic and Management Sciences
(256, 'Department of Genetics', 56), -- Heidelberg University, Faculty of Biosciences
(257, 'Department of Environmental Chemistry', 57), -- Heidelberg University, Faculty of Chemistry and Earth Sciences
(258, 'Department of Artificial Intelligence', 58), -- Heidelberg University, Faculty of Mathematics and Computer Science
(259, 'Department of Astrophysics', 59), -- Heidelberg University, Faculty of Physics and Astronomy
(260, 'Department of Cultural Studies', 60), -- Heidelberg University, Faculty of Behavioral and Cultural Studies
(261, 'Department of Linguistics', 61), -- University of São Paulo, Faculty of Philosophy, Letters and Human Sciences
(262, 'Department of Psychiatry', 62), -- University of São Paulo, Faculty of Medicine
(263, 'Department of Macroeconomics', 63), -- University of São Paulo, Faculty of Economics, Administration and Accounting
(264, 'Department of Criminal Law', 64), -- University of São Paulo, Faculty of Law
(265, 'Department of Education', 65), -- University of São Paulo, Faculty of Education
(266, 'Department of International Business', 66), -- University of Cape Town, Faculty of Commerce
(267, 'Department of Structural Engineering', 67), -- University of Cape Town, Faculty of Engineering & the Built Environment
(268, 'Department of Cardiology', 68), -- University of Cape Town, Faculty of Health Sciences
(269, 'Department of Tax Law', 69), -- University of Cape Town, Faculty of Law
(270, 'Department of Literature', 70), -- University of Cape Town, Faculty of Humanities
(271, 'Department of Genetics', 71), -- Universidad Nacional de Colombia (Bogota), Faculty of Science
(272, 'Department of Civil Engineering', 72), -- Universidad Nacional de Colombia (Bogota), Faculty of Engineering
(273, 'Department of Neurology', 73), -- Universidad Nacional de Colombia (Bogota), Faculty of Medicine
(274, 'Department of Sociology', 74), -- Universidad Nacional de Colombia (Bogota), Faculty of Social Sciences
(275, 'Department of Literature', 75), -- Universidad Nacional de Colombia (Bogota), Faculty of Arts
(276, 'Department of Quantum Mechanics', 76), -- Universidad Nacional de Colombia (Medellin), Faculty of Science
(277, 'Department of Electrical Engineering', 77), -- Universidad Nacional de Colombia (Medellin), Faculty of Engineering
(278, 'Department of Surgery', 78), -- Universidad Nacional de Colombia (Medellin), Faculty of Medicine
(279, 'Department of Anthropology', 79), -- Universidad Nacional de Colombia (Medellin), Faculty of Social Sciences
(280, 'Department of History', 80), -- Universidad Nacional de Colombia (Medellin), Faculty of Arts
(281, 'Department of Mathematics', 81), -- Universidad Nacional de Colombia (Manizales), Faculty of Science
(282, 'Department of Mechanical Engineering', 82), -- Universidad Nacional de Colombia (Manizales), Faculty of Engineering
(283, 'Department of Surgery', 83), -- Universidad Nacional de Colombia (Manizales), Faculty of Medicine
(284, 'Department of Psychology', 84), -- Universidad Nacional de Colombia (Manizales), Faculty of Social Sciences
(285, 'Department of Literature', 85), -- Universidad Nacional de Colombia (Manizales), Faculty of Arts
(286, 'Department of Chemistry', 86), -- Universidad Nacional de Colombia (Caribe), Faculty of Science
(287, 'Department of Civil Engineering', 87), -- Universidad Nacional de Colombia (Caribe), Faculty of Engineering
(288, 'Department of Neurology', 88), -- Universidad Nacional de Colombia (Caribe), Faculty of Medicine
(289, 'Department of Macroeconomics', 89), -- Universidad Nacional de Colombia (Caribe), Faculty of Social Sciences
(290, 'Department of Linguistics', 90), -- Universidad Nacional de Colombia (Caribe), Faculty of Arts
(291, 'Department of Geography', 91), -- Universidad Nacional de Colombia (La Paz), Faculty of Science
(292, 'Department of Electrical Engineering', 92), -- Universidad Nacional de Colombia (La Paz), Faculty of Engineering
(293, 'Department of Surgery', 93), -- Universidad Nacional de Colombia (La Paz), Faculty of Medicine
(294, 'Department of Sociology', 94), -- Universidad Nacional de Colombia (La Paz), Faculty of Social Sciences
(295, 'Department of Literature', 95); -- Universidad Nacional de Colombia (La Paz), Faculty of Arts