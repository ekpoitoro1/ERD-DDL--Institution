-- Create Table

CREATE TABLE student(
	id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	date_of_birth DATE,
	enrollment_date DATE
); 

ALTER TABLE student ADD PRIMARY KEY(id);

CREATE TABLE instructor(
	id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	hire_date DATE,
	department_id INT
);

ALTER TABLE instructor ADD PRIMARY KEY(id);

CREATE TABLE department(
	id INT,
	name VARCHAR(50),
	division_id INT
);

ALTER TABLE department ADD PRIMARY KEY(id);

CREATE TABLE course(
	id INT,
	name VARCHAR(50),
	credits INT,
	department_id INT
);

ALTER TABLE course ADD PRIMARY KEY(id);

CREATE TABLE enrollment(
	id INT,
	student_id INT,
	offerings_id INT,
	enrollment_date DATE,
	grade CHAR(2)	
); 

ALTER TABLE enrollment ADD PRIMARY KEY(id);

CREATE TABLE offerings(
	id INT,
	course_id INT,
	instructor_id INT,
	semester VARCHAR(10),
	Year DATE,
	locaion VARCHAR(50),
	schedule DATE
);

ALTER TABLE offerings ADD PRIMARY KEY(id);

ALTER TABLE offerings RENAME COLUMN locaion TO location;

ALTER TABLE offerings DROP COLUMN Year;

ALTER TABLE offerings ADD COLUMN year INT;

CREATE TABLE division(
	id INT,
	name VARCHAR(50)
);

ALTER TABLE division ADD PRIMARY KEY(id);

-- Create foreign keys

ALTER TABLE instructor ADD FOREIGN KEY(department_id) REFERENCES department(id);

ALTER TABLE department ADD FOREIGN KEY(division_id) REFERENCES division(id);

ALTER TABLE course ADD FOREIGN KEY(department_id) REFERENCES department(id);

ALTER TABLE enrollment ADD FOREIGN KEY(student_id) REFERENCES student(id);

ALTER TABLE enrollment ADD FOREIGN KEY(offerings_id) REFERENCES offerings(id);

ALTER TABLE offerings ADD FOREIGN KEY(course_id) REFERENCES course(id);

ALTER TABLE offerings ADD FOREIGN KEY(instructor_id) REFERENCES instructor(id);

-- Constraint Check For Grade
ALTER TABLE enrollment ADD CONSTRAINT chk_grade CHECK (grade IN ('A', 'B', 'C', 'D', 'F'));

-- Insert dummy data
INSERT INTO instructor (id, first_name, last_name, email, hire_date, department_id)
VALUES (1001, 'Alexa', 'Palo', 'Alexa_Palo@gmail.com', '2022-03-13',101);

INSERT INTO department (id, name, division_id)
VALUES (101, 'Geology', 1);

INSERT INTO division (id, name)
VALUES (1,'Sciences');

INSERT INTO  course (id, name, credits, department_id)
VALUES (102, 'Geophysics', '15',101);

INSERT INTO student (id, first_name, last_name, email, date_of_birth, enrollment_date)
VALUES (1254, 'fiakyo', 'Banjo' , 'fikayo-banjo@gmail.com', '2006-04-12', '2022-04-15');

INSERT INTO enrollment (id, student_id, offerings_id, enrollment_date, grade)
VALUES (1256, 1254, 250, '2022-04-15', 'A');

INSERT INTO offerings (id, course_id, instructor_id, semester, year, location, schedule)
VALUES (250, 102, 1001, 'First', 2022, 'Block B', '2022-04-13');