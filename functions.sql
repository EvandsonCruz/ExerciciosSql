create database functions
go
use functions
go

create table produtos(
	codigo int not null,
	nome varchar(50) not null,
	valorunit decimal (7,2) not null,
	qtd int not null,
	primary key (codigo)
)

insert into produtos values
(1,'nome1',2,20),
(2,'nome2',5,9)

select * from produtos

--1a --------------------------------------------------------

create function fn_abaixoqtd()
returns int
as
begin
declare @qtd int
set @qtd = (select count(qtd) from produtos where qtd < 10)
	return(@qtd) 
end

select dbo.fn_abaixoqtd() as 'Quantidade abaixo do estoque'


--1b ---------------------------------------------------------

create function fn_abaixo()
returns @tabela table(
codigo int,
nome varchar(50),
qtd int
)
as
begin
insert @tabela (codigo,nome,qtd)
select codigo,nome,qtd from produtos where qtd < 10
	return 
end

select * from dbo.fn_abaixo()

--3a ---------------------------------------------------------

create table funcionario(
codigo int not null,
nome varchar(50) not null,
salario decimal (7,2) not null,
primary key (codigo))

create table dependente(
codigo_funcionario int,
nome_dependente varchar(50),
salario_dependente decimal(7,2),
foreign key (codigo_funcionario) references funcionario(codigo))

------------------------------------------

create function fn_tabela()
returns @tabela table(
nome_funcionario varchar(50),
nome_dependente varchar(50),
salario_funcionario decimal(7,2),
salario_dependente decimal(7,2)
)
as
begin
insert @tabela (nome_funcionario,nome_dependente,salario_funcionario,salario_dependente)
select f.nome, d.nome_dependente, f.salario, d.salario_dependente from funcionario f join
		dependente d on codigo = codigo_funcionario
	return 
end

insert into funcionario values (1,'nomefunc',2000.00)
insert into dependente values (1,'nomedep1',1000.00),(1,'nomedep2',1500.00)

select * from dbo.fn_tabela()

--3b -------------------------------------------------------------

create function fn_soma(@cod int)
returns decimal (7,2)
as
begin
	declare @soma decimal(7,2)
	set @soma = (select f.salario + sum(d.salario_dependente) from funcionario f join
		dependente d on codigo = codigo_funcionario where f.codigo = @cod group by f.salario)
	return (@soma)
end

SELECT dbo.fn_soma(1) AS 'Soma salarios'