
--delete existing table
drop table Home cascade constraints;
drop table Resident cascade constraints;
drop table Payment cascade constraints;
drop table Donation cascade constraints
drop table Manager cascade constraints;
drop table Staff cascade constraints;
drop table log_totalAmount;

create table Home(
homeId  integer,
address varchar2(30),
		PRIMARY KEY (homeId)
);
create table Resident(
residentId integer,
homeId  integer,
name  varchar2(30),
age	 integer CHECK (age> =55),
phoneNo  varchar2(11),
illness	 varchar2(50),
permanentAddress varchar2(50),
maritialStatus varchar2(10),
emergencyContactName varchar2(25),
emergencyContactRelation varchar2(25),
emergencyContactPhone varchar2(11),
joiningDate date,
aliveDeceased varchar2(15),
			PRIMARY KEY (residentId),
			FOREIGN KEY(homeId) REFERENCES Home(homeId)
);

create table Payment(
paymentId integer,
residentId integer,
amount DECIMAL,
status varchar2(10),
	PRIMARY KEY (paymentId),
	FOREIGN KEY(residentId) REFERENCES Resident(residentId)
);


create table Donation(
donationId integer,
homeId integer,
name varchar2(30),
amount DECIMAL,
accountNo varchar2(16),
	PRIMARY KEY (donationId),
	FOREIGN KEY(homeId) REFERENCES Home(homeId)
);
create table Manager(
managerId integer,
name varchar2(30),
address varchar2(30),
pass varchar2(30),
	PRIMARY KEY (managerId)
);
create table Staff(
staffId integer,
homeId  integer,
managerId integer,
name varchar2(30),
staffType varchar2(30),
address varchar2(30),
age integer,
salary DECIMAL (18, 2), 
phoneNo varchar2(11),
qualification varchar2(11),
	PRIMARY KEY (staffId),
	FOREIGN KEY(homeId) REFERENCES Home(homeId),
	FOREIGN KEY(managerId) REFERENCES Manager(managerId)
);
commit;


create table log_totalAmount(
logId integer,
amount DECIMAL, 
log_date date
);



commit;