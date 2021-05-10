create or replace trigger trigger_log
after update
on resident
for each row

begin
	dbms_output.put_line('data updated in Resident table aliveDeceasedColumn');
end;
/

create or replace trigger trigger_log
after delete
on resident
for each row

begin
	dbms_output.put_line('data deleted in Resident table ');
end;
/
