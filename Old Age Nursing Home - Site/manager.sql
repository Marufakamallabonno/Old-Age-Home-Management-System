set serveroutput on;

set verify off;

declare 
	m_id manager.managerId%type:=&managerId;
	m_pass manager.pass%type:='&password';
	checkPass number:=0;
	x Donation.name %type := 'Chattogram';
	b Donation.amount%type; 
	---
	deadCount number;
	r_id resident.residentId%type:='&ridToDelete';
	p_id resident.residentId%type:='&ridToUpdate';
	p_amount resident.residentId%type:='&amountToUpdate';
	f number:=0;
	
	j_month Donation.name%type:='&enterMonthToSeeJoinedResident';
	monthCount number:=0;

begin

	select managerId into checkPass from manager where managerId=m_id and pass=m_pass;
	--myPackage.updateResidentStatus(r_id);
	
	myPackage.updatePaymentStatus(p_id,p_amount);
	--myPackage.deleteResident(r_id);
	
	

	DBMS_OUTPUT.PUT_LINE('Highest amount donated in the old age home with information');
	DBMS_OUTPUT.PUT_LINE('');
	b:=myPackage.HighestDonationCheck(x);
	DBMS_OUTPUT.PUT_LINE(b);
	
	DBMS_OUTPUT.PUT_LINE('List of residents who are dead');
	DBMS_OUTPUT.PUT_LINE('');
	deadCount:=myPackage.deadCountResident(x);
	if deadCount>0 then
		DBMS_OUTPUT.PUT_LINE(deadCount ||' people are dead ');
	else
		DBMS_OUTPUT.PUT_LINE('NO dead people in list');
	end if;
	
	--dead and did not pay
	DBMS_OUTPUT.PUT_LINE('Resident who died but didnt pay.');
	DBMS_OUTPUT.PUT_LINE('');
	myPackage.deadAndNotpaid(x);   --2009,2010

	--for both tables u can check the people who are due of payment.
	DBMS_OUTPUT.PUT_LINE('Resident who didnt pay bill greater than 5 months. ');
	DBMS_OUTPUT.PUT_LINE('');
	f:=myPackage.paidStatusWithin5Month(x);
	if f>0 then
		DBMS_OUTPUT.PUT_LINE(f|| ' person due to pay.');
	else
		DBMS_OUTPUT.PUT_LINE('No one due to pay');
	end if;
	
	
	DBMS_OUTPUT.PUT_LINE('Staff under manager: '|| m_id);
	DBMS_OUTPUT.PUT_LINE('');
	myPackage.staffUnderManager(m_id);
	
	
	DBMS_OUTPUT.PUT_LINE('Joining people in a month');
	DBMS_OUTPUT.PUT_LINE('');
	monthCount:=myPackage.peopleJoinedInMonth(j_month);
	DBMS_OUTPUT.PUT_LINE('Number of people joined in the month '||j_month||' is: '||monthCount);
	
exception

	when no_data_found then
      dbms_output.put_line('Manager not found');

	
end;
/