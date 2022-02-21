-- CREAR BASE DE DATOS
CREATE DATABASE CRUD_SCP
GO 
USE CRUD_SCP

-- CREAR TABLA CLASE (SCP)
CREATE TABLE clase_scp(
NomClas varchar(40) NOT NULL,
CodClas int NOT NULL primary key)

-- CREAR TABLA AUTOR
CREATE TABLE autor(
CodAut int NOT NULL primary key IDENTITY,
AliasAut varchar(40) NOT NULL,
FechAut date NOT NULL,
CorreoAut varchar(40) NOT NULL,
ContrasAut varchar(40) NOT NULL,)

-- CREAR TABLA SCP
CREATE TABLE scp(
CodScp int primary key NOT NULL,
NomScp varchar(40) NOT NULL,
AliasScp varchar(40),
FechScp date,
EstadoScp varchar(40) NOT NULL,
DescrScp varchar(8000) NOT NULL,
LocScp varchar(40) NOT NULL,
CodAut int foreign key REFERENCES autor(CodAut) NOT NULL,
CodClas int foreign key REFERENCES clase_scp(CodClas) NOT NULL)