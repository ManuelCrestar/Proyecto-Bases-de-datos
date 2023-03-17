USE AirProductos
GO

DROP USER IF EXISTS Elias
GO
CREATE USER Elias WITHOUT LOGIN
GO
GRANT SELECT ON [Pedidos-Productos] TO Elias;
GO


CREATE OR ALTER PROCEDURE EstadoEnmascarado
AS
BEGIN
    SET NOCOUNT ON
    SELECT c.name, tbl.name as table_name, c.is_masked, c.masking_function
	FROM sys.masked_columns AS c
	JOIN sys.tables AS tbl
	ON c.[object_id] = tbl.[object_id]
	WHERE is_masked = 1;
END
GO

ALTER TABLE [Pedidos-Productos]
    ALTER COLUMN FechaPedido DATE MASKED WITH (FUNCTION = 'Default()');
GO

EXECUTE EstadoEnmascarado
GO

EXECUTE AS USER = 'Elias'
GO
SELECT * FROM [dbo].[Pedidos-Productos]
GO

REVERT
GO

-- Para desenmascarar
ALTER TABLE [dbo].[Pedidos-Productos]
    ALTER COLUMN FechaPedido DROP MASKED;
GO