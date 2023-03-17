USE AirProductos
GO
DROP TABLE IF EXISTS [dbo].[Pedidos-Productos3]
GO
CREATE TABLE [dbo].[Pedidos-Productos3]
    (
    Pedidos_ID_Pedido INTEGER NOT NULL,
    Productos_ID_Producto INTEGER NOT NULL ,
    CantidadProducto INTEGER NOT NULL,
    FechaPedido DATE NOT NULL PRIMARY KEY,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    period for System_time (SysStartTime,SysEndTime)
    ) 
	with (System_Versioning = ON (History_Table = dbo.historialpedidos));
GO

UPDATE [Pedidos-Productos3]
    SET CantidadProducto = 20
    WHERE ID_Entrada = 1
GO
