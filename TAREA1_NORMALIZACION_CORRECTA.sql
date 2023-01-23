
/*
Se debe aplicar normalizacion (1FN, 2FN, 3FN) según sea necesario para lograr una mayor calidad en la estructura de la base de datos.
*/
-- 1FN
CREATE TABLE Horarios (
ID int primary key,
Dia varchar(50), 
Periodo varchar(50),
TotalH int, 
Horario1 varchar (50),
Horario2 varchar (50),
Horario3 varchar (50), 
)

INSERT INTO Horarios VALUES(12,'Laborable', 'Periodo de Punta',10, '10 a 16', '18 a 19','')
INSERT INTO Horarios VALUES(123,'Laborable', 'Periodo Intermedio',9, '5 a 10', '16 a 18', '22 a 24')
INSERT INTO Horarios VALUES(1234,'Laborable', 'Periodo de Valle',5, '0 a 5','','')
INSERT INTO Horarios VALUES(505, 'Sabado', 'Periodo de Punta',2, '12 a 13','','')
INSERT INTO Horarios VALUES(606, 'Sabado', 'Periodo Intermedio',16, '6 a 12', '13 a 19', '20 a 24')
INSERT INTO Horarios VALUES(506,'Sabado', 'Periodo de Valle',6, '0 a 6','','')
INSERT INTO Horarios VALUES(007, 'Domingo o Feriado', 'Periodo de Punta',0, '','','')
INSERT INTO Horarios VALUES(707, 'Domingo o Feriado', 'Periodo Intermedio',8, '11 a 13',' 17 a 23','')
INSERT INTO Horarios VALUES(777, 'Domingo o Feriado', 'Periodo de Valle',16, '0 a 11', '13 a 17', '23 a 24')
 SELECT *FROM Horarios


--2FN

CREATE TABLE HorariosLaborable (
ID int foreign key references Horarios(ID),
DiaL varchar(50), 
PeriodoLa varchar(50)primary key  ,
TotalH int, 
Horario1 varchar (50),
Horario2 varchar (50),
Horario3 varchar (50), 

)

INSERT INTO HorariosLaborable VALUES(12,'Laborable', 'Periodo de Punta',10, '10 a 16', '18 a 19','')
INSERT INTO HorariosLaborable VALUES(123,'Laborable', 'Periodo Intermedio',9, '5 a 10', '16 a 18', '22 a 24')
INSERT INTO HorariosLaborable VALUES(1234,'Laborable', 'Periodo de Valle',5, '0 a 5','','')
SELECT *FROM HorariosLaborable

CREATE TABLE HorariosSabado (
ID int foreign key references Horarios(ID),
DiaSa varchar(50)  , 
PeriodoSa varchar (50)primary key ,
TotalH int, 
Horario1 varchar (50),
Horario2 varchar (50),
Horario3 varchar (50),  
)
INSERT INTO HorariosSabado VALUES(505, 'Sabado', 'Periodo de Punta',2, '12 a 13','','')
INSERT INTO HorariosSabado VALUES(606, 'Sabado', 'Periodo Intermedio',16, '6 a 12', '13 a 19', '20 a 24')
INSERT INTO HorariosSabado VALUES(506, 'Sabado', 'Periodo de Valle',6, '0 a 6','','')
 SELECT *FROM HorariosSabado


CREATE TABLE HorariosDomingo (
ID int foreign key references Horarios(ID),
DiaDo varchar(50), 
PeriodoDo varchar (50)primary key ,
TotalH int, 
Horario1 varchar (50),
Horario2 varchar (50),
Horario3 varchar (50),  
)
INSERT INTO HorariosDomingo VALUES(007, 'Domingo o Feriado', 'Periodo de Punta',0, '','','')
INSERT INTO HorariosDomingo VALUES(707, 'Domingo o Feriado', 'Periodo Intermedio',8, '11 a 13',' 17 a 23','')
INSERT INTO HorariosDomingo VALUES(777, 'Domingo o Feriado', 'Periodo de Valle',16, '0 a 11', '13 a 17', '23 a 24')
 SELECT *FROM HorariosDomingo


--3FN
CREATE TABLE HorariosF (
ID int foreign key references Horarios(ID),
PeriodoLa varchar(50)foreign key references HorariosLaborable(PeriodoLa) ,
TotalH int,  
)
INSERT INTO HorariosF VALUES(12,'Periodo de Punta',10)
INSERT INTO HorariosF VALUES(123,'Periodo Intermedio',9)
INSERT INTO HorariosF VALUES(1234,'Periodo de Valle',5)
 SELECT *FROM HorariosF

CREATE TABLE HorariosFi (
ID int foreign key references Horarios(ID),
PeriodoSa varchar (50) foreign key references HorariosSabado(PeriodoSa),
TotalH int,  
)
INSERT INTO HorariosFi VALUES(505, 'Periodo de Punta',2)
INSERT INTO HorariosFi VALUES(606, 'Periodo Intermedio',16)
INSERT INTO HorariosFi VALUES(506,'Periodo de Valle',6)
 SELECT *FROM HorariosFi

CREATE TABLE HorariosFeriado (
ID int foreign key references Horarios(ID),
PeriodoDo varchar (50) foreign key references HorariosDomingo(PeriodoDo),
TotalH int,  
)
INSERT INTO HorariosFeriado VALUES(007, 'Periodo de Punta',0)
INSERT INTO HorariosFeriado VALUES(707, 'Periodo Intermedio',8)
INSERT INTO HorariosFeriado VALUES(777, 'Periodo de Valle',16)
 SELECT *FROM HorariosFeriado