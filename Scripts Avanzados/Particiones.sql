-- Hemos de asegurar que el directorio en el que se crearan las
-- particiones este creado
ALTER DATABASE AirProductos
ADD FILEGROUP [2019]
GO
ALTER DATABASE AirProductos
ADD FILEGROUP [2020]
GO
ALTER DATABASE AirProductos
ADD FILEGROUP [Particiones]
GO
-- Añadimos las rutas donde estaran creadas las particiones
-- y los ajustes de ampliacion y tamaño original
ALTER DATABASE AirProductos
ADD FILE
    (
    NAME = [Pedidos2019],
    FILENAME= 'C:\Particiones\Pedidos2019.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
    )
    TO FILEGROUP [2019];
GO
ALTER DATABASE AirProductos
ADD FILE
    (
    NAME = [Pedidos2020],
    FILENAME= 'C:\Particiones\Pedidos2020.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
    )
    TO FILEGROUP [2020];
GO
ALTER DATABASE AirProductos
ADD FILE
    (
    NAME = [Particiones],
    FILENAME= 'C:\Particiones\Particiones.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
    )
    TO FILEGROUP [Particiones];
GO