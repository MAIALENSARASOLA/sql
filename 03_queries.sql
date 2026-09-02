-- 1. Nota media de cada profesor
select
p.first_name,
p.last_name,
avg(g.grade) as average_grade
from professors p
join courses c on p.professor_id = c.professor_id
join grades g on c.course_id = g.course_id
group by p.professor_id;

-- 2. Mejor nota de cada alumno
select
s.first_name,
s.last_name,
max(g.grade) as best_grade
from students s
join grades g on s.student_id = g.student_id
group by s.student_id;

-- 3. Alumnos ordenados por curso
select
s.first_name,
s.last_name,
c.course_name
from students s
join grades g on s.student_id = g.student_id
join courses c on g.course_id = c.course_id
order by c.course_name;

-- 4. Cursos ordenados de más difícil a más fácil
select
c.course_name,
avg(g.grade) as average_grade
from courses c
join grades g on c.course_id = g.course_id
group by c.course_id
order by average_grade;

-- 5. Alumno y profesor con más cursos en común
select
s.first_name,
s.last_name,
p.first_name,
p.last_name,
count(distinct c.course_id) as courses_in_common
from students s
join grades g on s.student_id = g.student_id
join courses c on g.course_id = c.course_id
join professors p on c.professor_id = p.professor_id
group by s.student_id, p.professor_id
order by courses_in_common desc
limit 1;
