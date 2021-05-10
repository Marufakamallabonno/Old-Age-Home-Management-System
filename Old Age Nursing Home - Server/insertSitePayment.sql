set verify off;
set serveroutput on;
declare
	cnt number;
begin
	for i in (select * from payment where residentId in(select ResidentId from Resident where homeId in(select homeId from Home where address ='Chattogram')))loop
		select count(*) into cnt from payment@site_link where paymentId=i.paymentId;
		if(cnt=0) then
			insert into payment@site_link values(i.paymentId,i.residentId,i.amount,i.status);
			commit;
		end if;
	end loop;
end;
/

