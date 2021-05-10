set verify off;
set serveroutput on;
declare
	cnt number;
begin
	for i in (select * from Resident where homeId in(select homeId from Home where address ='Chattogram'))loop
		select count(*) into cnt from Resident@site_link where residentId=i.residentId;
		if(cnt=0) then
			insert into Resident@site_link values(i.residentId,i.homeId,i.name,i.age,i.phoneNo,i.illness,i.permanentAddress,i.maritialStatus,i.emergencyContactName,i.emergencyContactRelation,i.emergencyContactPhone,i.joiningDate,i.aliveDeceased);

			commit;
		end if;
	end loop;
end;
/

