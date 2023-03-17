USE AirProductos
GO
DROP TABLE IF EXISTS Jugadores
GO
CREATE TABLE Jugadores
	(
     ID_Jugador INTEGER NOT NULL , 
     DNI CHAR (100) NOT NULL , 
     Nombre NVARCHAR (255) NOT NULL , 
     Apellido1 NVARCHAR (255) NOT NULL , 
     Apellido2 NVARCHAR (255),
	 Direccion VARBINARY (128) NOT NULL
     )
GO

INSERT INTO Jugadores (ID_Jugador,DNI,Nombre,Apellido1,Apellido2, Direccion)
VALUES 
	(1,'12345678A','Manuel','Crestar','Sanchez',ENCRYPTBYPASSPHRASE('Estafrasemola','Calle caballeros'));
GO

SELECT * FROM Jugadores
GO

SELECT ID_Jugador,DNI,Nombre,Apellido1,Apellido2, CONVERT(VARCHAR(50),DECRYPTBYPASSPHRASE('Estafrasemola',Direccion))
FROM Jugadores
GO

DROP TABLE IF EXISTS Jugadores
GO
CREATE TABLE Jugadores
	(
     ID_Jugador INTEGER NOT NULL , 
     DNI CHAR (100) NOT NULL , 
     Nombre NVARCHAR (255) NOT NULL , 
     Apellido1 NVARCHAR (255) NOT NULL , 
     Apellido2 NVARCHAR (255),
	 Direccion VARBINARY (128) NOT NULL
     )
GO

DECLARE @v_Usuario SYSNAME
SET @v_Usuario = 'mcs'
PRINT SYSTEM_USER
INSERT INTO Jugadores (ID_Jugador,DNI,Nombre,Apellido1,Apellido2, Direccion)
VALUES (1,'12345678A','Manuel','Crestar','Sanchez',ENCRYPTBYPASSPHRASE('Estafrasemola','Calle caballeros',1,@v_Usuario));
GO

DECLARE @v_Usuario SYSNAME
SET @v_Usuario = 'mcs'
SELECT ID_Jugador,DNI,Nombre,Apellido1,Apellido2, CONVERT(VARCHAR(50),
	DECRYPTBYPASSPHRASE('Estafrasemola',Direccion,1,@v_Usuario))
FROM Jugadores
GO 