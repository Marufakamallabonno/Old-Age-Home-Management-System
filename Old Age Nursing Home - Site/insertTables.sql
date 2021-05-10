Drop sequence HOME_Id;

insert into Home values(101, 'Chattogram');
select * from home;

Drop sequence Resident_Id;
CREATE SEQUENCE Resident_Id START WITH 2000 INCREMENT BY 1; 
insert into Resident values(Resident_Id.NEXTVAL, 101,'Zarin Rahman',65,'01733159558','None','Or nizam road,Chattogram','Yes','Shelly Kamal','sister','01758352291','19-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Sarah Tasmia',64,'01678454591','Hearing impairment','Halishahar,Chattogram','widow','Amit Hossain','son','01719759558','16-SEP-2020','Alive');

insert into Resident values(Resident_Id.NEXTVAL, 101,'Tasmia Islam',58,'01673459558','Joint pain','Lalkhan bazar,Chattogram','Yes','Jannat chowdhury','sister','01678348891','11-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Akash Talukder',57,'01671459591','None','Or nizam road,Chattogram','Yes','Probhat Talukder','son','01737741558','28-Aug-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Jonny Lever',62,'01773459558','None','GEC circle,Chattogram','No','Toron Lever','son','01678312491','5-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Robert Langdon',58,'01772459491','Migrane','Khulsi,Chattogram','Yes','Jennifer Langdon','daughter','01759884358','21-Aug-2020','Alive');

insert into Resident values(Resident_Id.NEXTVAL, 101,'Sienna Brooks',58,'01673459577','None','Nasirabad housing society,Chattogram','Yes','Anamta Brooks','sister','01758458291','12-SEP-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Martha Stewart',57,'01678659572','Joint pain','Lalkhan bazar,Chattogram','Yes','Twinkle Stewart','daughter','01734744988','18-Aug-2020','Alive');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Hasan Tanvir',61,'01773159547','None','Lalkhan bazar,Chattogram','No','Javed Tanvir','son','01678358551','26-SEP-2020','Deceased');
insert into Resident values(Resident_Id.NEXTVAL, 101,'Laila Mehrab',58,'01712459979','Weak vision ','Access road, Chattogram','Yes','Ifreet Islam','daughter','01737894351','12-Aug-2020','Deceased');
commit;
select residentId from Resident;

Drop sequence Payment_Id;
CREATE SEQUENCE Payment_Id START WITH 4000 INCREMENT BY 1; 
insert into Payment values(Payment_Id.NEXTVAL, 2000,700.0,'Not Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2001,1000.0,'Paid');

insert into Payment values(Payment_Id.NEXTVAL, 2002,800.0,'Not Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2003,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2004,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2005,900.0,'Not Paid');

insert into Payment values(Payment_Id.NEXTVAL, 2006,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2007,1000.0,'Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2008,200.0,'Not Paid');
insert into Payment values(Payment_Id.NEXTVAL, 2009,1000.0,'Paid');
commit;
select paymentId from Payment;


Drop sequence Donation_Id;
CREATE SEQUENCE Donation_Id START WITH 5000 INCREMENT BY 1; 
insert into Donation values(Donation_Id.NEXTVAL, 101,'Samiha Binte Alam',20000.0,'1245676027187343');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Janvi Chowdhury',20000.0,'1638789527187343');

insert into Donation values(Donation_Id.NEXTVAL, 101,'Deep Islam',100.0,'1247676055187743');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Sakib Adiat',5000.0,'9941676023187343');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Lamisa Shams',2000.0,'2584676022187122');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Ashiana Evy',10000.0,'7157676047187341');

insert into Donation values(Donation_Id.NEXTVAL, 101,'Toukir Mahmood',60000.0,'1137676227887343');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Rasif Rayan',7500.0,'3437676027187344');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Rifah Jannat',2000.0,'1425676027187348');
insert into Donation values(Donation_Id.NEXTVAL, 101,'Sabrina Alam',50000.0,'4577676027187873');
select * from Donation;
commit;

Drop sequence Manager_Id;
CREATE SEQUENCE Manager_Id START WITH 6000 INCREMENT BY 1; 
insert into Manager values(Manager_Id.NEXTVAL, 'Mostofa Kamal','Halishar L Block,Chattogram','mypass1');
insert into Manager values(Manager_Id.NEXTVAL,'Lucky Khan','OR Nizam Road,Chattogram','mypass2');
commit;
select * from Manager;



Drop sequence Staff_Id;
CREATE SEQUENCE Staff_Id START WITH 7000 INCREMENT BY 1; 
insert into Staff values(Staff_Id.NEXTVAL, 101,6001,'Faruk Mahmood','Cleaner','Green road',25,1500.00,'01733849558','JSC');
insert into Staff values(Staff_Id.NEXTVAL, 101,6000,'Sarah Alam','Helper','Baily Road',22,2000.00,'01673759518','SSC');

insert into Staff values(Staff_Id.NEXTVAL, 101,6000,'Pallavi Islam','Doctor','Mirpur 11',38,10000.00,'01534459558','FCPS');
insert into Staff values(Staff_Id.NEXTVAL, 101,6010,'Sadman Roy','Helper','Mirpur 10',28,2000.00,'01671459558','HSC');
insert into Staff values(Staff_Id.NEXTVAL, 101,6000,'Sadman Islam','Cook','Chawkbazar',40,2500.00,'01731452258','SSC');
insert into Staff values(Staff_Id.NEXTVAL, 101,6001,'Jashim Alam','Cleaner','Nilkhet',23,1500.00,'01679422558','HSC');

insert into Staff values(Staff_Id.NEXTVAL, 101,6000,'Salsabil Hossain','Doctor','Farmgate',37,10000.00,'01711459558','MBBS');
insert into Staff values(Staff_Id.NEXTVAL, 101,6001,'Zarah Rahman','Cleaner','Mirpur 10',22,1500.00,'01765459558','SSC');
insert into Staff values(Staff_Id.NEXTVAL, 101,6000,'Manav Alam','Helper','Uttara',27,2000.00,'01723474558','SSC');
insert into Staff values(Staff_Id.NEXTVAL, 101,6001,'Jannat Tanvir','Cook','Farmgate',25,2500.00,'01743459418','JSC');
select * from Staff;
commit;

insert into log_totalAmount values(8000,0,sysdate);
commit;


--select * from resident@site_link where  residentId=(select max(residentId) from resident@site_link);