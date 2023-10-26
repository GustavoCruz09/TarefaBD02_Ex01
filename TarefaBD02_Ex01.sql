Create Database TarefaBD02_Ex01
go
Use TarefaBD02_Ex01
go
Create Table Projeto (
id_Projeto			int				not null	IDENTITY(10001, 1),
nome				varchar(45)		not null,
descricao			varchar(45)		not null,
data_projeto		date			not null	CHECK(data_projeto > '2014-09-01')
Primary Key (id_Projeto)
)
go
Create Table Usuario (
id_Usuario			int				not null	IDENTITY(1, 1),
nome				varchar(45)		not null,
username			varchar(45)		not null,
senha				varchar(45)		not null	DEFAULT('123mudar'),
email				varchar(45)		not null	
Primary Key (id_Usuario)
)
go
Create Table Usuario_Projeto (
id_Usuario			int				not null,
id_Projeto			int				not null
Primary Key (id_Projeto, id_Usuario)
Foreign Key (id_Usuario) references Usuario(id_Usuario),
Foreign Key (id_Projeto) references Projeto(id_Projeto)
)

drop table Usuario_Projeto

drop table Usuario

Alter Table Usuario
Add constraint usernameUniq	 Unique	(username)

Alter Table Usuario
Alter Column senha		varchar(8)		not null

Insert Into Usuario (nome, username, email) Values
('Maria', 'Rh_maria', 'maria@empresa.com')

Insert into Usuario Values
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com')

Insert Into Usuario (nome, username, email) Values
('Ana', 'Rh_ana', 'ana@empresa.com'),
('Clara', 'Ti_clara', 'clara@empresa.com')

Insert into Usuario Values
('Aparecido', 'Ti_apareci', '55@!cido', 'aparecido@empresa.com')

Select * from Usuario

Insert into Projeto (nome, descricao, data_projeto) Values
('Re_folha', 'Refatoração das Folhas', '2014-09-05'),
('Manutenção PC`s', 'Manutenção PC`s', '2014-09-06')

Alter Table Projeto
Alter Column descricao			varchar(45)		null

Insert into Projeto (nome, data_projeto) Values
('Auditoria', '2014-09-07')

Select * from Projeto

delete Projeto
Where id_Projeto = 10004

DBCC Checkident (Projeto, RESEED, 10002)

Insert into Usuario_Projeto Values
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)

Select * from Usuario_Projeto

Update Projeto
set data_projeto = '2014-09-12'
where id_Projeto = 10002

Update Usuario
set senha = '888@*'
Where username LIKE '%Rh_maria%'

Delete Usuario_Projeto
where id_Usuario = 2