use classicmodels;
show tables;
#pesquisas com distinct, null e all
select * from orders;
select ordernumber as 'id do pedido', orderDate as 'data do pedido' from orders where shippedDate is NULL group by ordernumber;
select distinct customername from customers where customerNumber in (select all customerNumber from orders where status = 'Cancelled') order by customerName DESC;
#insert,update e delete
select * from itensvenda;
insert into itensvenda values(69, '066',24);
select * from itensvenda;
update itensvenda set venda = 0.8*venda where venda > 10;
select * from itensvenda;
delete from itensvenda where venda >10;
select * from itensvenda;
#procedimento "Padrão"
delimiter //
create procedure getallcustomers_credito_and_contato()
begin 
select distinct customername as 'cliente', creditLimit as 'dinheiro', phone as 'contato' from customers order by customerName;
END// 
delimiter ;
call getallcustomers_credito_and_contato();
#procedimento para ver os menos promissores
delimiter //
create procedure getallcustomers_credito_and_contato_ruins()
begin 
select distinct customername as 'cliente', creditLimit as 'dinheiro', phone as 'contato' from customers where creditLimit < 70000 order by customerName;
END// 
delimiter ;
call getallcustomers_credito_and_contato_ruins();
#criando trigers primeiro:
create trigger nope_nope_nope before insert on customers for each row
signal sqlstate '45000' set message_text = 'não pode aumentar';
#segundo triger:
delimiter $
create trigger check_ofcial before insert on offices for each row
begin 
delete from offices where office_code = new.officeCode;
end$
delimiter ;
select * from offices;
insert into offices values();
select * from offices;
#criando as views
create view oficios as select * from offices;
create view pagamentos as select paymentDate, amount, customerNumber from payments;