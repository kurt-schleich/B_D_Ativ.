use new_ord;

show tables;

select * from department;

select * from employee where dno = 5;

insert into department 
values('Datascience', 7, 987654321, NULL);

insert into employee (Fname, Lname, Ssn , Dno) values ('Hannibal', 'Fominha','17354237', 7);
insert into employee (Fname, Lname, Ssn , Dno) values ('Jacinto', 'Pinto','54216383', 7);

select * from employee;

select salary from employee;

update employee set Salary = 1.235 * Salary;

select salary from employee;

select Dlocation from dept_locations;

update dept_locations set Dlocation = 'Itapajé' where Dnumber = 4;

select Dlocation from dept_locations;
