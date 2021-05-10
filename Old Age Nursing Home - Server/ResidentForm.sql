
set serveroutput on;
set verify off;

declare
	r_homeId resident.homeId%TYPE:=&homeId;
	r_name resident.name%TYPE := '&ResidentName';
	r_age resident.age%TYPE:=&age;
	r_phoneNo resident.phoneNo%TYPE:='&phoneNO';
	r_illness resident.illness%TYPE:='&illness';
	r_permanentAddress resident.permanentAddress%TYPE:='&permanentAddress';
	r_maritialStatus resident.maritialStatus%TYPE:='&maritialStatus';
	r_emergencyContactName resident.emergencyContactName%TYPE:='&emergencyContactName';
	r_emergencyContactRelation resident.emergencyContactRelation%TYPE:='&emergencyContactRelation';
	r_emergencyContactPhone resident.emergencyContactPhone%TYPE:='&emergencyContactPhone';
	r_joiningDate resident.joiningDate%TYPE:='&joiningDate';	
	r_aliveDeceased resident.aliveDeceased%TYPE:='&aliveDeceased';
	p_amount Payment.amount%type:=&amount;
	
	total resident.homeId%TYPE:=0;
	
	age_check exception;
	residentNo exception;
	amount exception;
	nullValue exception;

begin
	if r_age< 55 then
			raise age_check;
	end if;
	if p_amount < 200.0 then
			raise amount;
	end if;
	
	
	if (r_homeId is NULL) OR ( r_name is NULL) OR (r_joiningDate is NULL) OR (r_phoneNo is NULL) then
		raise nullValue;
	end if;
	
	total :=myPackage.residentNo(r_homeId);
	if total > 20 then
		raise residentNo;
	end if;	
	
	if r_homeId=100 then
		myPackage.insertForm(r_homeId,r_name,r_age,r_phoneNo,r_illness,r_permanentAddress,r_maritialStatus,r_emergencyContactName,r_emergencyContactRelation,r_emergencyContactPhone,r_joiningDate,r_aliveDeceased,p_amount);
	elsif r_homeId=101 then
		myPackageSite.insertWithSiteForm(r_homeId,r_name,r_age,r_phoneNo,r_illness,r_permanentAddress,r_maritialStatus,r_emergencyContactName,r_emergencyContactRelation,r_emergencyContactPhone,r_joiningDate,r_aliveDeceased,p_amount);
	end if;
--select * from resident@site_link;
--select * from payment@site_link;

exception
	when age_check then
		dbms_output.put_line('Age cannot be less than 55');
	when amount then
		dbms_output.put_line('Must pay atleast 200Tk');
	when nullValue then
		dbms_output.put_line('Name or Account number missing. Must enter to continue.');
	when residentNo then
		dbms_output.put_line('No of seats filled up.');	
end;
/