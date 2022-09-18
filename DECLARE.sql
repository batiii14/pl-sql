--Write an anonymous block to read two numbers from the keyboard, then find out what's the maximum between these two numbers.

DECLARE

num1 number:=:num1;

num2 number:=:num2;


BEGIN







         IF num1>num2 THEN



         DBMS_OUTPUT.PUT_LINE(num1 || ' is bigger than '||num2 );



           ELSIF num2>num1 THEN



            DBMS_OUTPUT.PUT_LINE(num2 || ' is bigger than '||num1 );



             ELSE



              DBMS_OUTPUT.PUT_LINE(num1 || ' is equal to '||num2 );



END IF;







END;