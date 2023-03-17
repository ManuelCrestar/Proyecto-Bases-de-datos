USE Airsoft
GO
DROP TABLE IF EXISTS dbo.[Productos_Prueba]
GO
SELECT *
	into dbo.[Productos_Prueba]
	from dbo.Productos
GO

SELECT * FROM Productos_Prueba
GO

DROP DATABASE AUDIT SPECIFICATION Audioria_Productos_Prueba
GO
CREATE DATABASE AUDIT SPECIFICATION Audioria_Productos_Prueba
FOR SERVER AUDIT Log_servidor
ADD (SELECT ON OBJECT:: Airsoft.dbo.[Productos_Prueba] BY dbo),
ADD (INSERT ON OBJECT:: Airsoft.dbo.[Productos_Prueba] BY dbo),
ADD (UPDATE ON OBJECT:: Airsoft.dbo.[Productos_Prueba] BY dbo),
ADD (DELETE ON OBJECT:: Airsoft.dbo.[Productos_Prueba] BY dbo)
GO 

ALTER DATABASE AUDIT SPECIFICATION Audioria_Productos_Prueba
WITH (STATE = ON)
GO

USE Airsoft
GO
DELETE dbo.[Productos_Prueba]
	WHERE ID_Producto = 3
GO
INSERT INTO dbo.Productos_Prueba (ID_Producto,Nombre,Precio,Stock,Categoria)
VALUES
	(3,'Bolas Biodegradables',29.99,100,'Consumibles');
GO