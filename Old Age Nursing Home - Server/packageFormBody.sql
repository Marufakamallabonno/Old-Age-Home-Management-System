create or replace package body myPackage as

	---Insertion in resident and transaction 
	procedure insertForm(homeId in resident.homeId%TYPE,name in resident.name%TYPE,age in resident.age%TYPE,phoneNo in resident.phoneNo%type,illness in resident.illness%TYPE,permanentAddress in resident.permanentAddress%TYPE, maritialStatus in resident.maritialStatus%TYPE,emergencyContactName in resident.emergencyContactName%TYPE,emergencyContactRelation in resident.emergencyContactRelation%TYPE,emergencyContactPhone in resident.emergencyContactPhone%TYPE,joiningDate in resident.joiningDate%TYPE,aliveDeceased in resident.aliveDeceased%TYPE,amount in payment.amount%type)
		IS
		val Resident.residentId%type;
		payment_val payment.paymentId%type;
		stat payment.status%type;
	begin
		SELECT residentId into val FROM resident WHERE residentId=(SELECT max(residentId) FROM Resident);
		val:=val+1;
		insert into Resident(residentId,homeId,name,age,phoneNo,illness,permanentAddress,maritialStatus,emergencyContactName,emergencyContactRelation,emergencyContactPhone,joiningDate,aliveDeceased) values(val, homeId,name,age,phoneNo,illness,permanentAddress,maritialStatus,emergencyContactName,emergencyContactRelation,emergencyContactPhone,joiningDate,aliveDeceased);	
		--if full paid 1000tk 
		if amount=1000.0 then
			stat:='Paid';
		else 
			stat:='Not Paid';
		end if;
		SELECT PaymentId into payment_val FROM payment WHERE paymentId=(SELECT max(paymentId) FROM Payment);
		payment_val:=payment_val+1;
		insert into Payment(paymentId,residentId,amount,status) values(payment_val,val,amount,stat);
		commit;
	end insertForm;
	
	---Donation Form insert in table
	procedure insertDonationForm(homeId in donation.homeId%TYPE,name in donation.name%TYPE,amount in donation.amount%type,accountNo in donation.accountNo%TYPE)
		IS
		Donation_val Donation.DonationId%type;
	begin
		SELECT DonationId into Donation_val FROM Donation WHERE DonationId=(SELECT max(DonationId) FROM Donation);
		Donation_val:=Donation_val+1;
		insert into Donation(donationId,homeId,name,amount,accountNo) values(Donation_val,homeId,name,amount,accountNo);
		commit;
	end insertDonationForm;	
	
	---Donation Form insert in table
	procedure totalAmountInsert(valuee in log_totalAmount.logId%TYPE)
		IS
		s log_totalAmount.amount%TYPE;
		v log_totalAmount.logId%TYPE;
	begin
		v:=valuee;
		v:=v+1;
		select sum(amount) into s from donation;
		insert into log_totalAmount(logId,amount,log_date) values(v,s,sysdate);
		commit;
		myPackageSite.balanceDonation(s,v);
	end totalAmountInsert;
	
	---Dead Count in resident table 

	function deadCountResident(x in donation.name %type )
		return number
		is 
		c number:=0;
	begin
		for i in (select * from Resident where homeId in(select homeId from home where address=x))loop
			if i.aliveDeceased='Deceased' then
				c:=c+1;
				DBMS_OUTPUT.PUT_LINE('Name: '||i.name||' Id: '||i.residentId);
			end if;
				--select residentId,aliveDeceased from Resident;
		end loop;
		return c;
	end deadCountResident;

	procedure deadAndNotpaid(x in Donation.name%type)
		is 
	begin
		for i in (select * from Resident where homeId in(select homeId from home where address=x)) loop
			if i.aliveDeceased='Deceased' then
				for j in (select status from payment where residentId in(select residentId from Resident where residentId=i.residentId )) loop
					DBMS_OUTPUT.PUT_LINE('r_Id '||i.residentId||' Emergency Contact Name: '||i.emergencyContactName||' Emergency Contact Phone: '||i.emergencyContactPhone);
				end loop;
			end if;
		end loop;
	end deadAndNotpaid;
	--select name,residentId from resident where aliveDeceased ='Deceased';
	function residentNo(id in resident.homeId%TYPE)
		return number
		is
		total number:=0;
	begin
		select count(*) into total  from resident where homeId=id;

		return total;
	end residentNo;		
	
	procedure staffUnderManager(m_id in manager.managerId%type)
		is 
	begin
		for i in (select * from Staff where managerId in(select managerId from manager where managerId=m_id)) loop
			DBMS_OUTPUT.PUT_LINE(' Staff ID: '||i.staffId||' Staff Name: '||i.name||' Type: '||i.staffType);
		end loop;
	end staffUnderManager;		
end myPackage;
/