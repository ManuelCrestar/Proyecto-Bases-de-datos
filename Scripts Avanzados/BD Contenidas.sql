USE MASTER
GO
-- Activamos la opcion que nos muestre las opciones avanzadas
EXECUTE sp_configure 'show advanced options', 1
GO
-- Aplicamos
RECONFIGURE
GO
-- Activamos la opcion que nos deja crear bases de datos contenidas
EXECUTE sp_configure 'contained database authentication', 1
GO
RECONFIGURE
GO
-- Vamos a crear una copia de nuestros clientes en la nueva database

DROP DATABASE IF EXISTS AirProductos
GO
CREATE DATABASE AirProductos
CONTAINMENT=PARTIAL
GO
USE AirProductos
SELECT * INTO [dbo].[Pedidos-Productos]
    FROM [Airsoft].[dbo].[Pedidos-Productos]
GO

