create table curso(
codigo_curso int not null,
nome varchar(70) not null,
sigla varchar(10) not null,
primary key (codigo_curso))

insert into curso values
(1, 'analise e desenvolvimento de sistemas', 'ads')

create table aluno(
ra char(7) not null,
nome varchar(250) not null,
codigo_curso int not null,
primary key(ra),
foreign key(codigo_curso) references curso(codigo_curso))

insert into  aluno values
('1234567','fulano', 1)

create table palestrante(
codigo_palestrante int identity,
nome varchar(250) not null,
empresa varchar(100) not null,
primary key (codigo_palestrante))

insert into palestrante values
('cicrano','cps')

create table palestra(
codigo_palestra int identity,
titulo varchar(max) not null,
carga_horaria int null,
data datetime not null,
codigo_palestrante int not null,
primary key(codigo_palestra),
foreign key (codigo_palestrante) references palestrante(codigo_palestrante))

insert into palestra values
('novidades',4,'17/08/2020',1)

create table nao_alunos(
rg varchar(9) not null,
orgao_exp char(5) not null,
nome varchar(250) not null,
primary key (rg,orgao_exp))

insert into nao_alunos values
('123456789','sessp','beltrano')

create table alunos_inscritos(
ra char(7) not null,
codigo_palestra int not null,
foreign key (ra) references aluno(ra),
foreign key (codigo_palestra) references palestra(codigo_palestra))

insert into alunos_inscritos values
('1234567',1)

create table nao_alunos_inscritos(
codigo_palestra int not null,
rg varchar(9) not null,
orgao_exp char(5) not null,
foreign key (codigo_palestra) references palestra(codigo_palestra),
foreign key (rg,orgao_exp) references nao_alunos(rg,orgao_exp))

insert into nao_alunos_inscritos values
(1,'123456789','sessp')


create view v_certificado
as
select a.ra as num_documento, a.nome as nome_pessoa, titulo as titulo_palestra, pt.nome as nome_palestrante, p.carga_horaria, p.data from aluno a join
alunos_inscritos ai on a.ra = ai.ra join
palestra p on p.codigo_palestra = ai.codigo_palestra join
palestrante pt on pt.codigo_palestrante = p.codigo_palestrante
where ai.codigo_palestra = 1
union
select nai.rg + ' ' + nai.orgao_exp as num_documento, na.nome as nome_pessoa, titulo as titulo_palestra, pt.nome as nome_palestrante, p.carga_horaria, p.data from nao_alunos_inscritos nai join
nao_alunos na on nai.RG = na.RG AND nai.Orgao_Exp = na.Orgao_Exp join
palestra p on p.codigo_palestra = nai.codigo_palestra join
palestrante pt on pt.codigo_palestrante = p.codigo_palestrante
where nai.codigo_palestra = 1

select * from v_certificado order by nome_pessoa




