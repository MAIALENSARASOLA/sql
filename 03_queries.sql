-- consulta 1: la media por profesor
select p.first_name, p.last_name, avg(g.grade) as media_profe from professors p join courses c on p.professor_id = c.professor_id join grades g on c.course_id = g.course_id group by p.first_name, p.last_name;

-- consulta 2: nota maxima de cada alumno
select s.first_name, s.last_name, max(g.grade) as max_nota from students s join grades g on s.student_id = g.student_id group by s.first_name, s.last_name;

-- consulta 3: alumnos por curso
select s.first_name, s.last_name, c.course_name from students s join grades g on s.student_id = g.student_id join courses c on g.course_id = c.course_id order by c.course_name;

-- consulta 4: cursos mas dificiles
select c.course_name, avg(g.grade) as nota_media from courses c join grades g on c.course_id = g.course_id group by c.course_name order by nota_media asc;

-- consulta 5: quien coincide mas
select s.first_name, s.last_name, p.first_name, p.last_name, count(distinct c.course_id) as total_comun from students s join grades g on s.student_id = g.student_id join courses c on g.course_id = c.course_id join professors p on c.professor_id = p.professor_id group by s.first_name, s.last_name, p.first_name, p.last_name order by total_comun desc limit 1;
