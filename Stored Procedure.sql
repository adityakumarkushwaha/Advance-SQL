CREATE DATABASE student_db;
USE student_db;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT
);

INSERT INTO student VALUES
(1,'Amit','BCA',80),
(2,'Rahul','BCA',75),
(3,'Priya','MCA',90),
(4,'Neha','BBA',85),
(5,'Rohan','MCA',70),
(6,'Karan','BCA',78),
(7,'Simran','BBA',88),
(8,'Anjali','MCA',92),
(9,'Vikas','BCA',65),
(10,'Pooja','BBA',81);

SELECT * FROM student;
# Q1: Create procedure to show all student names

DELIMITER //

CREATE PROCEDURE student_names()
BEGIN
    SELECT name
    FROM student;
END //
DELIMITER ;
CALL student_names();

# Q2: Create procedure to show students
# whose marks are less than given marks

DELIMITER //

CREATE PROCEDURE marks_below(IN m INT)
BEGIN
    SELECT *
    FROM student
    WHERE marks < m;
END //

DELIMITER ;

CALL marks_below(80);

# Q3: Create procedure to find minimum marks

DELIMITER //

CREATE PROCEDURE minimum_marks()
BEGIN
    SELECT MIN(marks) AS minimum_marks
    FROM student;
END //

DELIMITER ;

CALL minimum_marks();


# Q4: Create procedure to find maximum marks

DELIMITER //

CREATE PROCEDURE maximum_marks()
BEGIN
    SELECT MAX(marks) AS maximum_marks
    FROM student;
END //

DELIMITER ;

CALL maximum_marks();


# Q5: Create procedure to find total marks

DELIMITER //

CREATE PROCEDURE total_marks()
BEGIN
    SELECT SUM(marks) AS total_marks
    FROM student;
END //

DELIMITER ;

CALL total_marks();


# Q16: Create procedure to count students
# in a particular course

DELIMITER //

CREATE PROCEDURE count_course_students(IN course_name VARCHAR(50))
BEGIN
    SELECT COUNT(*) AS total_students
    FROM student
    WHERE course = course_name;
END //

DELIMITER ;

CALL count_course_students('BCA');


# Q7: Create procedure to show students
# whose name starts with given letter

DELIMITER //

CREATE PROCEDURE name_starts_with(IN first_letter VARCHAR(1))
BEGIN
    SELECT *
    FROM student
    WHERE name LIKE CONCAT(first_letter,'%');
END //

DELIMITER ;

CALL name_starts_with('A');


# Q8: Create procedure to update course

DELIMITER //

CREATE PROCEDURE update_course(
IN stu_id INT,
IN new_course VARCHAR(50))
BEGIN
    UPDATE student
    SET course = new_course
    WHERE id = stu_id;
END //

DELIMITER ;

CALL update_course(1,'MCA');


# Q9: Create procedure to show students
# in ascending order of marks

DELIMITER //

CREATE PROCEDURE marks_ascending()
BEGIN
    SELECT *
    FROM student
    ORDER BY marks ASC;
END //

DELIMITER ;

CALL marks_ascending();



# Q10: Create procedure to show students
# in descending order of marks

DELIMITER //

CREATE PROCEDURE marks_descending()
BEGIN
    SELECT *
    FROM student
    ORDER BY marks DESC;
END //

DELIMITER ;

CALL marks_descending();

