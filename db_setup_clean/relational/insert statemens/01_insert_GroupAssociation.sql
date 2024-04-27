use grad_db;

-- Delete existing records from GroupAssociation table
DELETE FROM grad_db.GroupAssociation;

-- Insert new records into GroupAssociation table
INSERT INTO grad_db.GroupAssociation (idGroupAssociation, type, name, knowledge_area)
VALUES 
(1, 'Seminary', 'Data Science Seminar', 'Data Science'),
(2, 'Student Group', 'Engineering Student Council', 'Engineering'),
(3, 'Research Group', 'Advanced Materials Research Group', 'Materials Science'),
(4, 'Other', 'Entrepreneurship Club', 'Business'),
(5, 'Seminary', 'Artificial Intelligence Forum', 'Computer Science'),
(6, 'Student Group', 'Biomedical Engineering Society', 'Biomedical Engineering'),
(7, 'Research Group', 'Environmental Sustainability Research Team', 'Environmental Science'),
(8, 'Other', 'Women in STEM', 'STEM'),
(9, 'Seminary', 'Economics Discussion Group', 'Economics'),
(10, 'Student Group', 'Chemical Engineering Association', 'Chemical Engineering'),
(11, 'Research Group', 'Psychology Research Collective', 'Psychology'),
(12, 'Other', 'Literary Society', 'Literature'),
(13, 'Seminary', 'Urban Planning Seminar Series', 'Urban Planning'),
(14, 'Student Group', 'Cultural Anthropology Club', 'Anthropology'),
(15, 'Research Group', 'Cancer Research Consortium', 'Oncology'),
(16, 'Other', 'International Relations Forum', 'Political Science'),
(17, 'Seminary', 'Music Appreciation Society', 'Music'),
(18, 'Student Group', 'Dance Performance Troupe', 'Dance'),
(19, 'Research Group', 'Archaeology Field Team', 'Archaeology'),
(20, 'Other', 'Film Studies Club', 'Film');
