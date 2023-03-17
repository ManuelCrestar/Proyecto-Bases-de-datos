
USE AirProductos
GO
ALTER DATABASE AirProductos
ADD FILEGROUP [2018]
GO
ALTER DATABASE AirProductos
ADD FILEGROUP [2021]
GO
ALTER DATABASE AirProductos
ADD FILE
    (
    NAME = [Pedidos2018],
    FILENAME= 'C:\Particiones\Pedidos2018.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
    )
    TO FILEGROUP [2018];
GO
ALTER DATABASE AirProductos
ADD FILE
    (
    NAME = [Pedidos2021],
    FILENAME= 'C:\Particiones\Pedidos2021.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
    )
    TO FILEGROUP [2021];
GO
ALTER PARTITION SCHEME fecha_pedido
NEXT USED [2021];


ALTER PARTITION FUNCTION f_fecha_pedido()
    SPLIT RANGE ('2019-01-01')
GO