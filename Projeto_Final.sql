use acidente_trans;
select * from consequences;
select * from veiculo;
select * from afligido;
select * from localidade;
select * from momento;

show tables;
#pesquisas com distinct, null e all
select modelo from veiculo where placa in (select distinct veiculo from afligido where Pontuacao is null);
select all Id_acidente as 'numero do acidente', n_afetados as 'vitimas' from consequences;
#insert,update e delete
select * from veiculo;
insert into veiculo values('random','PIK9B99');
select * from veiculo;
update veiculo set modelo = null where modelo = 'random';
select * from veiculo;
delete from veiculo where modelo = null;
select * from veiculo;
#procedimento para umas facilidades
delimiter //
create procedure sem_CNH()
begin 
select * from afligidos where CNH is null;
END// 
delimiter ;
call sem_CNH();
#criando trigers primeiro:
create trigger CPF_inaltera before delete on CPF for each row
signal sqlstate '45000' set message_text = 'não pode deletar';
#segundo triger:
delimiter $
create trigger data_exata before insert on Id_acidente for each row
begin 
insert into momento(tempo,acidente) values(now(),Id_acidente);
end$
delimiter ;
select * from consequences,momento;
insert into consequences(Id_acidente) values('teste12345');
select * from consequences,momento;
#criando as views
create view num_pedestres as select envolvimento as 'código do acidente', n_afetados as 'quantidade total', count(CPF) as 'pedestres' from consequences, afligido where (CPF is null) and (envolvimento = Id_acidente) group by Id_acidente;




#insert into veiculo values('','');
#insert into consequences(Id_acidente,n_afetados) values('',I);
#insert into afligido(CPF,CNH,situacao,envolvimento,veiculo) values('','','','','');
#insert into afligido(CPF,situacao,envolvimento) values('','','');
#insert into localidade(estado,cidade,acidente) values('','','');
#insert into momento(meteorologico,acidente) values('','');

