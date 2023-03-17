USE MASTER
GO
CREATE DATABASE Airsoft
GO
USE Airsoft
GO

CREATE TABLE Arbitros 
    (
     ID_Arbitro INTEGER NOT NULL , 
     Empleados_ID_Empleado INTEGER NOT NULL 
    )
GO

ALTER TABLE Arbitros ADD CONSTRAINT Arbitros_PK PRIMARY KEY CLUSTERED (ID_Arbitro)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "Arbitros-Campos" 
    (
     Arbitros_ID_Arbitro INTEGER NOT NULL , 
     Campo_ID_Campo INTEGER NOT NULL 
    )
GO

CREATE TABLE Bandos 
    (
     ID_Bando INTEGER NOT NULL , 
     Nombre VARCHAR (255) 
    )
GO

ALTER TABLE Bandos ADD CONSTRAINT Bandos_PK PRIMARY KEY CLUSTERED (ID_Bando)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Campo 
    (
     ID_Campo INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Direccion VARCHAR (255) NOT NULL , 
     FotoCampo VARBINARY , 
     Localidad_ID_Localidad INTEGER NOT NULL , 
     Localidad_Provincia_ID_Provincia INTEGER NOT NULL , 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Campo ADD CONSTRAINT Campo_PK PRIMARY KEY CLUSTERED (ID_Campo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Clientes 
    (
     ID_Cliente INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Apellido1 VARCHAR (255) NOT NULL , 
     Apellido2 VARCHAR (255) , 
     Direccion VARCHAR (50) NOT NULL , 
     Telefono CHAR (9) NOT NULL , 
     Email VARCHAR (255) NOT NULL , 
     Localidad_ID_Localidad INTEGER NOT NULL , 
     Localidad_Provincia_ID_Provincia INTEGER NOT NULL , 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Clientes ADD CONSTRAINT Clientes_PK PRIMARY KEY CLUSTERED (ID_Cliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ComunidadAutonoma 
    (
     ID_CCAA INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL 
    )
GO

ALTER TABLE ComunidadAutonoma ADD CONSTRAINT ComunidadAutonoma_PK PRIMARY KEY CLUSTERED (ID_CCAA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Empleados 
    (
     ID_Empleado INTEGER NOT NULL , 
     Tienda_ID_Tienda INTEGER NOT NULL , 
     DNI VARCHAR (9) NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Apellido1 VARCHAR (255) NOT NULL , 
     Apellido2 VARCHAR (255) , 
     Telefono CHAR (9) NOT NULL , 
     Direccion VARCHAR (50) NOT NULL , 
     Localidad_ID_Localidad INTEGER NOT NULL , 
     Localidad_Provincia_ID_Provincia INTEGER NOT NULL , 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Empleados ADD CONSTRAINT Empleados_PK PRIMARY KEY CLUSTERED (ID_Empleado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Equipos 
    (
     ID_Equipo INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Nacionalidad_ID_Nacionalidad INTEGER NOT NULL 
    )
GO

ALTER TABLE Equipos ADD CONSTRAINT Equipos_PK PRIMARY KEY CLUSTERED (ID_Equipo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Jugadores 
    (
     ID_Jugador INTEGER NOT NULL , 
     DNI VARCHAR (9) NOT NULL , 
     Nombre NVARCHAR (255) NOT NULL , 
     Apellido1 NVARCHAR (255) NOT NULL , 
     Apellido2 NVARCHAR (255) , 
     Telefono CHAR (9) NOT NULL , 
     Equipos_ID_Equipo INTEGER NOT NULL , 
     Nacionalidad_ID_Nacionalidad INTEGER NOT NULL 
    )
GO

ALTER TABLE Jugadores ADD CONSTRAINT Jugadores_PK PRIMARY KEY CLUSTERED (ID_Jugador)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "Jugadores-Bandos" 
    (
     Bandos_ID_Bando INTEGER NOT NULL , 
     Jugadores_ID_Jugador INTEGER NOT NULL 
    )
GO

CREATE TABLE Localidad 
    (
     ID_Localidad INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Provincia_ID_Provincia INTEGER NOT NULL , 
     Provincia_ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Localidad ADD CONSTRAINT Localidad_PK PRIMARY KEY CLUSTERED (ID_Localidad, Provincia_ID_Provincia, Provincia_ComunidadAutonoma_ID_CCAA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Modos_de_juego 
    (
     ID_Modo INTEGER NOT NULL , 
     Nombre NVARCHAR (255) NOT NULL 
    )
GO

ALTER TABLE Modos_de_juego ADD CONSTRAINT Modos_de_juego_PK PRIMARY KEY CLUSTERED (ID_Modo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Nacionalidad 
    (
     ID_Nacionalidad INTEGER NOT NULL , 
     Pais VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Nacionalidad ADD CONSTRAINT Nacionalidad_PK PRIMARY KEY CLUSTERED (ID_Nacionalidad)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Partida 
    (
     ID_Partida INTEGER NOT NULL , 
     Fecha DATE NOT NULL , 
     Hora TIME NOT NULL , 
	 FotoPartida VARBINARY (MAX),
     Arbitros_ID_Arbitro INTEGER NOT NULL , 
     Campo_ID_Campo INTEGER NOT NULL , 
     Modos_de_juego_ID_Modo INTEGER NOT NULL 
    )
GO

ALTER TABLE Partida ADD CONSTRAINT Partida_PK PRIMARY KEY CLUSTERED (ID_Partida)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "Partida-Bandos" 
    (
     Partida_ID_Partida INTEGER NOT NULL , 
     Bandos_ID_Bando INTEGER NOT NULL 
    )
GO

CREATE TABLE Pedidos 
    (
     ID_Pedido INTEGER NOT NULL , 
     Fecha DATETIME NOT NULL , 
     PrecioTotal MONEY NOT NULL , 
     Clientes_ID_Cliente INTEGER NOT NULL , 
     Tienda_ID_Tienda INTEGER NOT NULL 
    )
GO

ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_PK PRIMARY KEY CLUSTERED (ID_Pedido)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "Pedidos-Productos" 
    (
     Pedidos_ID_Pedido INTEGER NOT NULL , 
     Productos_ID_Producto INTEGER NOT NULL , 
     CantidadProducto INTEGER NOT NULL 
    )
GO

CREATE TABLE Productos 
    (
     ID_Producto INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Precio MONEY NOT NULL , 
     Stock INTEGER NOT NULL , 
     Categoria NVARCHAR (255) NOT NULL 
    )
GO

ALTER TABLE Productos ADD CONSTRAINT Productos_PK PRIMARY KEY CLUSTERED (ID_Producto)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Proveedores 
    (
     ID_Proveedor INTEGER NOT NULL , 
     DNI VARCHAR (9) NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Apellido1 VARCHAR (255) NOT NULL , 
     Apellido2 VARCHAR (255) , 
     Telefono CHAR (9) NOT NULL , 
     Direccion VARCHAR (50) NOT NULL , 
     Localidad_ID_Localidad INTEGER NOT NULL , 
     Localidad_Provincia_ID_Provincia INTEGER NOT NULL , 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Proveedores ADD CONSTRAINT Proveedores_PK PRIMARY KEY CLUSTERED (ID_Proveedor)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "Proveedores-Productos" 
    (
     Proveedores_ID_Proveedor INTEGER NOT NULL , 
     Productos_ID_Producto INTEGER NOT NULL 
    )
GO

CREATE TABLE Provincia 
    (
     ID_Provincia INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Provincia ADD CONSTRAINT Provincia_PK PRIMARY KEY CLUSTERED (ID_Provincia, ComunidadAutonoma_ID_CCAA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tienda 
    (
     ID_Tienda INTEGER NOT NULL , 
     Nombre VARCHAR (255) NOT NULL , 
     Telefono VARCHAR (255) NOT NULL , 
     Direccion VARCHAR (255) NOT NULL , 
     Localidad_ID_Localidad INTEGER NOT NULL , 
     Localidad_Provincia_ID_Provincia INTEGER NOT NULL , 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA INTEGER NOT NULL 
    )
GO

ALTER TABLE Tienda ADD CONSTRAINT Tienda_PK PRIMARY KEY CLUSTERED (ID_Tienda)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Arbitros 
    ADD CONSTRAINT Arbitros_Empleados_FK FOREIGN KEY 
    ( 
     Empleados_ID_Empleado
    ) 
    REFERENCES Empleados 
    ( 
     ID_Empleado 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Arbitros-Campos" 
    ADD CONSTRAINT "Arbitros-Campos_Arbitros_FK" FOREIGN KEY 
    ( 
     Arbitros_ID_Arbitro
    ) 
    REFERENCES Arbitros 
    ( 
     ID_Arbitro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Arbitros-Campos" 
    ADD CONSTRAINT "Arbitros-Campos_Campo_FK" FOREIGN KEY 
    ( 
     Campo_ID_Campo
    ) 
    REFERENCES Campo 
    ( 
     ID_Campo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Campo 
    ADD CONSTRAINT Campo_Localidad_FK FOREIGN KEY 
    ( 
     Localidad_ID_Localidad, 
     Localidad_Provincia_ID_Provincia, 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES Localidad 
    ( 
     ID_Localidad , 
     Provincia_ID_Provincia , 
     Provincia_ComunidadAutonoma_ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Clientes 
    ADD CONSTRAINT Clientes_Localidad_FK FOREIGN KEY 
    ( 
     Localidad_ID_Localidad, 
     Localidad_Provincia_ID_Provincia, 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES Localidad 
    ( 
     ID_Localidad , 
     Provincia_ID_Provincia , 
     Provincia_ComunidadAutonoma_ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleados 
    ADD CONSTRAINT Empleados_Localidad_FK FOREIGN KEY 
    ( 
     Localidad_ID_Localidad, 
     Localidad_Provincia_ID_Provincia, 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES Localidad 
    ( 
     ID_Localidad , 
     Provincia_ID_Provincia , 
     Provincia_ComunidadAutonoma_ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleados 
    ADD CONSTRAINT Empleados_Tienda_FK FOREIGN KEY 
    ( 
     Tienda_ID_Tienda
    ) 
    REFERENCES Tienda 
    ( 
     ID_Tienda 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Equipos 
    ADD CONSTRAINT Equipos_Nacionalidad_FK FOREIGN KEY 
    ( 
     Nacionalidad_ID_Nacionalidad
    ) 
    REFERENCES Nacionalidad 
    ( 
     ID_Nacionalidad 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Jugadores 
    ADD CONSTRAINT Jugadores_Equipos_FK FOREIGN KEY 
    ( 
     Equipos_ID_Equipo
    ) 
    REFERENCES Equipos 
    ( 
     ID_Equipo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Jugadores 
    ADD CONSTRAINT Jugadores_Nacionalidad_FK FOREIGN KEY 
    ( 
     Nacionalidad_ID_Nacionalidad
    ) 
    REFERENCES Nacionalidad 
    ( 
     ID_Nacionalidad 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Jugadores-Bandos" 
    ADD CONSTRAINT "Jugadores-Bandos_Bandos_FK" FOREIGN KEY 
    ( 
     Bandos_ID_Bando
    ) 
    REFERENCES Bandos 
    ( 
     ID_Bando 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Jugadores-Bandos" 
    ADD CONSTRAINT "Jugadores-Bandos_Jugadores_FK" FOREIGN KEY 
    ( 
     Jugadores_ID_Jugador
    ) 
    REFERENCES Jugadores 
    ( 
     ID_Jugador 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Localidad 
    ADD CONSTRAINT Localidad_Provincia_FK FOREIGN KEY 
    ( 
     Provincia_ID_Provincia, 
     Provincia_ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES Provincia 
    ( 
     ID_Provincia , 
     ComunidadAutonoma_ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partida 
    ADD CONSTRAINT Partida_Arbitros_FK FOREIGN KEY 
    ( 
     Arbitros_ID_Arbitro
    ) 
    REFERENCES Arbitros 
    ( 
     ID_Arbitro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partida 
    ADD CONSTRAINT Partida_Campo_FK FOREIGN KEY 
    ( 
     Campo_ID_Campo
    ) 
    REFERENCES Campo 
    ( 
     ID_Campo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partida 
    ADD CONSTRAINT Partida_Modos_de_juego_FK FOREIGN KEY 
    ( 
     Modos_de_juego_ID_Modo
    ) 
    REFERENCES Modos_de_juego 
    ( 
     ID_Modo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Partida-Bandos" 
    ADD CONSTRAINT "Partida-Bandos_Bandos_FK" FOREIGN KEY 
    ( 
     Bandos_ID_Bando
    ) 
    REFERENCES Bandos 
    ( 
     ID_Bando 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Partida-Bandos" 
    ADD CONSTRAINT "Partida-Bandos_Partida_FK" FOREIGN KEY 
    ( 
     Partida_ID_Partida
    ) 
    REFERENCES Partida 
    ( 
     ID_Partida 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedidos 
    ADD CONSTRAINT Pedidos_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_ID_Cliente
    ) 
    REFERENCES Clientes 
    ( 
     ID_Cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedidos 
    ADD CONSTRAINT Pedidos_Tienda_FK FOREIGN KEY 
    ( 
     Tienda_ID_Tienda
    ) 
    REFERENCES Tienda 
    ( 
     ID_Tienda 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Pedidos-Productos" 
    ADD CONSTRAINT "Pedidos-Productos_Pedidos_FK" FOREIGN KEY 
    ( 
     Pedidos_ID_Pedido
    ) 
    REFERENCES Pedidos 
    ( 
     ID_Pedido 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Pedidos-Productos" 
    ADD CONSTRAINT "Pedidos-Productos_Productos_FK" FOREIGN KEY 
    ( 
     Productos_ID_Producto
    ) 
    REFERENCES Productos 
    ( 
     ID_Producto 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Proveedores 
    ADD CONSTRAINT Proveedores_Localidad_FK FOREIGN KEY 
    ( 
     Localidad_ID_Localidad, 
     Localidad_Provincia_ID_Provincia, 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES Localidad 
    ( 
     ID_Localidad , 
     Provincia_ID_Provincia , 
     Provincia_ComunidadAutonoma_ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Proveedores-Productos" 
    ADD CONSTRAINT "Proveedores-Productos_Productos_FK" FOREIGN KEY 
    ( 
     Productos_ID_Producto
    ) 
    REFERENCES Productos 
    ( 
     ID_Producto 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Proveedores-Productos" 
    ADD CONSTRAINT "Proveedores-Productos_Proveedores_FK" FOREIGN KEY 
    ( 
     Proveedores_ID_Proveedor
    ) 
    REFERENCES Proveedores 
    ( 
     ID_Proveedor 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Provincia 
    ADD CONSTRAINT Provincia_ComunidadAutonoma_FK FOREIGN KEY 
    ( 
     ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES ComunidadAutonoma 
    ( 
     ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Tienda 
    ADD CONSTRAINT Tienda_Localidad_FK FOREIGN KEY 
    ( 
     Localidad_ID_Localidad, 
     Localidad_Provincia_ID_Provincia, 
     Localidad_Provincia_ComunidadAutonoma_ID_CCAA
    ) 
    REFERENCES Localidad 
    ( 
     ID_Localidad , 
     Provincia_ID_Provincia , 
     Provincia_ComunidadAutonoma_ID_CCAA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO