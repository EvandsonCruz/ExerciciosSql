-- Fazer um algoritmo que, dado 1 número, mostre se é múltiplo de 2,3,5 ou nenhum deles---------------------------------------------

declare @num char(1) set @num = 4
if(@num % 2 = 0)
begin
	print 'Múltiplo de 2'
end
else
if(@num % 3 = 0)
begin
	print 'Múltiplo de 3'
end
else
if(@num % 5 = 0)
begin
	print 'Múltiplo de 5'
end
else
begin
	print 'Não é múltiplo de 2,3 ou 5'
end

 -- Fazer um algoritmo que, dados 3 números, mostre o maior e o menor-----------------------------------------------------------------

 declare @num1 char(1), @num2 char(1), @num3 char(1), @maior char(1), @menor char(1)
 set @num1 = 3 set @num2 = 2 set @num3 = 1 set @maior = @num1 set @menor = @num1
 if(@num1 > @maior)
 begin
	set @maior = @num1
 end
 if(@num2 > @maior)
 begin
	set @maior = @num2
 end
 if(@num3 > @maior)
 begin
	set @maior = @num3
 end
 if(@num1 < @menor)
 begin
	set @menor = @num1
 end
 if(@num2 < @menor)
 begin
	set @menor = @num2
 end
 if(@num3 < @menor)
 begin
	set @menor = @num3
 end
 print 'O menor é: ' + @menor + '   |  O maior é: ' + @maior
 --Fazer um algoritmo que calcule os 15 primeiros termos da série de Fibonacci e a soma dos 15 primeiros termos----------------------------

 declare @i int, @v1 int, @v2 int, @v3 int, @soma int
 set @i = 1 set @v1 = -1 set @v2 = 1 set @soma = 0
 while(@i <= 15)
 begin
	set @v3 = @v1 + @v2
	set @v1 = @v2
	set @v2 = @v3
	set @soma +=  @v3
	set @i = @i + 1
 end
 print 'Soma dos 15 primeiros da sequencia de fibonacci: ' + cast(@soma as varchar(10))
 -- Fazer um algoritmo que separa uma frase, imprimindo todas as letras em maiúsculo e, depois imprimindo todas em minúsculo-----------------

 declare @frase varchar(50), @maiusculas varchar(50), @minusculas varchar(50), @letra varchar(1)
 declare @i int set @i = 1
 set @maiusculas = 0 set @minusculas = 0
 set @frase = 'EU vou passar em lab bd'
 while(@i <= len(@frase))
 begin
 set @letra = substring(@frase,@i,1)
 if (LOWER(@letra) <> @letra COLLATE LATIN1_GENERAL_CS_AI)
 begin
	set @maiusculas += @letra
 end
 if(UPPER(@letra) <> @letra COLLATE LATIN1_GENERAL_CS_AI)
 begin
	set @minusculas += @letra
 end
 set @i = @i + 1
 end
 print 'Letras maiúsculas: ' + replace(@maiusculas,0,'')
 print 'Letras minúsculas: ' + replace(@minusculas,0,'')
 
-- Fazer um algoritmo que verifica, dada uma palavra, se é, ou não, palíndromo------------------------------------------------------------------

declare @palavra varchar(30)
set @palavra = 'arara'
if (@palavra = reverse(@palavra))
begin
	print @palavra + ' é palíndromo'
end
else
begin
	print @palavra + ' não é palíndromo'
end

--Fazer um algoritmo que, dado um CPF diga se é válido--------------------------------------------------------------------------------------------

declare @cpf varchar(11), @i int, @j int, @soma varchar(3), @dv1 bit, @dv2 bit
set @i = 1 set @j = 10 set @soma = 0 set @dv1 = 0 set @dv2 = 0
set @cpf = '22233366638'
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
		print 'CPF inválido'
	end
	else
	begin
		print 'CPF válido'
	end
end

