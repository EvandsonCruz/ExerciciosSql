
--CORRIDA / MELHOR TEMPO
SELECT MIN(MENOR_VALOR) AS MENOR
			FROM
			(SELECT MIN('11:11:11:111') AS MENOR_VALOR UNION ALL SELECT MIN('22:22:22:222') ) AS MENOR

--LANÇAMENTO / MAIOR DISTANCIA
SELECT MAX(MAIOR_VALOR) AS MAIOR
			FROM
			(SELECT MAX('16.10') AS MAIOR_VALOR UNION ALL SELECT MAX('15.50') ) AS MAIOR

--RANDOM DISTANCIA/METROS
SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20))

--RANDOM TEMPO
declare @hora varchar(2), @min varchar(2), @seg varchar(2), @dec varchar(3), @concatenacao varchar(12)
set @hora = (SELECT cast(RAND()*(0-0) as int))
if (@hora < 10)
begin
	set @hora = concat(0,@hora)
end
set @min = (SELECT cast(RAND()*(59-0) as int))
if (@min < 10)
begin
	set @min = concat(0,@min)
end
set @seg = (SELECT cast(RAND()*(59-0) as int))
if (@seg < 10)
begin
	set @seg = concat(0,@seg)
end
set @dec = (SELECT cast(RAND()*(999-0) as int))
if (@dec < 10)
begin
	set @dec = concat(0,0,@dec)
end
else if (@dec < 100)
begin
	set @dec = concat(0,@dec)
end
set @concatenacao = concat(@hora,':',@min,':',@seg,':',@dec)
print @concatenacao

--------------------------
--------------------------

create database avaliacao2
go
use avaliacao2
go

---------------------CRIAÇÃO E INSERT NAS TABLES----------------------------

create table pais(
id int not null identity,
codigo char(3) not null,
nome varchar(45) not null,
primary key(id))

insert into pais values
('AFG',	' Afeganistão'),
('ALB',	' Albânia'),
('ALG',	' Argélia'),
('AND',	' Andorra'),
('ANG',	' Angola'),
('ANT',	' Antígua e Barbuda'),
('ASA',	' Samoa Americana'),
('ARG',	' Argentina'),
('ARM',	' Armênia'),
('ARU',	' Aruba'),
('AUS',	' Austrália'),
('AUT',	' Áustria'),
('AZE',	' Azerbaijão'),
('BAH',	' Bahamas'),
('BAN',	' Bangladesh'),
('BAR',	' Barbados'),
('BDI',	' Burundi'),
('BEL',	' Bélgica'),
('BEN',	' Benim'),
('BER',	' Bermudas'),
('BHU',	' Butão'),
('BIH',	' Bósnia e Herzegovina'),
('BIZ',	' Belize'),
('BLR',	' Bielorrússia'),
('BOL',	' Bolívia'),
('BOT',	' Botswana'),
('BRA',	' Brasil'),
('BRN',	' Bahrein'),
('BRU',	' Brunei'),
('BUL',	' Bulgária'),
('BUR',	' Burkina Faso'),
('CAF',	' República Centro-Africana'),
('CAM',	'Camboja Camboja'),
('CAN',	' Canadá'),
('CAY',	' Ilhas Cayman'),
('CGO',	' República do Congo'),
('CHA',	' Chade'),
('CHI',	' Chile'),
('CHN',	' China'),
('CIV',	' Costa do Marfim'),
('CMR',	' Camarões'),
('COD',	' República Democrática do Congo'),
('COK',	' Ilhas Cook'),
('COL',	' Colômbia'),
('COM',	' Comores'),
('CPV',	'Cabo Verde Cabo Verde'),
('CRC',	' Costa Rica'),
('CRO',	' Croácia'),
('CUB',	' Cuba'),
('CYP',	' Chipre'),
('CZE',	' Chéquia'),
('DEN',	' Dinamarca'),
('DJI',	' Djibouti'),
('DMA',	' Dominica'),
('DOM',	' República Dominicana'),
('ECU',	' Equador'),
('EGY',	' Egito'),
('ERI',	' Eritreia'),
('ESA',	' El Salvador'),
('ESP',	'Flag of Spain.svg Espanha'),
('EST',	' Estónia'),
('ETH',	' Etiópia'),
('FIJ',	' Fiji'),
('FIN',	' Finlândia'),
('FRA',	' França'),
('FSM',	' Estados Federados da Micronésia'),
('GAB',	' Gabão'),
('GAM',	' Gâmbia'),
('GBR',	' Reino Unido'),
('GBS',	' Guiné-Bissau'),
('GEO',	' Geórgia'),
('GEQ',	' Guiné Equatorial'),
('GER',	' Alemanha'),
('GHA',	' Gana'),
('GRE',	' Grécia'),
('GRN',	' Granada'),
('GUA',	' Guatemala'),
('GUI',	' Guiné'),
('GUM',	' Guam'),
('GUY',	' Guiana'),
('HAI',	' Haiti'),
('HKG',	' Hong Kong'),
('HON',	' Honduras'),
('HUN',	' Hungria'),
('INA',	' Indonésia'),
('IND',	' Índia'),
('IRI',	' Irão'),
('IRL',	' Irlanda'),
('IRQ',	' Iraque'),
('ISL',	' Islândia'),
('ISR',	' Israel'),
('ISV',	' Ilhas Virgens Americanas'),
('ITA',	' Itália'),
('IVB',	' Ilhas Virgens Britânicas'),
('JAM',	' Jamaica'),
('JOR',	' Jordânia'),
('JPN',	' Japão'),
('KAZ',	' Cazaquistão'),
('KEN',	' Quênia'),
('KGZ',	' Quirguistão'),
('KIR',	' Kiribati'),
('KOR',	' Coreia do Sul'),
('KOS',	' Kosovo'),
('KSA',	' Arábia Saudita'),
('KUW',	' Kuwait'),
('LAO',	' Laos'),
('LAT',	' Letônia'),
('LBA',	' Líbia'),
('LBR',	' Libéria'),
('LCA',	' Santa Lúcia'),
('LES',	' Lesoto'),
('LBN',	' Líbano'),
('LIE',	' Liechtenstein'),
('LTU',	' Lituânia'),
('LUX',	' Luxemburgo'),
('MAD',	' Madagáscar'),
('MAR',	' Marrocos'),
('MAS',	' Malásia'),
('MAW',	' Malawi'),
('MDA',	' Moldávia'),
('MDV',	' Maldivas'),
('MEX',	' México'),
('MGL',	' Mongólia'),
('MHL',	' Ilhas Marshall'),
('MKD',	'Macedónia do Norte'),
('MLI',	' Mali'),
('MLT',	' Malta'),
('MNE',	' Montenegro'),
('MON',	' Mónaco'),
('MOZ',	' Moçambique'),
('MRI',	' Maurícia'),
('MTN',	' Mauritânia'),
('MYA',	' Mianmar'),
('NAM',	' Namíbia'),
('NCA',	' Nicarágua'),
('NED',	' Países Baixos'),
('NEP',	'Flag of Nepal.svg Nepal'),
('NGR',	' Nigéria'),
('NIG',	' Níger'),
('NOR',	' Noruega'),
('NRU',	' Nauru'),
('NZL',	' Nova Zelândia'),
('OMA',	' Omã'),
('PAK',	' Paquistão'),
('PAN',	' Panamá'),
('PAR',	' Paraguai'),
('PER',	' Peru'),
('PHI',	' Filipinas'),
('PLE',	' Palestina'),
('PLW',	' Palau'),
('PNG',	' Papua-Nova Guiné'),
('POL',	' Polónia'),
('POR',	'Portugal Portugal'),
('PRK',	' Coreia do Norte'),
('PUR',	' Porto Rico'),
('QAT',	' Catar'),
('ROU',	' Roménia'),
('RSA',	' África do Sul'),
('RUS',	' Rússia'),
('RWA',	' Ruanda'),
('SAM',	' Samoa'),
('SEN',	' Senegal'),
('SEY',	' Seicheles'),
('SGP',	' Singapura'),
('SKN',	' São Cristóvão e Névis'),
('SLE',	' Serra Leoa'),
('SLO',	' Eslovênia'),
('SMR',	' San Marino'),
('SOL',	' Ilhas Salomão'),
('SOM',	' Somália'),
('SRB',	' Sérvia'),
('SRI',	' Sri Lanka'),
('SSD',	' Sudão do Sul'),
('STP',	' São Tomé e Príncipe'),
('SUD',	' Sudão'),
('SUI',	' Suíça'),
('SUR',	' Suriname'),
('SVK',	' Eslováquia'),
('SWE',	' Suécia'),
('SWZ',	' Essuatíni'),
('SYR',	' Síria'),
('TAN',	' Tanzânia'),
('TGA',	' Tonga'),
('THA',	' Tailândia'),
('TJK',	' Tajiquistão'),
('TKM',	' Turquemenistão'),
('TLS',	' Timor-Leste'),
('TOG',	' Togo'),
('TPE',	' Taipé Chinesa (Taiwan)'),
('TTO',	' Trinidad e Tobago'),
('TUN',	' Tunísia'),
('TUR',	' Turquia'),
('TUV',	' Tuvalu'),
('UAE',	' Emirados Árabes Unidos'),
('UGA',	' Uganda'),
('UKR',	' Ucrânia'),
('URU',	' Uruguai'),
('USA',	' Estados Unidos'),
('UZB',	' Uzbequistão'),
('VAN',	' Vanuatu'),
('VEN',	' Venezuela'),
('VIE',	' Vietnã'),
('VIN',	' São Vicente e Granadinas'),
('YEM',	' Iêmen'),
('ZAM',	' Zâmbia'),
('ZIM',	' Zimbabwe'),
('MIX',	'Equipes internacionais')

create table atleta(
id int not null identity,
nome varchar(45) not null,
sexo varchar(45) not null,
id_pais int not null,
primary key(id),
foreign key(id_pais) references pais(id))

create table prova(
id int not null identity,
nome varchar(45) not null,
sexo varchar(45) not null,
tipo varchar(10) not null,
recorde_mundial varchar(20) not null,
recorde_evento varchar(20) not null,
primary key(id))

create table atleta_prova(
id int not null identity,
id_atleta int not null,
id_prova int not null,
resultado1 varchar(20) null,
resultado2 varchar(20) null,
resultado3 varchar(20) null,
resultado4 varchar(20) null,
resultado5 varchar(20) null,
resultado6 varchar(20) null,
melhor varchar(20) null,
recorde_mundial char(3) default 'não',
recorde_evento char(3) default 'não',
bateria varchar(7) not null,
primary key(id),
foreign key(id_atleta) references atleta(id),
foreign key(id_prova) references prova(id))

----------------------------------------------------INSERT DE ATLETAS--------------------------

declare @i int set @i = 1
while (@i <= 16)
begin
insert into atleta values
('atleta m'+cast(@i as varchar(2)),'Masculino/Men',@i)
set @i = @i + 1
end

declare @i int set @i = 17
while (@i <= 32)
begin
insert into atleta values
('atleta f'+cast(@i as varchar(2)),'Feminino/Women',@i)
set @i = @i + 1
end

select * from atleta

--------------------------------INSERT DE DUAS PROVAS PARA TESTE-----------------------

insert into prova values
('salto triplo','Feminino/Women','distancia','15.43','14.43'),
('3000 m','Masculino/Men','tempo','00:07:53:630','00:09:53:630')

select * from prova

----------------------------CADASTRO MOCK NAS PROVAS-----------------------------
declare @i int set @i = 1
while(@i <= 16)
begin
	insert into atleta_prova (id_atleta,id_prova,bateria) values
	(@i,2,'inicial')
	set @i = @i + 1
end
go
declare @i int set @i = 17
while(@i <= 32)
begin
	insert into atleta_prova (id_atleta,id_prova,bateria) values
	(@i,1,'inicial')
	set @i = @i + 1
end

select * from atleta_prova

--------------------------------CONSULTAR BATERIA PELO ID DA PROVA E BATERIA--------------------------------

--código do atleta, o nome, o nome do país e o resultado, ordenados por desempenho.
CREATE FUNCTION fn_bateria_inicial(@id_prova int)
RETURNS @tabela TABLE(
cod_atleta			INT,
nome_atleta		VARCHAR(45),
nome_pais		VARCHAR(45),
resultado1 varchar(20),
resultado2 varchar(20),
resultado3 varchar(20),
resultado4 varchar(20),
resultado5 varchar(20),
resultado6 varchar(20),
melhor varchar(20),
recorde_mundial char(3),
recorde_evento char(3),
bateria varchar(7)
)
AS
BEGIN
	INSERT @tabela (cod_atleta, nome_atleta, nome_pais, resultado1, resultado2, resultado3, resultado4,
					resultado5, resultado6, melhor, recorde_mundial, recorde_evento, bateria)
		SELECT a.id as cod_atleta, a.nome as nome_atleta, p.nome as nome_pais, ap.resultado1, ap.resultado2, ap.resultado3, ap.resultado4, ap.resultado5, ap.resultado6,
		ap.melhor, ap.recorde_mundial, ap.recorde_evento, ap.bateria FROM atleta a
		join pais p on p.id = a.id_pais
		join atleta_prova ap on ap.id_atleta = a.id where ap.bateria = 'inicial' and ap.id_prova = @id_prova
		order by ap.melhor
	RETURN
END

CREATE FUNCTION fn_bateria_final(@id_prova int)
RETURNS @tabela TABLE(
cod_atleta			INT,
nome_atleta		VARCHAR(45),
nome_pais		VARCHAR(45),
resultado1 varchar(20),
resultado2 varchar(20),
resultado3 varchar(20),
resultado4 varchar(20),
resultado5 varchar(20),
resultado6 varchar(20),
melhor varchar(20),
recorde_mundial char(3),
recorde_evento char(3),
bateria varchar(7)
)
AS
BEGIN
	INSERT @tabela (cod_atleta, nome_atleta, nome_pais, resultado1, resultado2, resultado3, resultado4,
					resultado5, resultado6, melhor, recorde_mundial, recorde_evento, bateria)
		SELECT a.id as cod_atleta, a.nome as nome_atleta, p.nome as nome_pais, ap.resultado1, ap.resultado2, ap.resultado3, ap.resultado4, ap.resultado5, ap.resultado6,
		ap.melhor, ap.recorde_mundial, ap.recorde_evento, ap.bateria FROM atleta a
		join pais p on p.id = a.id_pais
		join atleta_prova ap on ap.id_atleta = a.id where ap.bateria = 'final' and ap.id_prova = @id_prova
		order by ap.melhor  
	RETURN
END

select * from atleta_prova

-------SE PROVA 1 (DISTANCIA) DESC---------------------

select top(8) * from fn_bateria_inicial(1) order by melhor DESC

select top(8) * from fn_bateria_inicial(2) order by melhor

select top(3) * from fn_bateria_final(2)

----------------------------------------------------------PROCEDURE(S) DE INSERÇÃO-------------------------------------------------

create alter procedure sp_insere_bateria_inicial(@id_prova int, @saida varchar(max) output)
as
begin
declare @i int, @j int set @i = 1 set @j = 1
set @saida = ''
while(@i <= 32)
begin
	if(
	(select p.tipo from prova p
	join atleta_prova ap on ap.id_prova = p.id where ap.id_atleta = @i and ap.bateria = 'inicial' and ap.id_prova = @id_prova)
	= 'tempo')
	begin
		declare @hora varchar(2), @min varchar(2), @seg varchar(2), @dec varchar(3), @concatenacao varchar(12)
		set @hora = (SELECT cast(RAND()*(0-0) as int))

		if (@hora < 10)
			begin
				set @hora = concat(0,@hora)
			end
		set @min = (SELECT cast(RAND()*(59-0) as int))

		if (@min < 10)
			begin
				set @min = concat(0,@min)
			end
		set @seg = (SELECT cast(RAND()*(59-0) as int))

			if (@seg < 10)
				begin
					set @seg = concat(0,@seg)
				end
			set @dec = (SELECT cast(RAND()*(999-0) as int))

			if (@dec < 10)
				begin
					set @dec = concat(0,0,@dec)
				end

			else if (@dec < 100)
				begin
					set @dec = concat(0,@dec)
				end
			set @concatenacao = concat(@hora,':',@min,':',@seg,':',@dec)
			if (@concatenacao > '00:55:00:00')
			begin
				set @concatenacao = 'DNF'
			end
			update atleta_prova set resultado1 = @concatenacao, melhor = @concatenacao where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			if (@concatenacao < (select recorde_mundial from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_mundial = 'sim' where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde mundial quebrado' + char(13)
				print @saida
			end
			if (@concatenacao < (select recorde_evento from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_evento = 'sim' where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde do evento quebrado' + char(13)
				print @saida
			end
			set @saida += @concatenacao + ' inserido com sucesso na tabela atleta_prova || procedure: sp_insere_bateria_inicial' + char(13)
			print @saida
		end

		if(
		(select p.tipo from prova p
		join atleta_prova ap on ap.id_prova = p.id where ap.id_atleta = @i and ap.bateria = 'inicial' and ap.id_prova = @id_prova)
		= 'distancia')
		begin
			declare @tempo varchar(20)
			set @j = 1
			while(@j <=6)
			begin				
				if(@j = 1)
				begin
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					update atleta_prova set resultado1 = @tempo where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 2)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado2 = @tempo where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 3)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado3 = @tempo where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 4)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado4 = @tempo where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 5)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado5 = @tempo where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 6)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado6 = @tempo where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
					set @j = @j + 1
				end
			end
-------------------------------------------UPDATE DA MAIOR DISTANCIA---------------------------------------
		declare @melhor decimal (5,2)
		set @melhor = (SELECT MAX(MELHOR_RESULTADO) AS MELHOR
			FROM
			(
			 SELECT MAX(try_cast(resultado1 as decimal(5,2))) AS MELHOR_RESULTADO FROM atleta_prova where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			UNION ALL
			SELECT MAX(try_cast(resultado2 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			 UNION ALL
			 SELECT MAX(try_cast(resultado3 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			UNION ALL
			SELECT MAX(try_cast(resultado4 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			 UNION ALL
			SELECT MAX(try_cast(resultado5 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			UNION ALL
			SELECT MAX(try_cast(resultado6 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
			) AS MELHOR   )

		update atleta_prova set melhor = @melhor where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
		set @saida += 'O melhor resultado do atleta id ' + cast(@i as varchar(2)) + ' foi ' + cast(@melhor as varchar(5)) + char(13)
		print @saida
		if (@melhor > (select recorde_mundial from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_mundial = 'sim' where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde mundial quebrado' + char(13)
				print @saida
			end
			if (@melhor > (select recorde_evento from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_evento = 'sim' where id_atleta = @i and bateria = 'inicial' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde do evento quebrado' + char(13)
				print @saida
			end

		end
		set @i = @i + 1
	end
	---------------------------INSERT DOS 8 MELHORES PARA BATERIA FINAL---------------
	declare @id int

	if(@id_prova = 2)
	begin

	set @i = 1
	while(@i <= 8)
	begin		
		set @id = (SELECT id_atleta FROM 
		(SELECT TOP 8 id_atleta, Row_Number() OVER (ORDER BY melhor) AS rownum
		FROM atleta_prova where id_prova = @id_prova and bateria = 'inicial') AS tbl 
		WHERE rownum = @i)

		insert into atleta_prova(id_atleta, id_prova,bateria) values(@id,@id_prova,'final')	
		set @saida += 'atleta id ' + cast(@id AS varchar(2)) + ' foi classificado para a bateria final' + char(13)
		print @saida
		set @i = @i + 1
	end	
	end
	if(@id_prova = 1)
	begin

	set @i = 1
	while(@i <= 8)
	begin 
		set @id = (SELECT id_atleta FROM 
		(SELECT TOP 8 id_atleta, Row_Number() OVER (ORDER BY melhor desc) AS rownum
		FROM atleta_prova where id_prova = @id_prova and bateria = 'inicial') AS tbl 
		WHERE rownum = @i)

		insert into atleta_prova(id_atleta, id_prova,bateria) values(@id,@id_prova,'final')	
		set @saida += 'atleta id ' + cast(@id AS varchar(2)) + ' foi classificado para a bateria final' + char(13)
		print @saida
		set @i = @i + 1
	end	
	end
end

---------------------------------------------FIM DA PROCEDURE INSERE BATERIAL INICIAL----------------------------------
-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------INICIO DA PROCEDURE INSERE BATERIA FINAL---------------------------------

create alter procedure sp_insere_bateria_final(@id_prova int, @saida varchar(max) output)
as
begin
declare @i int, @j int set @i = 1 set @j = 1
set @saida = ''
while(@i <= 32)
begin
	if(
	(select p.tipo from prova p
	join atleta_prova ap on ap.id_prova = p.id where ap.id_atleta = @i and ap.bateria = 'final' and ap.id_prova = @id_prova and p.id = @id_prova)
	= 'tempo')
	begin
		declare @hora varchar(2), @min varchar(2), @seg varchar(2), @dec varchar(3), @concatenacao varchar(12)
		set @hora = (SELECT cast(RAND()*(0-0) as int))

		if (@hora < 10)
			begin
				set @hora = concat(0,@hora)
			end
		set @min = (SELECT cast(RAND()*(59-0) as int))

		if (@min < 10)
			begin
				set @min = concat(0,@min)
			end
		set @seg = (SELECT cast(RAND()*(59-0) as int))

			if (@seg < 10)
				begin
					set @seg = concat(0,@seg)
				end
			set @dec = (SELECT cast(RAND()*(999-0) as int))

			if (@dec < 10)
				begin
					set @dec = concat(0,0,@dec)
				end

			else if (@dec < 100)
				begin
					set @dec = concat(0,@dec)
				end
			set @concatenacao = concat(@hora,':',@min,':',@seg,':',@dec)
			if (@concatenacao > '00:55:00:00')
			begin
				set @concatenacao = 'DNF'
			end
			update atleta_prova set resultado1 = @concatenacao, melhor = @concatenacao where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			if (@concatenacao < (select recorde_mundial from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_mundial = 'sim' where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde mundial quebrado' + char(13)
				print @saida
			end
			if (@concatenacao < (select recorde_evento from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_evento = 'sim' where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde do evento quebrado' + char(13)
				print @saida
			end
			set @saida += @concatenacao + ' inserido com sucesso na tabela atleta_prova || procedure: sp_insere_bateria_final' + char(13)
			print @saida
		end

		if(
		(select p.tipo from prova p
		join atleta_prova ap on ap.id_prova = @id_prova where ap.id_atleta = @i and ap.bateria = 'final' and ap.id_prova = @id_prova and p.id = @id_prova)
		= 'distancia')
		begin
			declare @tempo varchar(20)
			set @j = 1
			while(@j <=6)
			begin				
				if(@j = 1)
				begin
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					update atleta_prova set resultado1 = @tempo where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 2)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado2 = @tempo where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 3)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado3 = @tempo where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 4)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado4 = @tempo where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 5)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado5 = @tempo where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
					set @j = @j + 1
				end
				else if(@j = 6)
				begin
					if(@tempo < '1.00')
					begin
						set @tempo = 'FAULT'
					end
					set @tempo = (SELECT cast(cast(RAND()*(16-0) as decimal(5,2)) as varchar(20)))
					update atleta_prova set resultado6 = @tempo where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
					set @j = @j + 1
				end
			end
-------------------------------------------UPDATE DA MAIOR DISTANCIA---------------------------------------
		declare @melhor decimal (5,2)
		set @melhor = (SELECT MAX(MELHOR_RESULTADO) AS MELHOR
			FROM
			(
			 SELECT MAX(try_cast(resultado1 as decimal(5,2))) AS MELHOR_RESULTADO FROM atleta_prova where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			UNION ALL
			SELECT MAX(try_cast(resultado2 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			 UNION ALL
			 SELECT MAX(try_cast(resultado3 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			UNION ALL
			SELECT MAX(try_cast(resultado4 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			 UNION ALL
			SELECT MAX(try_cast(resultado5 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			UNION ALL
			SELECT MAX(try_cast(resultado6 as decimal(5,2))) FROM atleta_prova where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
			) AS MELHOR   )

		update atleta_prova set melhor = @melhor where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
		set @saida += 'O melhor resultado do atleta id ' + cast(@i as varchar(2)) + ' foi ' + cast(@melhor as varchar(5)) + char(13)
		print @saida
		if (@melhor > (select recorde_mundial from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_mundial = 'sim' where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde mundial quebrado' + char(13)
				print @saida
			end
			if (@melhor > (select recorde_evento from prova where id = @id_prova))
			begin
				update atleta_prova set recorde_evento = 'sim' where id_atleta = @i and bateria = 'final' and id_prova = @id_prova
				--poderia alterar a tabela prova
				set @saida += 'recorde do evento quebrado' + char(13)
				print @saida
			end

		end
		set @i = @i + 1
	end
	end
	

----------------------------------FIM DA PROCEDURE INSERE BATERIA FINAL---------------------------------

select * from atleta_prova where bateria = 'final' and id_prova = 2 order by melhor
select * from prova where id = 2

declare @out varchar(max)
exec sp_insere_bateria_inicial 1,@out

select * from prova

---------------------------TRIGGERS----TRIGGERS----TRIGGERS----TRIGGERS-----------------------------------

CREATE TRIGGER t_blockaltdel_atleta ON atleta
FOR UPDATE, DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Não é possível alterar ou excluir atleta', 16, 1)
END

CREATE TRIGGER t_blockaltdel_pais ON pais
FOR UPDATE, DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Não é possível alterar ou excluir país', 16, 1)
END

CREATE TRIGGER t_blockdel_resultados ON atleta_prova
FOR DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Não é possível excluir resultados', 16, 1)
END
 
--DISABLE TRIGGER t_blockaltdel_atleta ON atleta
--ENABLE TRIGGER t_blockaltdel_atleta ON atleta