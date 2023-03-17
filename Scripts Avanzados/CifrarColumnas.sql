USE AirProductos
GO
DROP TABLE IF EXISTS Clientes
GO
CREATE TABLE Clientes 
    (
     ID_Cliente INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Apellido1 VARCHAR (255) NOT NULL , 
     Apellido2 VARCHAR (255) ,
	 Direccion VARCHAR (50) NOT NULL 
    )
GO
INSERT INTO Clientes (ID_Cliente,Nombre,Apellido1,Direccion)
VALUES(
    1,'Manuel','Crestar','Calle Caballeros'
);
GO
ALTER TABLE Clientes
    ADD direccion_cifrada VARBINARY (255)
GO


DECLARE @clave NVARCHAR(255);
SET @clave = 'Abcd1234.';
UPDATE Clientes
SET direccion_cifrada = ENCRYPTBYPASSPHRASE(@clave, CONVERT(VARBINARY, Direccion));
GO