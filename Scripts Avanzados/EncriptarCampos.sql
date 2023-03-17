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
     Direccion VARBINARY (128) NOT NULL ,
    )
GO

INSERT INTO Clientes (ID_Cliente,Nombre,Apellido1,Direccion)
VALUES(
    1,'Manuel','Crestar',ENCRYPTBYPASSPHRASE ('Abcd1234.','Calle Caballeros')
);
GO

SELECT * FROM Clientes
GO

SELECT ID_Cliente, Nombre, Apellido1, Apellido2, CONVERT(Varchar(255),
DECRYPTBYPASSPHRASE('Abcd1234.', Direccion)) AS Direccion
FROM Clientes
GO
