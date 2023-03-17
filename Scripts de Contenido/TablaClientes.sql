USE Airsoft
GO

INSERT INTO Clientes (ID_Cliente,Nombre,Apellido1,Apellido2,Telefono,Email,Direccion,Localidad_ID_Localidad,Localidad_Provincia_ID_Provincia,Localidad_Provincia_ComunidadAutonoma_ID_CCAA)
VALUES
    (1,'Manuel','Crestar','Sanchez','123456789','mcrestar@dominio.com','Calle Concordia,12',1,1,1),
    (2,'Elias','Sanchez','Crestar','987654321','esanchez@dominio.com','Calle Nuez, S/N',1,1,1),
    (3,'John','Smith','Silver','789456123','jsmith@dominio.com','Ronda Outeiro,3',1,1,1),
    (4, 'Ana', 'García', 'Pérez', '555123456', 'ana.garcia@gmail.com', 'Calle 1, número 123',1,1,1),
    (5, 'Juan', 'López', 'Rodríguez', '555567890', 'juan.lopez@hotmail.com', 'Avenida 2, número 456',1,1,1),
    (6, 'María', 'Fernández', 'Gutiérrez', '555432109', 'maria.fernandez@yahoo.com', 'Calle 3, número 789',1,1,1),
    (7, 'Pedro', 'Martínez', 'Sánchez', '555876543', 'pedro.martinez@outlook.com', 'Avenida 4, número 1011',1,1,1),
    (8, 'Sofía', 'González', 'Hernández', '555210987', 'sofia.gonzalez@gmail.com', 'Calle 5, número 1213',1,1,1),
    (9, 'Carlos', 'Pérez', 'Jiménez', '555654321', 'carlos.perez@yahoo.com', 'Avenida 6, número 1415',1,1,1),
    (10, 'Laura', 'Ruiz', 'Díaz', '555098765', 'laura.ruiz@outlook.com', 'Calle 7, número 1617',1,1,1);
GO
