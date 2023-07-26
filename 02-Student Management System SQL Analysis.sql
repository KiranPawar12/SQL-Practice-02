use kiran01;

-- creating tables 

create table departments(department_id int primary key, department_name varchar(100) not null);
create table students (student_id int, first_name varchar(100), last_name varchar(100), email char(50), department_id int);
create table courses (course_id int, course_name varchar(100), department_id int);
create table enrollments (enrollment_id int, student_id int, course_id int, grade varchar(1));

-- inserting data 

insert into departments(department_id, department_name)
 values (1, 'computer'), (2, 'electrical'), (3, 'mechanical');
 
insert into students(student_id, first_name, last_name, email, department_id) 
values 
(1,'John','Smith','john@example.com',1),
(2,'Jane','Doe','jane@example.com',2),
(3,'Michael','Johnson','michael@example.com',1);

insert into courses(course_id, course_name, department_id) 
values (101, 'Introduction to Programming', 1), (102, 'Data Structures', 1), (201, 'Electrical Circuits', 2);

insert into enrollments (enrollment_id, student_id, course_id, grade)
values (1, 1, 101, 'A'), (2, 1,	102, 'B'), (3, 2, 201, 'A'), (4, 2,	101, 'B'), (5, 3, 101, 'C'), (6,	3, 102,	'A');

-- Data analysis queries

-- Query 1 : Calculate GPA for each student

select s.student_id, s.first_name, s.last_name, 
avg(case when e.grade = 'A' then 4
		when e.grade = 'B' then 3
        when e.grade = 'C' then 2
        when e.grade = 'D' then 1
        Else 0
        End) as avg_gpa
from students s
join enrollments e on s.student_id=e.student_id
group by s.student_id, s.first_name, s.last_name;


-- Query 2 :  Find courses with the highest enrollment count

select c.course_name, sum(e.enrollment_id) as total
from courses c 
join enrollments e on c.course_id=e.course_id
group by c.course_name 
order by c.course_name desc;

-- Query 3 : Calculate the total number of enrolled students in each department

select d.department_name, sum(s.student_id) as total
from departments d
join students s on s.department_id=d.department_id
group by d.department_name;

SELECT d.department_id, d.department_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;












