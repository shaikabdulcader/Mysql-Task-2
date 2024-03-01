create database guvi_zen_class;
use guvi_zen_class;

create table batches(batch_id int primary key, batch_name varchar(50));
desc batches;

create table mentors(mentor_id int primary key, mentor_name varchar(50), batch_id int, 
foreign key (batch_id) references batches(batch_id));
desc mentors;

create table courses(course_id int primary key, course_name varchar(50), batch_id int, 
foreign key (batch_id) references batches(batch_id));
desc courses;

create table tasks(task_id int primary key, task_name varchar(50), course_id int, 
foreign key (course_id) references courses(course_id));
desc tasks;

create table students(student_id int primary key, student_name varchar(50), mentor_id int, batch_id int, 
foreign key (mentor_id) references mentors(mentor_id), foreign key (batch_id) references batches(batch_id));
desc students;

create table marks(mark_id int primary key, student_id int, task_id int, marks int, 
foreign key (student_id) references students(student_id), foreign key (task_id) references tasks(task_id));
desc marks;

create table queries(query_id int primary key, student_id int, query_name varchar(50), query_description varchar(50), 
foreign key (student_id) references students(student_id));
desc queries;

create table mock_interviews(mock_interview_id int primary key, student_id int, mentor_id int,  mock_interview_score int, 
foreign key (student_id) references students(student_id), foreign key (mentor_id) references mentors(mentor_id));
desc mock_interviews;

create table leader_board(leader_board_id int primary key, student_id int, batch_id int,  leader_board_score int, 
foreign key (student_id) references students(student_id), foreign key (batch_id) references batches(batch_id));
desc leader_board; 
