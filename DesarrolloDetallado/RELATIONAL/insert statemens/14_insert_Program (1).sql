USE grad_db;
DELETE FROM Program;
ALTER TABLE Program AUTO_INCREMENT = 1;

-- ALTER TABLE Program
-- MODIFY program_name VARCHAR(145);

INSERT INTO grad_db.Program (academic_lvl, program_name, duration, idDepartment)
VALUES
('Undergraduate', 'Bachelor of Science in Computer Science', '4 years', 1),
('Graduate', 'Master of Business Administration', '2 years', 2),
('Graduate', 'Master of Arts in English Literature', '2 years', 3),
('Doctorate', 'Ph.D. in Electrical Engineering', '5 years', 4),
('Undergraduate', 'Bachelor of Arts in Economics', '4 years', 5),
('Graduate', 'Master of Science in Environmental Science', '2 years', 6),
('Graduate', 'Master of Public Health', '2 years', 7),
('Doctorate', 'Ph.D. in Political Science', '5 years', 8),
('Undergraduate', 'Bachelor of Fine Arts in Theater', '4 years', 9),
('Graduate', 'Master of Music in Performance', '2 years', 10),
('Undergraduate', 'Bachelor of Science in Physics', '4 years', 11),
('Graduate', 'Master of Science in Chemistry', '2 years', 12),
('Graduate', 'Master of Education in Teaching', '2 years', 13),
('Doctorate', 'Ph.D. in History', '5 years', 14),
('Undergraduate', 'Bachelor of Arts in Psychology', '4 years', 15),
('Graduate', 'Master of Science in Mathematics', '2 years', 16),
('Graduate', 'Master of Social Work', '2 years', 17),
('Doctorate', 'Ph.D. in Sociology', '5 years', 18),
('Undergraduate', 'Bachelor of Science in Biology', '4 years', 19),
('Graduate', 'Master of Arts in Linguistics', '2 years', 20),
('Graduate', 'Master of Engineering in Civil Engineering', '2 years', 21),
('Doctorate', 'Ph.D. in Philosophy', '5 years', 22),
('Undergraduate', 'Bachelor of Arts in History', '4 years', 23),
('Graduate', 'Master of Science in Computer Engineering', '2 years', 24),
('Graduate', 'Master of Fine Arts in Creative Writing', '2 years', 25),
('Doctorate', 'Ph.D. in Biochemistry', '5 years', 26),
('Undergraduate', 'Bachelor of Science in Nursing', '4 years', 27),
('Graduate', 'Master of Arts in International Relations', '2 years', 28),
('Graduate', 'Master of Engineering in Mechanical Engineering', '2 years', 29),
('Doctorate', 'Ph.D. in Economics', '5 years', 30),
('Undergraduate', 'Bachelor of Arts in Sociology', '4 years', 31),
('Graduate', 'Master of Science in Information Technology', '2 years', 32),
('Graduate', 'Master of Public Administration', '2 years', 33),
('Doctorate', 'Ph.D. in Public Health', '5 years', 34),
('Undergraduate', 'Bachelor of Science in Environmental Science', '4 years', 35),
('Graduate', 'Master of Arts in Anthropology', '2 years', 36),
('Graduate', 'Master of Engineering in Electrical Engineering', '2 years', 37),
('Doctorate', 'Ph.D. in Political Science', '5 years', 38),
('Undergraduate', 'Bachelor of Arts in Communication Studies', '4 years', 39),
('Graduate', 'Master of Science in Biotechnology', '2 years', 40),
('Graduate', 'Master of Education in Counseling', '2 years', 41),
('Doctorate', 'Ph.D. in Psychology', '5 years', 42),
('Undergraduate', 'Bachelor of Science in Chemistry', '4 years', 43),
('Graduate', 'Master of Arts in Economics', '2 years', 44),
('Graduate', 'Master of Engineering in Computer Engineering', '2 years', 45),
('Doctorate', 'Ph.D. in Sociology', '5 years', 46),
('Undergraduate', 'Bachelor of Arts in English Literature', '4 years', 47);

-- select * from program;