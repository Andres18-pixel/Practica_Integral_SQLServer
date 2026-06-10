use master
go

create database EmpresaSQL
go

use EmpresaSQL
go

if exists (select * from sys.databases where name = 'EmpresaSQL')
begin
	drop database EmpresaSQL;
end
go

Create table TDepartamento (
	nDepartamentoID int primary key identity(1 ,1),
	cNombreDepartamento Varchar(50) unique not null
);

Create table TCargo (
	nCargoID int primary key identity(1, 1),
	cNombreCargo varchar(50) not null
);

Create table TEmpleado (
	nEmpleadoID int primary key identity(1, 1),
	CNIF varchar(20) unique,
	cNombre varchar(50),
	cApellido varchar(50),
	nDepartamentoID int,
	nCargoID int,
	dFechaContratacion date default getdate(),
	nSalario decimal(18, 2) check (nSalario > 300)
);


Alter table TEmpleado add constraint FK_Empleado_Cargo foreign key (nCargoID) references TCargo(nCargoID);

CREATE TABLE TProyecto (
    nProyectoID INT PRIMARY KEY IDENTITY(1,1),
    cNombreProyecto VARCHAR(100) NOT NULL,
    dFechaInicio DATE NOT NULL,
    dFechaFin DATE
);

CREATE TABLE TEmpleadoProyecto (
    nEmpleadoID INT,
    nProyectoID INT,
    PRIMARY KEY (nEmpleadoID, nProyectoID),
    FOREIGN KEY (nEmpleadoID) REFERENCES TEmpleado(nEmpleadoID),
    FOREIGN KEY (nProyectoID) REFERENCES TProyecto(nProyectoID)
);-- prueba de modificación
-- prueba de modificación
-- prueba de modificación
-- prueba de modificación
