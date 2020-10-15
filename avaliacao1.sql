create database avaliacao1
go
use avaliacao1
go

create table escola(
id int not null identity,
nome varchar(45) not null,
total_pontos decimal(4,1) not null,
primary key(id))

create table jurado(
id int not null identity,
nome varchar(45) not null,
primary key(id))

create table quesito(
id int not null identity,
nome varchar(45) not null,
primary key(id))

create table nota(
id int not null identity,
id_escola int not null,
id_jurado int not null,
id_quesito int not null,
nota decimal(4,1) not null,
primary key(id),
foreign key(id_escola) references escola(id),
foreign key(id_jurado) references jurado(id),
foreign key(id_quesito) references quesito(id))

insert into escola values
('Acadêmicos do Tatuapé',0.0),
('Rosas de Ouro',0.0), 
('Mancha Verde',0.0), 
('Vai‐Vai',0.0),
('X‐9 Paulistana',0.0),
('Dragões da real',0.0),
('Águia de Ouro',0.0),
('Nenê de Vila Matilde',0.0),
('Gaviões da Fiel',0.0), 
('Mocidade Alegre',0.0),
('Tom Maior',0.0),
('Unidos de Vila Maria',0.0),
('Acadêmicos do Tucuruvi',0.0),
('Império de Casa Verde',0.0)

insert into jurado values
('Primeiro'),
('Segundo'),
('Terceiro'),
('Quarto'),
('Quinto')

insert into quesito values
('Comissão de Frente'),
('Evolução'),
('Fantasia'), 
('Bateria'), 
('Alegoria'), 
('Harmonia'), 
('Samba‐Enredo'), 
('Mestre‐Sala e Porta‐Bandeira'),
('Enredo')

go
create procedure sp_inserenota(@idEscola int,@idJurado int,@idQuesito int,@nota varchar(4),@saida varchar(max) output)
as
begin
	if (@nota < 5.0 or @nota > 10.0)
	begin
		set @saida = 'Nota não inserida. A nota deve ser entre 5.0 e 10.0'
	end
	else if (@nota != 5.0 and @nota != 6.0 and @nota != 7.0 and @nota != 8.0 and @nota != 9.0 and @nota != 10.0)
	begin
		set @saida = 'Nota não inserida. A nota deve ser 5.0, 6.0, 7.0, 8.0, 9.0 ou 10.0'
	end
	else
	begin
		insert into nota values (@idEscola,@idJurado,@idQuesito,cast(@nota as decimal (4,1)))
		set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + ' || ID jurado: ' + cast(@idJurado as varchar(2))  + 
		' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Nota: ' + @nota +
		' || Inserido com sucesso. Tabela: Nota || Procedure: sp_inserenota'
	end
end

--testes
create table nota2(
id int not null identity,
id_escola int not null,
id_quesito int not null,
nota1 decimal(4,1) null,
nota2 decimal(4,1) null,
nota3 decimal(4,1) null,
nota4 decimal(4,1) null,
nota5 decimal(4,1) null,
maior decimal(4,1) null,
menor decimal(4,1) null,
total_quesito decimal(4,1) null,
primary key(id),
foreign key(id_escola) references escola(id),
foreign key(id_quesito) references quesito(id))


select * from nota2

create alter procedure sp_inserenota2(@idEscola int, @idQuesito int,@nota varchar(4),@saida varchar(max) output)
as
begin
	if (@nota < 5.0 or @nota > 10.0)
	begin
		set @saida = 'Nota não inserida. A nota deve ser entre 5.0 e 10.0'
	end
	else if (@nota != 5.0 and @nota != 6.0 and @nota != 7.0 and @nota != 8.0 and @nota != 9.0 and @nota != 10.0)
	begin
		set @saida = 'Nota não inserida. A nota deve ser 5.0, 6.0, 7.0, 8.0, 9.0 ou 10.0'
	end
	else
	begin
		if ((select count(id_escola) from nota2 where id_escola = @idEscola)=0)
		begin
			insert into nota2(id_escola,id_quesito,nota1) 
			values (@idEscola,@idQuesito,cast(@nota as decimal (4,1)))
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  +   
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Nota: ' + @nota + 
			' || Inserido com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'
		end
		else if ((select nota2 from nota2 where id_escola = @idEscola) is null)
			begin
			update nota2 set nota2 = @nota
			where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Nota: ' + @nota +
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'
		end
		else if ((select nota3 from nota2 where id_escola = @idEscola) is null)
			begin
			update nota2 set nota3 = @nota
			where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Nota: ' + @nota +
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'

			if ((select count(nota1) + count(nota2) + count(nota3) + count(nota4) + count(nota5)
			from nota2 where id_escola = @idEscola and id_quesito = @idQuesito)>=3)
			begin
			declare @maior decimal(4,1), @menor decimal(4,1)
			set @maior = (SELECT MAX(MAIOR_VALOR) AS MAIOR
			FROM
			(
			 SELECT MAX(nota1) AS MAIOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MAX(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MAX(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MAX(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			SELECT MAX(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			) AS MAIOR   )

			set @menor = (SELECT MIN(MENOR_VALOR) AS MENOR
			FROM
			(
			 SELECT MIN(nota1) AS MENOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MIN(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MIN(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MIN(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			SELECT MIN(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			) AS MENOR   )

			declare @total decimal(4,1)
			set @total = (select nota1 + nota2 + @nota - @maior - @menor from nota2 where id_escola = @idEscola and id_quesito = @idQuesito) 

			 update nota2 set maior = @maior, menor = @menor, total_quesito = @total
			 where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Maior: ' + cast(@maior as varchar(4)) + 
			'|| Menor: ' + cast(@menor as varchar(4)) +	'|| Total_quesito: ' + cast(@total as varchar(4)) +
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'
			end
		end
		else if ((select nota4 from nota2 where id_escola = @idEscola) is null)
			begin
			update nota2 set nota4 = @nota
			where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  +  
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Nota: ' + @nota +
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'

			if ((select count(nota1) + count(nota2) + count(nota3) + count(nota4) + count(nota5)
			from nota2 where id_escola = @idEscola and id_quesito = @idQuesito)>=3)
			begin
			--declare @maior decimal(4,1), @menor decimal(4,1)
			set @maior = (SELECT MAX(MAIOR_VALOR) AS MAIOR
			FROM
			(
			 SELECT MAX(nota1) AS MAIOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MAX(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MAX(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MAX(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			SELECT MAX(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			) AS MAIOR   )

			set @menor = (SELECT MIN(MENOR_VALOR) AS MENOR
			FROM
			(
			 SELECT MIN(nota1) AS MENOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MIN(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MIN(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MIN(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			SELECT MIN(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			) AS MENOR   )

			set @total = (select nota1 + nota2 + nota3 + @nota - @maior - @menor from nota2 where id_escola = @idEscola and id_quesito = @idQuesito) 

			 update nota2 set maior = @maior, menor = @menor, total_quesito = @total 
			 where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Maior: ' + cast(@maior as varchar(4)) + '|| Menor: ' + cast(@menor as varchar(4))+
			 '|| Total_quesito: ' + cast(@total as varchar(4))+ ' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'
			end
		end
		else if ((select nota5 from nota2 where id_escola = @idEscola) is null)
			begin
			update nota2 set nota5 = @nota 
			where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Nota: ' + @nota +
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'

			if ((select count(nota1) + count(nota2) + count(nota3) + count(nota4) + count(nota5)
			from nota2 where id_escola = @idEscola and id_quesito = @idQuesito)>=3)
			begin
			--declare @maior decimal(4,1), @menor decimal(4,1)
			set @maior = (SELECT MAX(MAIOR_VALOR) AS MAIOR
			FROM
			(
			 SELECT MAX(nota1) AS MAIOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MAX(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MAX(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MAX(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			SELECT MAX(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			) AS MAIOR   )

			set @menor = (SELECT MIN(MENOR_VALOR) AS MENOR
			FROM
			(
			 SELECT MIN(nota1) AS MENOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MIN(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			UNION ALL
			SELECT MIN(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			 SELECT MIN(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			 UNION ALL
			SELECT MIN(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
			) AS MENOR   )

			set @total = (select nota1 + nota2 + nota3 + nota4 + @nota - @maior - @menor from nota2 where id_escola = @idEscola and id_quesito = @idQuesito) 

			 update nota2 set maior = @maior, menor = @menor, total_quesito = @total 
			 where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Maior: ' + cast(@maior as varchar(4)) + 
			'|| Menor: ' + cast(@menor as varchar(4)) +	'|| Total_quesito: ' + cast(@total as varchar(4)) + 
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'
			end
		
		end
		else
		begin
			RAISERROR('Todos os jurados já deram suas notas para esta escola neste quesito', 16, 1)
		end
	end
end

declare @out varchar(max)
exec sp_inserenota2 4,1,9,@out output
print @out

select * from nota2


--se maior q 3 inserir no total_pontos da tabela escola tirando a maior e menor
if ((select count(nota1) + count(nota2) + count(nota3) + count(nota4) + count(nota5)
	from nota2 where id_escola = @idEscola and id_quesito = @idQuesito)>=3)
begin
	declare @maior decimal(4,1), @menor decimal(4,1)
	set @maior = (SELECT MAX(MAIOR_VALOR) AS MAIOR
	FROM
		(
	 SELECT MAX(nota1) AS MAIOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MAX(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MAX(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MAX(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MAX(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
		) AS MAIOR   )

	set @menor = (SELECT MIN(MENOR_VALOR) AS MENOR
	FROM
		(
	 SELECT MIN(nota1) AS MENOR_VALOR FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MIN(nota2) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MIN(nota3) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MIN(nota4) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
	 UNION ALL
	 SELECT MIN(nota5) FROM nota2 where id_escola = @idEscola and id_quesito = @idQuesito
		) AS MENOR   )

	 update nota2 set maior = @maior, menor = @menor 
	 where id_escola = @idEscola and id_quesito = @idQuesito
			set @saida = 'ID escola: ' + cast(@idEscola as varchar(2))  + 
			' || ID quesito: ' + cast(@idQuesito as varchar(2)) + '|| Maior: ' + @maior + '|| Menor: ' + @menor +
			' || Atualizado com sucesso. Tabela: Nota2 || Procedure: sp_inserenota2'
		end
end

select * from nota2
--devmedia
SELECT MAX(MAIOR_VALOR) AS MAIOR
FROM
(
  SELECT MAX(nota1) AS MAIOR_VALOR FROM nota2
  UNION ALL
  SELECT MAX(nota2) FROM nota2
  UNION ALL
  SELECT MAX(nota3) FROM nota2
  UNION ALL
  SELECT MAX(nota4) FROM nota2
  UNION ALL
  SELECT MAX(nota5) FROM nota2
) AS MAIOR  

select * from nota where id_escola = 1 and id_quesito = 1

declare @maior decimal(4,1), @menor decimal(4,1), @total decimal(4,1)
set @maior = (select max(nota) as maior from nota where id_escola = 1 and id_quesito = 1)
set @menor = (select min(nota) as menor from nota where id_escola = 1 and id_quesito = 1)
set @total = (select sum(nota) from nota where id_escola = 1 and id_quesito = 1)
set @total -= @maior
set @total -= @menor
print @maior
print @menor
print @total


select sum(nota) from nota where id_escola = 1 and id_quesito = 1

select min(nota) as menor from nota where id_escola = 1 and id_quesito = 1

declare @out varchar(max)
exec sp_inserenota 1,1,1,5.5,@out output
print @out

select * from nota

--select e.nome,q.nome,nota from nota 
--join escola e
--on e.id = id_escola
--join quesito q
--on q.id = id_quesito
--where id_quesito = 1 order by e.nome

