use new_ord;

select Fname, Lname from employee where Super_ssn is null;

select Fname, Lname from employee where Super_ssn is not null;

select distinct Pnumber from project where Pnumber in
	(select Pnumber from project, department, employee where Dnum = Dnumber and Mgr_ssn = Ssn and Lname = 'Smith')
    or
	Pnumber in
    (select Pno from works_on, Employee where Essn = Ssn and Lname = 'Smith');

select Fname, Lname from employee where Salary > all
(select Salary from employee where Dno = 5);

select * from department;

select E.Fname, E.Lname from employee as E where E.Ssn in
(select D.Essn from dependent as D where E.Fname = D.Dependent_name and E.Sex = D.Sex);

select E.Fname, E.Lname from employee as E where E.Ssn in
(select D.Essn from dependent as D where E.Fname = D.Dependent_name or E.Sex = D.Sex);

select Fname, Lname from employee where not exists(
select * from dependent where Ssn = Essn);

select Fname, Lname from employee where exists(
select * from dependent where Ssn = Essn)
and exists
(select * from department where Ssn = Mgr_ssn);

select sum(Salary),max(Salary),Min(Salary),Avg(Salary) from employee;

select sum(Salary) as gasto_total, max(Salary) as Giga, Min(Salary) as Menor, Avg(Salary) as média from employee where Dno = 4;

select sum(Salary) as gasto_total, max(Salary) as Giga, Min(Salary) as Menor, Avg(Salary) as média from (employee join department on dno = Dnumber) where Dname = 'Research';

#contar quantidades:
select count(*) from employee;

select count(*) from employee, department where Dno = Dnumber and Dname = 'Research';

select Fname,Lname from employee where(
select count(*) from dependent where ssn = Essn) >= 2;

#Agrupamento
select Dno, count(*), AVG(salary) from employee group by Dno;

select Pnumber, Pname, count(*) as empregados from project,works_on where Pnumber = Pno group by Pnumber, Pname;

#selecionando apenas quem tem mais de 2 empregados 
select Pnumber, Pname, count(*) as empregados from project,works_on where Pnumber = Pno group by Pnumber, Pname having count(*) > 2;

select Pnumber, Pname, count(*)as empregados from project,works_on, employee where Pnumber = Pno and Ssn = Essn and Dno = 5 group by Pnumber, Pname;

select Dno, count(*) from employee where Salary > 4000 group by Dno having count(*) > 3;