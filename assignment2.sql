--Write an anonymous block that prompts the user to input a positive integer. It should then print the multiplication table of that number.



DECLARE

num number:=:num;

BEGIN 



      IF num>0 THEN

            FOR i IN 1..10 LOOP

            DBMS_OUTPUT.PUT_LINE(i || '*' || num ||' = ' || i*num );

            END LOOP;

      ELSE

      DBMS_OUTPUT.PUT_LINE(num || ' is not a positive integer');

      END IF;



END;