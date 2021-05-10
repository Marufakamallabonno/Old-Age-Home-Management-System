
set serveroutput on;
set verify off;

declare
	d_homeId donation.homeId%TYPE:=&homeId;
	d_name donation.name%TYPE:='&name';
	d_amount donation.amount%type:=&amount;
	d_accountNo donation.accountNo%TYPE:='&accountNo';
	val donation.amount%TYPE := 0;
	nullValue exception;

begin
	if (d_name is NULL) OR ( d_accountNo is NULL) then
		raise nullValue;
	end if;
	myPackage.insertDonationForm(d_homeId,d_name,d_amount,d_accountNo);

	
	
	SELECT logId into val FROM log_totalAmount WHERE logId=(SELECT max(logId) FROM log_totalAmount);
	myPackage.totalAmountInsert(val);
exception
	when nullValue then
		dbms_output.put_line('Name or Account number missing. Must enter to continue.');
end;
/