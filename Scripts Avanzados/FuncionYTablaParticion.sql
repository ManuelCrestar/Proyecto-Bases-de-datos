USE AirProductos
GO
-- Creamos una funcion ppara calcular el stock basado en
-- una columna de tipo DATE que se calcule desde el inicio de
-- año hasta el principio del año siguiente
CREATE PARTITION FUNCTION f_fecha_pedido(DATE)
AS RANGE RIGHT FOR VALUES
(
    '2019-01-01', '2020-01-01'
    );
GO

-- Creamos el esquema de las parciones

CREATE PARTITION SCHEME fecha_pedido
AS PARTITION f_fecha_pedido
TO ([2019],[2020])
GO
-- Creamos una tabla sobre el esquema anterior con los campos con los que se aplicara
USE AirProductos
GO
DROP TABLE IF EXISTS [Pedidos-Productos]
GO
CREATE TABLE [Pedidos-Productos]
(
    Pedidos_ID_Pedido INTEGER NOT NULL ,
    Productos_ID_Producto INTEGER NOT NULL ,
    CantidadProducto INTEGER NOT NULL,
    FechaPedido DATE NOT NULL
)
ON fecha_pedido (FechaPedido)
GO

-- Metemos esta seria de datos para hacer las pruebas
USE AirProductos
GO
INSERT INTO [Pedidos-Productos] (Pedidos_ID_Pedido, Productos_ID_Producto, CantidadProducto, FechaPedido)
VALUES
    (1, 1, 10, '2018-03-15'),
    (1, 2, 5, '2018-03-15'),
    (2, 2, 3, '2018-04-20'),
    (2, 3, 8, '2018-04-20'),
    (3, 1, 15, '2018-05-01'),
    (3, 2, 2, '2018-05-01'),
    (4, 3, 7, '2018-06-12'),
    (5, 1, 12, '2018-07-01'),
    (5, 3, 4, '2018-07-01'),
    (6, 1, 6, '2018-08-05'),
    (6, 2, 9, '2018-08-05'),
    (7, 2, 1, '2018-09-22'),
    (7, 3, 10, '2019-09-22'),
    (8, 1, 10, '2019-03-15'),
    (8, 2, 5, '2019-03-15'),
    (9, 2, 3, '2019-04-20'),
    (9, 3, 8, '2019-04-20'),
    (10, 1, 15, '2019-05-01'),
    (10, 2, 2, '2019-05-01'),
    (11, 3, 7, '2019-06-12'),
    (12, 1, 12, '2019-07-01'),
    (12, 3, 4, '2019-07-01'),
    (13, 1, 6, '2019-08-05'),
    (13, 2, 9, '2019-08-05'),
    (14, 2, 1, '2019-09-22'),
    (14, 3, 10, '2019-09-22'),
    (15, 1, 4, '2019-10-03'),
    (15, 3, 6, '2019-10-03'),
    (16, 2, 2, '2020-01-07'),
    (16, 3, 9, '2020-01-07'),
    (17, 1, 7, '2020-02-14'),
    (17, 2, 3, '2020-02-14'),
    (18, 3, 5, '2020-03-22'),
    (19, 1, 11, '2020-04-10'),
    (19, 3, 8, '2020-04-10'),
    (20, 1, 10, '2021-03-15'),
    (20, 2, 5, '2021-03-15'),
    (21, 2, 3, '2021-04-20'),
    (22, 3, 8, '2021-04-20'),
    (23, 1, 15, '2021-05-01'),
    (24, 2, 2, '2021-05-01'),
    (25, 3, 7, '2021-06-12'),
    (26, 1, 12, '2021-07-01'),
    (27, 3, 4, '2021-07-01'),
    (28, 1, 6, '2021-08-05');
GO

SELECT * FROM [Pedidos-Productos]
    WHERE (DATE > '2019-01-01' AND DATE <'2021-01-01')