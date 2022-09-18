/*
Takes(studentId, CourseCode, Mark)

Course(CourseCode, Title, credits,deptno)

Student(studentId, Name, Deptno)

Use the following table to write a procedure that increases the mark of students in a given course. 
The procedure will accept a courseCode and a extramark as input parameter. 
Marks of all students of the course, that matches the coursecode parameter ,
 will be increased by adding extramark to the mark. 
Make sure that the final value of mark (after the addition) does not exceed 100.

*/


CREATE OR REPLACE PROCEDURE increaseMark(courseCode IN number,EXTRAMARK IN NUMBER)
IS

BEGIN
UPDATE takes
SET mark=mark+extramark
WHERE CourseCode=courseCode and mark+extramark<=100;
END;