-- borrar tablas si ya existen
drop table if exists grades;
drop table if exists courses;
drop table if exists professors;
drop table if exists students;

create table students (
student_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50)
);

create table professors (
professor_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50)
);

create table courses (
course_id int auto_increment primary key,
course_name varchar(100),
professor_id int,
foreign key (professor_id) references professors(professor_id)
);

create table grades (
grade_id int auto_increment primary key,
student_id int,
course_id int,
grade decimal(5,2),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
);
