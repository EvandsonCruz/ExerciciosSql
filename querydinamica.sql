CREATE TABLE produto(
idProduto INT identity,
nome VARCHAR(100),
valor DECIMAL(7,2),
tipo CHAR(1) DEFAULT('e')
PRIMARY KEY (idProduto))
 
CREATE TABLE compra(
codigo INT identity,
produto INT NOT NULL,
qtd INT NOT NULL,
vl_total DECIMAL(7,2)
 
PRIMARY KEY (codigo, produto)
FOREIGN KEY (produto) REFERENCES produto (idProduto))
 
CREATE TABLE venda(
codigo INT identity,
produto INT NOT NULL,
qtd INT NOT NULL,
vl_total DECIMAL(7,2)
 
PRIMARY KEY (codigo, produto)
FOREIGN KEY (produto) REFERENCES produto (idProduto))

create alter procedure sp_dinamica(@idProduto int, @nome varchar(100), @qtd int, @valor decimal(7,2), @tipo char(1))
as
declare @tabela varchar(10),@query varchar(max), @vltotal decimal(7,2)
set @vltotal = @qtd * @valor
if (@tipo = 'e')
begin
	set @tabela = 'compra'
end
if (@tipo = 's')
begin
	set @tabela = 'venda'
end
set @query = 'insert into ' + @tabela + ' values('+cast(@idProduto as varchar(5))+
','''+cast(@qtd as varchar(3))+''','''+cast(@vltotal as varchar(10))+''')'
exec(@query)

insert into produto values ('nomeproduto',2.00,'e')

exec sp_dinamica 1,'nomeproduto',10,2,'e'
exec sp_dinamica 1,'nomeproduto',10,3,'s'

select * from produto
select * from compra
select * from venda