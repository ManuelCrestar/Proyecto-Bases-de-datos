USE AirProductos
GO
DROP TABLE IF EXISTS [dbo].[Pedidos-Productos2]
GO
CREATE TABLE[dbo].[Pedidos-Productos2]
(
    Pedidos_ID_Pedido INTEGER NOT NULL ,
    Productos_ID_Producto INTEGER NOT NULL ,
    CantidadProducto INTEGER NOT NULL,
    FechaPedido DATE NOT NULL
)
    ON fecha_pedido (FechaPedido)
GO
ALTER TABLE [dbo].[Pedidos-Productos]
SWITCH PARTITION 1 to [Pedidos-Productos2] PARTITION 1
GO

SELECT partition_number, row_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID ('dbo.Pedidos-Productos');
GO

SELECT partition_number, row_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID ('dbo.Pedidos-Productos2');
GO