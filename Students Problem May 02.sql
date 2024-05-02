CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT,
    class VARCHAR(10)
);

INSERT INTO Students (student_id, student_name, marks, class) VALUES
(1, 'John Doe', 85, 'A'),
(2, 'Jane Smith', 92, 'B'),
(3, 'Michael Johnson', 78, 'A'),
(4, 'Emily Brown', 59, 'C'),
(5, 'David Lee', 88, 'B'),
(6, 'Sarah Wilson', 59, 'A'),
(7, 'Daniel Taylor', 90, 'C'),
(8, 'Emma Martinez', 79, 'B'),
(9, 'Christopher Anderson', 87, 'A'),
(10, 'Olivia Garcia', 91, 'C'),
(11, 'James Rodriguez', 83, 'B'),
(12, 'Sophia Hernandez', 94, 'A'),
(13, 'Matthew Martinez', 76, 'C'),
(14, 'Isabella Lopez', 89, 'B'),
(15, 'Ethan Gonzalez', 80, 'A'),
(16, 'Amelia Perez', 93, 'C'),
(17, 'Alexander Torres', 77, 'B'),
(18, 'Mia Flores', 86, 'A'),
(19, 'William Sanchez', 84, 'C'),
(20, 'Ava Ramirez', 97, 'B'),
(21, 'Daniel Taylor', 75, 'A'),
(22, 'Chloe Cruz', 98, 'C'),
(23, 'Benjamin Ortiz', 89, 'B'),
(24, 'Harper Reyes', 99, 'A'),
(25, 'Ryan Stewart', 99, 'C');

SELECT * FROM STUDENTS


--You have a students table with columns
--id, name, marks and class of students

-- Write a query to fetch students
--with minmum marks and maximum marks 

--APPROACH 1

SELECT * FROM STUDENTS
WHERE 
MARKS=(SELECT MIN(MARKS) FROM STUDENTS)
OR
MARKS=(SELECT MAX(MARKS) FROM STUDENTS)


--APPROACH 2

WITH CTE AS
(
SELECT MIN(MARKS)AS MIN_MARKS,
       MAX(MARKS)AS MAX_MARKS
FROM STUDENTS)
SELECT S.* FROM STUDENTS AS S
JOIN 
CTE ON S.MARKS=CTE.MIN_MARKS
OR S.MARKS=CTE.MAX_MARKS

--Write a SQL query to return students with maximum marks in each class

WITH CTE AS
(
SELECT *,
DENSE_RANK()OVER(PARTITION BY CLASS ORDER BY MARKS DESC)AS DRNK
FROM STUDENTS)
SELECT * FROM CTE WHERE DRNK=1


