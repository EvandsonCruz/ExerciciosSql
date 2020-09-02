--1) Criar um database, fazer uma tabela cadastro (cpf, nome, rua, numero e cep)com uma procedure que
-- só permitirá a inserção dos dados se o CPF for válido, caso contrário retornar uma mensagem de erro

create database cadastro
go
use cadastro
go

create table cadastro(
cpf varchar(11) not null,
nome varchar(100) not null,
rua varchar(100) not null,
numero int not null,
cep int not null,
primary key(cpf)
)

create procedure sp_cpf(@cpf varchar(11), @saida int output)
as
declare @i int, @j int, @soma varchar(3), @dv1 bit, @dv2 bit
set @i = 1 set @j = 10 set @soma = 0 set @dv1 = 0 set @dv2 = 0
while (@i < 10)
begin
	--declare @d@i char(1)
	--set @d@i = substring(@cpf,@i,1)	
	set @soma += (substring(@cpf,@i,1) * @j)
	set @i = @i + 1
	set @j = @j - 1
end
if(@soma%11 < 2)
begin
	if(substring(@cpf,10,1) = 0)
		begin
			set @dv1 = 1 -- 1 = true
		end
end
else
begin
	if(substring(@cpf,10,1) = (11 - @soma%11))
		begin
			set @dv1 = 1 -- 1 = true
		end
end

set @soma = 0 set @i =1 set @j = 11

while (@i < 11)
begin	
	set @soma += (substring(@cpf,@i,1) * @j)
	set @i = @i + 1
	set @j = @j - 1
end
if(@soma%11 < 2)
begin
	if(substring(@cpf,11,1) = 0)
		begin
			set @dv2 = 1 -- 1 = true
		end
end
else
begin
	if(substring(@cpf,11,1) = (11 - @soma%11))
		begin
			set @dv2 = 1 -- 1 = true
		end
end

set @i = 1 set @j = 0

if(@dv1 = 1 and @dv2 = 1)
begin
	while(@i <= 12)
	begin
		if(substring(@cpf,@i,1) = substring(@cpf,@i+1,1))
			begin
				set @j = @j + 1
			end
		set @i = @i + 1
	end
	if(@j = 11)
	begin
		set @saida = 0 --false
		RAISERROR('CPF inválido', 16, 1)
	end
	else
	begin
		set @saida = 1 --true
		print  'CPF válido'
	end
end

--declare @saida int
--exec sp_cpf '22233366638', @saida output
--print @saida

create procedure sp_inserecadastro(@cpf varchar(11), @nome varchar(100),@rua varchar(100),
@numero int, @cep int)
as
declare @saida int, @cont int
set @cont = (select count(*) from cadastro where cpf = @cpf) 
if(@cont > 0)
begin
	RAISERROR('Chave duplicada',16,1)
end
else
begin
exec sp_cpf @cpf,@saida output
if(@saida = 1)
begin
	INSERT INTO cadastro VALUES
		(@cpf, @nome, @rua, @numero, @cep)
		print 'Inserido com sucesso'
end
end

--exec sp_inserecadastro '11111111111','Fulano','Rua um',10,11111555
exec sp_inserecadastro '22233366638','Fulano','Rua um',10,11111555

select * from cadastro

--2) Criar uma nova database e resolver o exercicio 
--Aula_03a_-_Exercicio_Stored_Procedures.txt do site do professor. ---------------------------------------------------

create database academia
go
use academia
go

create table aluno(
codigo_aluno int null,
nome varchar(100) null)

create table atividade(
codigo int not null,
descricao varchar(max) not null,
imc decimal(7,2) not null,
primary key(codigo))

insert into atividade values
(1,           'Corrida + Step',                       18.5),
(2,           'Biceps + Costas + Pernas',             24.9),
(3,           'Esteira + Biceps + Costas + Pernas',   29.9),
(4,           'Bicicleta + Biceps + Costas + Pernas', 34.9),
(5,           'Esteira + Bicicleta',                  39.9)

create table atividadesaluno(
codigo_aluno int null,
nome varchar(100) null,
altura decimal (7,2) not null,
peso decimal (7,2) not null,
imc decimal (7,2) not null,
atividade varchar(30) not null)

create procedure sp_alunoatividades(@codigo_aluno int,@nome varchar(100), @altura decimal (7,2),@peso decimal (7,2))
as
declare @imc decimal (7,2),@atividade varchar(30)
set @imc = (@peso/(power(@altura,2)))

if(@imc > 40)
		begin
			set @atividade = (select top 1 descricao from atividade where codigo = 5)
			set @atividade = (select top 1 * from string_split(@atividade,' '))
		end
		else if(@imc >= 39.9)
		begin
			set @atividade = (select top 1 descricao from atividade where codigo = 5)
			set @atividade = (select top 1 * from string_split(@atividade,' '))
		end
		else if(@imc >= 34.9)
		begin
			set @atividade = (select top 1 descricao from atividade where codigo = 4)
			set @atividade = (select top 1 * from string_split(@atividade,' '))
		end
		else if(@imc >= 29.9)
		begin
			set @atividade = (select top 1 descricao from atividade where codigo = 3)
			set @atividade = (select top 1 * from string_split(@atividade,' '))
		end
		else if(@imc >= 24.9)
		begin
			set @atividade = (select top 1 descricao from atividade where codigo = 2)
			set @atividade = (select top 1 * from string_split(@atividade,' '))
		end
		else if(@imc >= 18.5)
		begin
			set @atividade = (select top 1 descricao from atividade where codigo = 1)
			set @atividade = (select top 1 * from string_split(@atividade,' '))
		end
		else
		begin
			RAISERROR('Algo deu errado',16,1)
		end

if(@codigo_aluno is null)
begin
	if(@nome is not null and @altura is not null and @peso is not null)
	begin
		insert into aluno values(@codigo_aluno,@nome)
		print ('Aluno inserido com sucesso')
		
		
		insert into atividadesaluno values(@codigo_aluno,@nome,@altura, @peso, @imc, @atividade)
		print 'atividade_aluno inserido com sucesso'		
	end
end
if(@nome is null or @nome is not null)
begin
	if(@codigo_aluno is not null and @altura is not null and @peso is not null)
	begin
		declare @cont as int
		set @cont = (select count(*) from atividadesaluno where codigo_aluno = @codigo_aluno)
		if(@cont > 1)
		begin
			update atividadesaluno set
			altura = @altura,
			peso = @peso,
			imc = @imc,			 
			atividade = @atividade
			where codigo_aluno = @codigo_aluno
			print 'Aluno_atividade alterado com sucesso'
		end
		else
		begin
			insert into atividadesaluno values(@codigo_aluno,@nome,@altura, @peso, @imc, @atividade)
			print 'atividade_aluno inserido com sucesso'
		end
	end
end

--exec sp_alunoatividades null,'fulano',1.75,80
exec sp_alunoatividades 1,'ciclano',1.75,80

select * from aluno
select * from atividadesaluno