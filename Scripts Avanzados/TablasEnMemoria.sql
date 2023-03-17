USE AirProductos
GO
SELECT d.compatibility_level
	FROM sys.databases as d
	WHERE d.name = DB_NAME();
GO
-- Nuestro nivel de compatibilidad es 150 asi que tenemos que ajustar nuestra BD a ese nivel
ALTER DATABASE AirProductos
SET COMPATIBILITY_LEVEL=150;
GO

-- Habilitamos tambien su acceso en forma de snapshot
ALTER DATABASE AirProductos
SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;
GO

-- Añadiremos tambien un FILEGROUP para contener los datos
ALTER DATABASE AirProductos
ADD FILEGROUP AirProductos_mem
CONTAINS MEMORY_OPTIMIZED_DATA;
GO
ALTER DATABASE AirProductos
ADD FILE
	(
	name=N'AirProductos_mem',
	filename='C:\Datos\AirProductos'
	)
	TO FILEGROUP AirProductos_mem
GO

-- Creamos la tabla en memoria
USE AirProductos
GO
CREATE TABLE dbo.[Pedidos-Productosmem]
	(
	ID_Ficha INTEGER NOT NULL PRIMARY KEY NONCLUSTERED,
    Pedidos_ID_Pedido INTEGER NOT NULL ,
    Productos_ID_Producto INTEGER NOT NULL ,
    CantidadProducto INTEGER NOT NULL,
    FechaPedido DATE NOT NULL
	)
		WITH
			(
			MEMORY_OPTIMIZED = ON,
			DURABILITY = SCHEMA_AND_DATA
			);
GO