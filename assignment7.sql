/*
Cruise(cid, name, number_of_days, price, number_of_stops)

Port(pid, city, country, number_of_stars, capacity)

Stops(cid, pid, stopno, stopduration)

Assume that the number_of_stops attribute of the Cruise table contains the total number of stops for each cruise. 
Write a trigger that will be fired whenever the Stops table is modified to increase or decrease the number_of_stops value accordingly.

*/

Cruise(cid, name, number_of_days, price, number_of_stops)

Port(pid, city, country, number_of_stars, capacity)

Stops(cid, pid, stopno, stopduration)

Assume that the number_of_stops attribute of the Cruise table contains the total number of stops for each cruise. 
Write a trigger that will be fired whenever the Stops table is modified to increase or decrease the number_of_stops value accordingly.


create or replace trigger nofstops

after insert or delete on stops 

for each row 

declare 

v_stops cruise.number_of_stops%type;



cursor mycursor is 

select number_of_stops 

from cruise;

begin 

open mycursor;

loop 

fetch mycursor into v_stops;

exit when mycursor%notfound;

if inserting then 

v_stops := v_stops +1;

elsif deleting then 

v_stops := v_stops -1;

end if;

update cruise 

set number_of_stops = v_stops;

end loop;

close mycursor;

end;