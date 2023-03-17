-- Mostramos el numero de registros que contiene cada particion
SELECT partition_number,row_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID ('dbo.Pedidos-Productos');
GO

-- Juntamos las particiones de los registros del año 2019 con los de 2020
ALTER PARTITION FUNCTION f_fecha_pedido()
    MERGE RANGE ('2019-01-01');
GO

-- Y comprobamos que en efecto, se han fusionado
SELECT partition_number,row_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID ('dbo.Pedidos-Productos');
GO