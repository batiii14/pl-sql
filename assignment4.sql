/*
Student (student_id, name, email, phone_no, cgpa, department_id)

Using the table above, write a program that will display a student with the id 1653, the program will display the name and the cgpa of that student.  

- Handle one relevant exception.

- Handle any other exception that may happen by displaying a proper message. 

*/


DECLARE

v_student_name varchar2(50);

v_cgpa number;

BEGIN



SELECT s.name,s.cgpa 

INTO v_student_name,v_cgpa

FROM Student s

WHERE s.student_id=1653;





DBMS_OUTPUT.PUT_LINE('NAME :'|| v_student_name);

DBMS_OUTPUT.PUT_LINE('CGPA : '|| v_cgpa);





EXCEPTION



WHEN NO_DATA_FOUND THEN

DBMS_OUTPUT.PUT_LINE('SORRY THERE IS NO SUCH PERSON WITH THAT INFORMATION'); 

WHEN OTHERS THEN   

DBMS_OUTPUT.PUT_LINE('SORRY SOMETHING WENT WRONG...');



END;