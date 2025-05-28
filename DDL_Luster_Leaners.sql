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


