--Using an implicit cursor, write an anonymous block that will add 25% to the salaries of all employees in department 50. And show in the output how many rows are affected.

BEGIN



UPDATE employees

SET salary=salary*1.25

WHERE department_id=50;

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' ROWS HAS BEEN UPDATED');

END;