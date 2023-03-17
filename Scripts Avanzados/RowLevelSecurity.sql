USE AirProductos
GO
DROP USER IF EXISTS Luis
DROP USER IF EXISTS Jorge
GO

CREATE USER Luis WITHOUT LOGIN
CREATE USER Jorge WITHOUT LOGIN
GO

ALTER TABLE Clientes
ADD Vendedor VARCHAR(255)
GO

UPDATE Clientes
    SET Vendedor = 'Luis'
    WHERE ID_Cliente BETWEEN 1 and 5;
GO

UPDATE Clientes
    SET Vendedor = 'Jorge'
    WHERE ID_Cliente BETWEEN 6 and 10;
GO

SELECT * FROM Clientes
GO

GRANT SELECT, UPDATE ON Clientes TO Luis
GRANT SELECT, UPDATE ON Clientes TO Jorge
GO

EXECUTE AS USER = 'Luis'
GO
SELECT * FROM Clientes
GO
REVERT
GO

DROP SCHEMA IF EXISTS fun
GO
CREATE SCHEMA fun
GO


DROP FUNCTION IF EXISTS fun_vendedor_cliente
GO
CREATE OR ALTER FUNCTION fun_vendedor_cliente(@Vendedor sysname)
RETURNS TABLE
WITH SCHEMABINDING
	AS
	RETURN SELECT 1 AS acceso
	WHERE @Vendedor = USER_NAME();
GO

DROP SECURITY POLICY IF EXISTS filtro_vendedor_client
GO
CREATE SECURITY POLICY filtro_vendedor_cliente
ADD FILTER PREDICATE dbo.fun_vendedor_cliente(Vendedor) ON
dbo.Clientes
WITH (STATE = ON);
GO

EXECUTE AS USER = 'Jorge'
GO
SELECT * FROM [dbo].[Clientes]
GO
REVERT
GO
PRINT USER
GO

-- Para evitar actualizar registros ajenos, debemos añadir
-- otra caracteristica a la politica

ALTER SECURITY POLICY filtro_vendedor_cliente
ADD BLOCK PREDICATE dbo.fun_vendedor_cliente(Vendedor)
ON dbo.Clientes AFTER UPDATE
GO

ALTER SECURITY POLICY filtro_vendedor_cliente
ADD BLOCK PREDICATE dbo.fun_vendedor_cliente(Vendedor)
ON dbo.Clientes AFTER INSERT
GO