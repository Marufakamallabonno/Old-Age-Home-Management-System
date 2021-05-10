create or replace package body myPackageSite as


	--Check the highest donation among two branches
	function HighestDonationCheck(x in Donation.name %type)
		return Donation.amount %type 
		is
		coun Donation.amount%type:=0;
		coun1 Donation.amount%type:=0;
		
	begin 
		if x='Dhaka' then
			for i in (select amount from Donation) LOOP
				if i.amount >coun then
					coun:=i.amount;
				end if;
			End LOOP;
			
			for i in (select amount,name from Donation) LOOP
				if i.amount =coun then
					DBMS_OUTPUT.PUT_LINE(i.name|| '     Dhaka');
				end if;
			End LOOP;
			return coun;
		elsif x='Chattogram' then
			for j in (select amount from Donation@site_link ) LOOP
				if j.amount >coun1 then
					coun1:=j.amount;
				end if;
			End LOOP;
			for j in (select amount,name from Donation@site_link ) LOOP
				if j.amount =coun1 then
					DBMS_OUTPUT.PUT_LINE(j.name||'      Chattogram');
				end if;
			End LOOP;
			return coun1;		
		
		elsif x='Both' then
			for i in (select amount from Donation) LOOP
				if i.amount >coun then
					coun:=i.amount;
				end if;
			End LOOP;
			for j in (select amount from Donation@site_link ) LOOP
				if j.amount >coun1 then
					coun1:=j.amount;
				end if;
			End LOOP;
			
			if coun1>coun then
			
				for j in (select amount,name from Donation@site_link ) LOOP
					if j.amount =coun1 then
						DBMS_OUTPUT.PUT_LINE(j.name||'      site');
					end if;
				End LOOP;
				return coun1;
				
			elsif coun1<coun then
				for i in (select amount,name from Donation) LOOP
					if i.amount =coun then
						DBMS_OUTPUT.PUT_LINE(i.name|| '     pc');
					end if;
				End LOOP;
				return coun;
			else
				for j in (select amount,name from Donation@site_link ) LOOP
					if j.amount =coun1 then
						DBMS_OUTPUT.PUT_LINE(j.name|| '      site');
					end if;
				End LOOP;
				for i in (select amount,name from Donation) LOOP
					if i.amount =coun then
						DBMS_OUTPUT.PUT_LINE(i.name|| '     pc');
					end if;
				End LOOP;
				return coun1;
			end if;
		
		end if;
	end HighestDonationCheck;
	
	-- balance donation procedure
	procedure balanceDonation(val in log_totalAmount.amount%TYPE,id in log_totalAmount.logId%TYPE)
			IS
			half log_totalAmount.amount%TYPE;
			ctg log_totalAmount.amount%TYPE;
			dhk log_totalAmount.amount%TYPE;
			total log_totalAmount.amount%TYPE;
			extra log_totalAmount.amount%TYPE;
			ctgId log_totalAmount.logId%TYPE;
	begin
			SELECT logId into ctgId FROM log_totalAmount@site_link WHERE logId=(SELECT max(logId) FROM log_totalAmount@site_link);
			select sum(amount) into ctg from donation@site_link;
			total:=ctg+val;
			half:=total/2;
			extra:=ABS(half-val);
			dhk:=val;
			if dhk>ctg then
				dhk:=dhk-extra;
				ctg:=ctg+extra;
				dbms_output.put_line('dhk' || dhk);
				dbms_output.put_line('ctg' || ctg);
				update log_totalAmount@site_link set amount = ctg where logId = ctgId;
				commit;
				update log_totalAmount set amount = dhk where logId = id;
				commit;
			elsif dhk<ctg then
				dhk:=dhk+extra;
				ctg:=ctg-extra;
				update log_totalAmount set amount = dhk where logId = id;
				commit;
				update log_totalAmount@site_link set amount = ctg where logId = ctgId;
				commit;
			end if;
	end balanceDonation;
	
	--Resident & payment form insert if site present
	procedure insertWithSiteForm(homeId in resident.homeId%TYPE,name in resident.name%TYPE,age in resident.age%TYPE,phoneNo in resident.phoneNo%type,illness in resident.illness%TYPE,permanentAddress in resident.permanentAddress%TYPE, maritialStatus in resident.maritialStatus%TYPE,emergencyContactName in resident.emergencyContactName%TYPE,emergencyContactRelation in resident.emergencyContactRelation%TYPE,emergencyContactPhone in resident.emergencyContactPhone%TYPE,joiningDate in resident.joiningDate%TYPE,aliveDeceased in resident.aliveDeceased%TYPE,amount in payment.amount%type)
			IS
			cnt number;
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
			for i in (select * from Resident where homeId in(select homeId from Home where address ='Chattogram'))loop
				select count(*) into cnt from Resident@site_link where residentId=i.residentId;
				if(cnt=0) then
					insert into Resident@site_link values(i.residentId,i.homeId,i.name,i.age,i.phoneNo,i.illness,i.permanentAddress,i.maritialStatus,i.emergencyContactName,i.emergencyContactRelation,i.emergencyContactPhone,i.joiningDate,i.aliveDeceased);
					commit;
				end if;
			end loop;
			cnt:=0;
			for i in (select * from payment where residentId in(select ResidentId from Resident where homeId in(select homeId from Home where address ='Chattogram')))loop
				select count(*) into cnt from payment@site_link where paymentId=i.paymentId;
				if(cnt=0) then
					insert into payment@site_link values(i.paymentId,i.residentId,i.amount,i.status);
					commit;
				end if;
			end loop;
	end insertWithSiteForm;
	
	
	--Resident & payment form delete
	procedure deleteResident(r_id in resident.residentId%type)
		IS
		r_hId resident.homeId%type;
			 
	begin
		select homeId into r_hId from resident where residentId=r_id;
		if r_hId=100 then
			delete from payment where residentId=r_id;
			delete from resident where residentId=r_id;
		elsif r_hId=101 then 
			delete from payment where residentId=r_id;
			delete from resident where residentId=r_id;
			delete from payment@site_link where residentId=r_id;
			delete from resident@site_link where residentId=r_id;
		end if;
	end deleteResident;
	
	--update resident
	procedure updateResidentStatus(r_id in resident.residentId%type)
		IS
		r_hId resident.homeId%type;			 
	begin
		select homeId into r_hId from resident where residentId=r_id;
		if r_hId=100 then
			update resident set aliveDeceased='Deceased' where residentId=r_id;
			commit;
		elsif r_hId=101 then 
			update resident set aliveDeceased='Deceased' where residentId=r_id;
			commit;
			update resident@site_link set aliveDeceased='Deceased' where residentId=r_id;
			commit;
		end if;
	end updateResidentStatus;
	
	--update payment info
	procedure updatePaymentStatus(p_id in resident.residentId%type,p_amount in payment.amount%type)
			IS	
			r_hId resident.homeId%type;	
			pay payment.amount%type:=0;	
	begin
		select homeId into r_hId from resident where residentId=p_id;
		select amount into pay from payment where residentId=p_id;
		pay:=p_amount+pay;
		if r_hId=100 then
			if pay=1000.0 then
			
				update payment set amount=pay, status='Paid'  where residentId=p_id;
				commit;
			elsif pay< 1000.0 then
				update payment set amount=pay, status='Not Paid'  where residentId=p_id;
				commit;
			end if;
		elsif r_hId=101 then
			if pay=1000.0 then
			
				update payment set amount=pay, status='Paid'  where residentId=p_id;
				update payment@site_link set amount=pay, status='Paid'  where residentId=p_id;
				commit;
			elsif pay< 1000.0 then
				update payment set amount=pay, status='Not Paid'  where residentId=p_id;
				update payment@site_link set amount=pay, status='Not Paid'  where residentId=p_id;
				commit;
			end if;		
		end if;	
		commit;
	end updatePaymentStatus;
	--paid stat within 5 month
	function paidStatusWithin5Month(x in Donation.name%type)
		return number
		is
		c integer;
		f number:=0;
		stat payment.status%type;
		id resident.homeId%type;
	begin
		if x='Dhaka'then
			select homeId into id from home where address=x;
			for i in (SELECT MONTHS_BETWEEN (SYSDATE, joiningDate) AS NUMBER_OF_MONTHS, residentId FROM resident where homeId=id) LOOP
				if ROUND(i.NUMBER_OF_MONTHS)>=5 then
					select amount into stat from payment where residentId=i.residentId;
						if stat<1000.0 then
							f:=1;
							DBMS_OUTPUT.PUT_LINE(stat|| ' '||i.residentId );
						end if;
				end if ;
				
			end LOOp;
			
		elsif x='Chattogram' then
			select homeId into id from home where address=x;
			for i in (SELECT MONTHS_BETWEEN (SYSDATE, joiningDate) AS NUMBER_OF_MONTHS, residentId FROM resident@site_link where homeId=id) LOOP
				if ROUND(i.NUMBER_OF_MONTHS)>=5 then
					select amount into stat from payment@site_link where residentId=i.residentId;
						if stat<1000.0 then
							f:=1;
							DBMS_OUTPUT.PUT_LINE(stat|| ' '||i.residentId );
						end if;
				end if ;
				
			end LOOp;
		
		elsif x='Both' then

			for i in (SELECT MONTHS_BETWEEN (SYSDATE, joiningDate) AS NUMBER_OF_MONTHS, residentId FROM resident UNION SELECT MONTHS_BETWEEN (SYSDATE, joiningDate) AS NUMBER_OF_MONTHS, residentId FROM resident@site_link)loop
				if ROUND(i.NUMBER_OF_MONTHS)>=5 then
				
					for j in (select amount,residentId from payment union select amount,residentId from payment@site_link)loop
						if j.residentId=i.residentId then
							if j.amount<1000.0 then
								DBMS_OUTPUT.PUT_LINE(j.amount|| ' '||i.residentId );
								f:=1;
							end if;
						end if;
					end loop;
				end if ;
				
			end LOOp;
		end if;
		return f;
		
	end paidStatusWithin5Month;	
	
	---No of People JOined in amonth
	function peopleJoinedInMonth(j_month in Donation.name%type,x in Donation.name%type)
		return number
		is
		c number:=0;
		id resident.homeId%type;
	begin	
		if x='Dhaka'then
		
			select homeId into id from home where address=x;
			for i in (select to_char(joiningDate,'MON') as r_month,residentId,name,joiningDate from resident where homeId=id ) LOOP
				if j_month=i.r_month then
					c:=c+1;
					DBMS_OUTPUT.PUT_LINE('residentId '||i.residentId ||' Name: ' || i.name||' JoinDate: '|| i.joiningDate);
				end if ;
			end LOOp;
		elsif x='Chattogram' then
			select homeId into id from home where address=x;
			for i in (select to_char(joiningDate,'MON') as r_month,residentId,name,joiningDate from resident@site_link where homeId=id ) LOOP
				if j_month=i.r_month then
					c:=c+1;
					DBMS_OUTPUT.PUT_LINE('residentId '||i.residentId ||' Name: ' || i.name||' JoinDate: '|| i.joiningDate);
				end if ;
			end LOOp;
		elsif x='Both' then
			for i in (select to_char(joiningDate,'MON') as r_month,residentId,name,joiningDate from resident UNION select to_char(joiningDate,'MON') as r_month,residentId,name,joiningDate from resident@site_link) LOOP
				if j_month=i.r_month then
					c:=c+1;
					DBMS_OUTPUT.PUT_LINE('residentId '||i.residentId ||' Name: ' || i.name||' JoinDate: '|| i.joiningDate);
				end if;
			end LOOp;
		end if;

		
		return c;
		
	end peopleJoinedInMonth;		

end myPackageSite;
/


