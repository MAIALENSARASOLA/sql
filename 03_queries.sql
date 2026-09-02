-- consultas del proyecto sql

-- media por profe
select 
  p.first_name, p.last_name, 
  avg(g.grade) as media_profe
from professors p
join courses c on p.professor_id = c.professor_id
join grades g on c.course_id = g.course_id
group by p.first_name, p.last_name;
-- mejor nota de cada alumno
select s.first_name, s.last_name, max(g.grade) as max_nota
from students s
join grades g on s.student_id = g.student_id
group by 1, 2;

-- alumnos ordenados por nombre de curso
select s.first_name, s.last_name, c.course_name
from students s
join grades g on s.student_id = g.student_id
join courses c on g.course_id = c.course_id
order by c.course_name;

-- cursos mas dificiles primero
select c.course_name, avg(g.grade) as nota_media
from courses c
join grades g on c.course_id = g.course_id
group by 1
order by nota_media asc;

-- quien coincide mas con que profe
select 
  s.first_name, s.last_name, 
  p.first_name, p.last_name, 
  count(distinct c.course_id) as total_comun
from students s
join grades g on s.student_id = g.student_id
join courses c on g.course_id = c.course_id
join professors p on c.professor_id = p.professor_id
group by 1, 2, 3, 4
order by total_comun desc
limit 1;
