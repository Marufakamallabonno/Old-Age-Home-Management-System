create or replace view residentPayment(id, name, age,joinDate,stat) as
SELECT R.residentId,R.name,R.age,R.joiningDate,P.status
FROM resident R, Payment P 
where joiningDate LIKE '%-SEP%' and  R.residentId=P.residentId;

select * from residentPayment;
commit;

