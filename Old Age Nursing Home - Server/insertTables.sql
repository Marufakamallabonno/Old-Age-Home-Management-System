Drop sequence HOME_Id;
CREATE SEQUENCE HOME_Id START WITH 100 INCREMENT BY 1; 
insert into Home values(HOME_Id.NEXTVAL, 'Dhaka');
insert into Home values(HOME_Id.NEXTVAL, 'Chattogram');
select * from home;

Drop sequence Resident_Id;
CREATE SEQUENCE Resident_Id START WITH 200 INCREMENT BY 1; 
insert into Resident values(Resident_Id.NEXTVAL, 100,'Mofizur Rahman',65,'01733459558','None','Green road,Dhaka','Yes','Shelly hossain','sister','01758359591','12-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Dil ara pervin',60,'01758459591','Constipation','Halishahar,Chattogram','widow','Amit kamal','son','01737759558','10-SEP-2020','Alive');

insert into Resident values(Resident_Id.NEXTVAL, 100,'Mayisha farzana',55,'01673459558','None','Moghbazar,Dhaka','Yes','Kavery chowdhury','sister','01758358891','01-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Akash rahman',57,'01678459591','Joint pain','Or nizam road,Chattogram','Yes','Probhat Islam','son','01737744558','08-Aug-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 100,'Shruti chakroborty',62,'01773459558','Migrane','Khilgao,Dhaka','No','Toron chakroborty','son','01678358891','05-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 100,'Anika tanzim',58,'01772459491','Migrane','Baily road,Dhaka','Yes','zarah Tanzim','daughter','01737784358','22-Aug-2020','Alive');

insert into Resident values(Resident_Id.NEXTVAL, 101,'Rofiqul Islam',55,'01673459577','None','Nasirabad housing society,Chattogram','Yes','Anamta Islam','sister','01758358291','02-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Ifreet tahea',57,'01678459592','Joint pain','lalkhan bazar,Chattogram','Yes','Twinkle Itminan','daughter','01734744158','08-Aug-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 100,'Masfiq kamal',62,'01773259545','None','Khilgao,Dhaka','No','Javed kamal','son','01678358891','06-SEP-2020','Deceased');
insert into Resident values(Resident_Id.NEXTVAL, 100,'Faiza mehrab',58,'01712459479','hearing impairment','Baily road,Dhaka','Yes','Ifreet mehrab','daughter','01737784351','22-Aug-2020','Deceased');
select * from Resident;
commit;

Drop sequence Payment_Id;
CREATE SEQUENCE Payment_Id START WITH 400 INCREMENT BY 1; 
insert into Payment values(Payment_Id.NEXTVAL, 200,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 201,1000.0,'Paid');

insert into Payment values(Payment_Id.NEXTVAL, 202,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 203,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 204,400.0,'Not Paid');
insert into Payment values(Payment_Id.NEXTVAL, 205,1000.0,'Paid');

insert into Payment values(Payment_Id.NEXTVAL, 206,500.0,'Not Paid');
insert into Payment values(Payment_Id.NEXTVAL, 207,700.0,'Not Paid');
insert into Payment values(Payment_Id.NEXTVAL, 208,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 209,1000.0,'Paid');
select * from Payment;


Drop sequence Donation_Id;
CREATE SEQUENCE Donation_Id START WITH 500 INCREMENT BY 1; 
insert into Donation values(Donation_Id.NEXTVAL, 100,'Mokbul Islam',10000.0,'4637676027187343');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Sirius Black',20000.0,'1638676027187343');

insert into Donation values(Donation_Id.NEXTVAL, 100,'Ron Weasley',500.0,'2637676055187343');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Babli Kamal',5000.0,'4437676023187343');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Abanti Chakraborty',2000.0,'2327676022187323');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Faiza chowdhury',4000.0,'4257676027187343');

insert into Donation values(Donation_Id.NEXTVAL, 100,'Snehal Salsabil',60000.0,'5637676127187343');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Tonmoy Das',7000.0,'2127676027187343');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Rifah Autri',1000.0,'2125676027187343');
insert into Donation values(Donation_Id.NEXTVAL, 100,'Sabrina Tanjim',50000.0,'3277676027187343');
select * from Donation;
commit;

Drop sequence Manager_Id;
CREATE SEQUENCE Manager_Id START WITH 600 INCREMENT BY 1; 
insert into Manager values(Manager_Id.NEXTVAL, 'Omar Islam','Green road Panthopath,Dhaka','mypass1');
insert into Manager values(Manager_Id.NEXTVAL,'Khadija Tanjim','Kochukhet,Dhaka','mypass2');
commit;
select * from Manager;

Drop sequence Staff_Id;
CREATE SEQUENCE Staff_Id START WITH 700 INCREMENT BY 1; 
insert into Staff values(Staff_Id.NEXTVAL, 100,601,'Faruk Islam','Helper','Green road',25,2000.00,'01733449558','JSC');
insert into Staff values(Staff_Id.NEXTVAL, 100,600,'Homaira Alam','Cleaner','Baily Road',22,1500.00,'01673459558','SSC');

insert into Staff values(Staff_Id.NEXTVAL, 100,600,'Ron Islam','Cook','Mirpur 11',38,2500.00,'01533459558','SSC');
insert into Staff values(Staff_Id.NEXTVAL, 100,601,'Abanti Roy','Helper','Mirpur 10',28,2000.00,'01678459558','HSC');
insert into Staff values(Staff_Id.NEXTVAL, 100,600,'Shrabon Islam','Doctor','Chawkbazar',40,10000.00,'01733452258','');
insert into Staff values(Staff_Id.NEXTVAL, 100,601,'Tasnia Alam','Cleaner','Nilkhet',23,1500.00,'01673422558','HSC');

insert into Staff values(Staff_Id.NEXTVAL, 100,600,'Salsabil Islam','Doctor','Farmgate',37,10000.00,'01721459558','');
insert into Staff values(Staff_Id.NEXTVAL, 100,601,'Maitri Rahman','Cleaner','Mirpur 10',22,1500.00,'01785459558','SSC');
insert into Staff values(Staff_Id.NEXTVAL, 100,600,'Rifah Alam','Cook','Uttara',27,2500.00,'01733474558','SSC');
insert into Staff values(Staff_Id.NEXTVAL, 100,601,'Aisha Tanzim','Helper','Farmgate',25,2000.00,'01743459458','JSC');
select * from Staff;

insert into log_totalAmount values(800,0,sysdate);
commit;
--select * from resident@site_link where  residentId=(select max(residentId) from resident@site_link);