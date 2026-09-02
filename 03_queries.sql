-- Consultas SQL para el proyecto

--1. media por profe
SELECT p.first_name, p.last_name, avg(g.grade) as media_profe
FROM professors p
JOIN courses c ON p.professor_id = c.professor_id
JOIN grades g ON c.course_id = g.course_id
GROUP BY p.first_name, p.last_name;

-- 2. sacar la mejor nota de cada alumno
SELECT s.first_name, s.last_name, MAX(g.grade) AS max_nota
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.first_name, s.last_name;

--3. alumnos ordenados por nombre de curso
SELECT s.first_name, s.last_name, c.course_name
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id
ORDER BY c.course_name ASC;

-4. cursos mas dificiles primero (ordenados de menor a mayor media)
SELECT c.course_name, AVG(g.grade) AS nota_media
FROM courses c
JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_name
ORDER BY nota_media ASC;

-- 5. alumno y profesor que mas coinciden
SELECT 
  s.first_name, s.last_name, 
  p.first_name, p.last_name, 
  COUNT(DISTINCT c.course_id) AS total_comun
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id
JOIN professors p ON c.professor_id = p.professor_id
GROUP BY s.first_name, s.last_name, p.first_name, p.last_name
ORDER BY total_comun DESC
LIMIT 1;
