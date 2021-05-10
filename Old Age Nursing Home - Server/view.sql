create or replace view residentInfo(id, name, age,joinDate) as
SELECT R.residentId,R.name,R.age,R.joiningDate
FROM resident R
UNION 
SELECT R1.residentId,R1.name,R1.age,R1.joiningDate
FROM resident@site_link R1;
select * from residentInfo;
commit;


create or replace view residentInfo2(id, name, age,Status,phoneNo) as
SELECT R.residentId,R.name,R.age,R.aliveDeceased,R.phoneNo
FROM resident R
where R.illness='None' and R.aliveDeceased='Alive'
UNION 
SELECT R1.residentId,R1.name,R1.age,R1.aliveDeceased,R1.phoneNo
FROM resident@site_link R1
where R1.illness='None' and R1.aliveDeceased='Alive';
select * from residentInfo2;
commit;

--list of staff under manger=600;
create or replace view managerAndStaff(M_Id,S_Id,name,S_Type) as
SELECT M.managerId,S.staffId,S.name,S.staffType
FROM manager M, Staff S
where M.managerId=S.managerId and S.staffType!='Doctor';

select * from managerAndStaff;
commit;


