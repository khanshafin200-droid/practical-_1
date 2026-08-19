# SQL-Practical-2

CREATE TABLE StudentMarksheets (
    RollNo INT PRIMARY KEY,
    StudentName VARCHAR(50) ,
    Maths INT ,
    Science INT,
    English INT
);

INSERT INTO StudentMarksheets (RollNo, StudentName, Maths, Science, English) 
VALUES 
(101, 'rit', 92, 85, 88),
(102, 'mital', 78, 62, 80),
(103, 'Rose', 45, 52, 40),
(104, 'Snax', 95, 98, 91),
(105, 'Vorth', 32, 41, 35);

SELECT 
    RollNo,
    StudentName,
    Maths,
    Science,
    English,
    (Maths + Science + English) AS TotalMarks,
    ROUND((Maths + Science + English) / 3.0, 2) AS Percentage,
    CASE 
        WHEN (Maths + Science + English) / 3.0 >= 90 THEN 'A+'
        WHEN (Maths + Science + English) / 3.0 >= 80 THEN 'A'
        WHEN (Maths + Science + English) / 3.0 >= 70 THEN 'B'
        WHEN (Maths + Science + English) / 3.0 >= 60 THEN 'C'
        WHEN (Maths + Science + English) / 3.0 >= 50 THEN 'D'
        ELSE 'Fail'
    END AS Grade,
    CASE 
        WHEN Maths >= 40 AND Science >= 40 AND English >= 40 THEN 'Passed'
        ELSE 'Failed'
    END AS Status
FROM 
    StudentMarksheets
ORDER BY 
    TotalMarks DESC;
