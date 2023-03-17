USE AirProductos
GO
SELECT * FROM sys.PARTITION_FUNCTIONS;
SELECT * FROM sys.PARTITION_SCHEMES;
GO

-- Comprobamos el particionado de la tabla
SELECT *
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID ('dbo.Pedidos-Productos');
GO
-- Numero de registros en cada particion
SELECT partition_number,row_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID ('dbo.Pedidos-Productos');
GO