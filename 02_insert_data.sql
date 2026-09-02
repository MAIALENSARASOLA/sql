insert into students (first_name, last_name) values
('Juan', 'Garcia'),
('Maria', 'Lopez'),
('Ane', 'Sanchez');

insert into professors (first_name, last_name) values
('Carlos', 'Martin'),
('Laura', 'Perez');

insert into courses (course_name, professor_id) values
('Matematicas', 1),
('Programacion', 1),
('Bases de datos', 2);

insert into grades (student_id, course_id, grade) values
(1, 1, 8.50),
(1, 2, 9.00),
(2, 1, 7.00),,
(3, 3, 8.00);
