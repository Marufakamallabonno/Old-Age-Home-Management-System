create or replace package myPackage as
	
	procedure insertForm(homeId in resident.homeId%TYPE,name in resident.name%TYPE,age in resident.age%TYPE,phoneNo in resident.phoneNo%type,illness in resident.illness%TYPE,permanentAddress in resident.permanentAddress%TYPE, maritialStatus in resident.maritialStatus%TYPE,emergencyContactName in resident.emergencyContactName%TYPE,emergencyContactRelation in resident.emergencyContactRelation%TYPE,emergencyContactPhone in resident.emergencyContactPhone%TYPE,joiningDate in resident.joiningDate%TYPE,aliveDeceased in resident.aliveDeceased%TYPE,amount in payment.amount%type);
	procedure insertDonationForm(homeId in donation.homeId%TYPE,name in donation.name%TYPE,amount in donation.amount%type,accountNo in donation.accountNo%TYPE);
	procedure totalAmountInsert(valuee in log_totalAmount.logId%TYPE);
	function deadCountResident(x in Donation.name %type )
		return number;
	procedure deadAndNotpaid(x in Donation.name%type);
	function residentNo(id in resident.homeId%TYPE)
		return number;		
	procedure staffUnderManager(m_id in manager.managerId%type);
end myPackage;
/