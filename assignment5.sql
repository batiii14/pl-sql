/*
Student (student_id, name, email, phone_no, cgpa, department_id)

Write a program that will display the name and phone number of all students who got a cgpa greater than 3.00 in department 35.
 Use the proper cursor attribute to display how many rows returned from your query with a proper message as follows  
"The total number of honor students is: 5".

*/

DECLARE

CURSOR cursor_student IS

SELECT name ,phone_no

FROM Student 

WHERE cgpa>3 and department_id=35;

v_counter number;





BEGIN

v_counter:=0;

FOR v_student IN cursor_student

LOOP

v_counter:=v_counter+1;

DBMS_OUTPUT.PUT_LINE('Name : ' || v_student .name ||' Phone Number :' || v_student .phone_no);

END LOOP;

DBMS_OUTPUT.PUT_LINE(' The total number of honor students is : '|| v_counter);



END;