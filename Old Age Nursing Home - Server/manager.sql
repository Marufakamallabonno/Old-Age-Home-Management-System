set serveroutput on;
set verify off;
declare 
	m_id manager.managerId%type:=&managerId;
	m_pass manager.pass%type:='&password';
	checkPass number:=0;
	x Donation.name %type := '&locationToCheck';
	b Donation.amount%type; 
	---
	p_id resident.residentId%type:='&ridToUpdate';
	p_amount resident.residentId%type:='&amountToUpdate';
	
	r_id resident.residentId%type:='&ridToDelete';
	
	---
	deadCount number;
	
	deadAndNotpaid number;
	
	f number:=0;
	j_month Donation.name%type:='&enterMonthToSeeJoinedResident';
	monthCount number:=0;

begin

	select managerId into checkPass from manager where managerId=m_id and pass=m_pass;
	--update if dead
	--myPackageSite.updateResidentStatus(r_id);
	--select * from resident where residentId=2009;
	--delete 
	--myPackageSite.deleteResident(r_id);
	
	myPackageSite.updatePaymentStatus(p_id,p_amount);
	
	DBMS_OUTPUT.PUT_LINE('Highest amount donated in the old age home with information');
	b:=myPackageSite.HighestDonationCheck(x);
	DBMS_OUTPUT.PUT_LINE(b);
	
	--No of people dead with name
	DBMS_OUTPUT.PUT_LINE('List of residents who are dead');
	deadCount:=myPackage.deadCountResident(x);
	if deadCount>0 then
		DBMS_OUTPUT.PUT_LINE(deadCount ||' people are dead ');
	else
		DBMS_OUTPUT.PUT_LINE('NO dead people in list');
	end if;	
	
	--dead and did not pay
	DBMS_OUTPUT.PUT_LINE('Resident who died but didnt pay.');
	myPackage.deadAndNotpaid(x);

	--for both tables u can check the people who are due of payment.
	DBMS_OUTPUT.PUT_LINE('Resident who didnt pay bill greater than 5 months. ');
	f:=myPackageSite.paidStatusWithin5Month(x);
	if f>0 then
		DBMS_OUTPUT.PUT_LINE(f|| ' person due to pay.');
	else
		DBMS_OUTPUT.PUT_LINE('No one due to pay');
	end if;
	
	DBMS_OUTPUT.PUT_LINE('Staff under manager: '|| m_id);
	myPackage.staffUnderManager(m_id);

	--------
	DBMS_OUTPUT.PUT_LINE('Joining people in a month');
	monthCount:=myPackageSite.peopleJoinedInMonth(j_month,x);
	DBMS_OUTPUT.PUT_LINE('Number of people joined in the month '||j_month||' is: '||monthCount);
	
exception

	when no_data_found then
      dbms_output.put_line('Manager not found');
	
	
end;
/

/*set serveroutput on;
set verify off;

declare
	input1 supplier.sid%type:=&id;
	c number:=0;
	
begin
	for i in(select * from supplier) loop
		if i.sid=input1 then
			dbms_output.put_line('yee');
			delete from records where sid= input1;
			delete from supplier where sid= input1;
			c:=1;
		
		end if;
	end loop;
	if c=0 then
		insert into supplier values(input1,'A','V');
	end if;
end;
/*/
	--select residentId from resident@site_link;