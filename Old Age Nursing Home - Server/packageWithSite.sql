create or replace package myPackageSite as

	function HighestDonationCheck(x in Donation.name %type)
		return Donation.amount%type;
	procedure balanceDonation(val in log_totalAmount.amount%TYPE,id in log_totalAmount.logId%TYPE);
	procedure insertWithSiteForm(homeId in resident.homeId%TYPE,name in resident.name%TYPE,age in resident.age%TYPE,phoneNo in resident.phoneNo%type,illness in resident.illness%TYPE,permanentAddress in resident.permanentAddress%TYPE, maritialStatus in resident.maritialStatus%TYPE,emergencyContactName in resident.emergencyContactName%TYPE,emergencyContactRelation in resident.emergencyContactRelation%TYPE,emergencyContactPhone in resident.emergencyContactPhone%TYPE,joiningDate in resident.joiningDate%TYPE,aliveDeceased in resident.aliveDeceased%TYPE,amount in payment.amount%type);
	procedure deleteResident(r_id in resident.residentId%type);
	procedure updateResidentStatus(r_id in resident.residentId%type);
	procedure updatePaymentStatus(p_id in resident.residentId%type,p_amount in payment.amount%type);
	function paidStatusWithin5Month(x in Donation.name%type)
		return number;
	function peopleJoinedInMonth(j_month in Donation.name%type, x in Donation.name%type)
		return number;
end myPackageSite;
/