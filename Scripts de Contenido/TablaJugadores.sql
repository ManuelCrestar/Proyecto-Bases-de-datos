USE Airsoft
GO

INSERT INTO dbo.Jugadores (ID_Jugador,DNI, Nombre, Apellido1, Apellido2, Telefono, Equipos_ID_Equipo, Nacionalidad_ID_Nacionalidad)
VALUES 
    (1,'12345678A', 'Pablo', 'Rodriguez', 'Garcia', '610123456', 1, 1),
    (2,'23456789B', 'Ana', 'Perez', 'Gomez', '611234567',1, 1),
    (3,'34567890C', 'Juan', 'Fernandez', 'Lopez', '612345678',2, 1),
    (4,'45678901D', 'Maria', 'Gonzalez', 'Garcia', '613456789',2, 1),
    (5,'56789012E', 'Luis', 'Sanchez', 'Hernandez', '614567890',3, 1),
    (6,'67890123F', 'Marta', 'Martinez', 'Garcia', '615678901',3, 1),
    (7,'78901234G', 'Antonio', 'Jimenez', 'Gonzalez', '616789012',4,2),
    (8,'89012345H', 'Carmen', 'Ruiz', 'Garcia', '617890123',4,2),
    (9,'90123456I', 'Javier', 'Sanchez', 'Garcia', '618901234',5,3),
    (10,'01234567J', 'Cristina', 'Perez', 'Garcia', '619012345',5,3),
    (11,'12345678K', 'Sergio', 'Rodriguez', 'Garcia', '620123456',6,4),
    (12,'23456789L', 'Laura', 'Perez', 'Gomez', '621234567',6,4),
    (13,'34567890M', 'David', 'Fernandez', 'Lopez', '622345678',7, 1),
    (14,'45678901N', 'Paula', 'Gonzalez', 'Garcia', '623456789',7, 1),
    (15,'56789012O', 'Luisa', 'Sanchez', 'Hernandez', '624567890',8,5),
    (16,'67890123P', 'Marcos', 'Martinez', 'Garcia', '625678901',8,5),
    (17,'78901234Q', 'Ana', 'Jimenez', 'Gonzalez', '626789012',9,6),
    (18,'89012345R', 'Manuel', 'Ruiz', 'Garcia', '627890123',9,6),
    (19,'90123456S', 'Lorena', 'Sanchez', 'Garcia', '628901234',10,4),
    (20,'01234567T', 'Alejandro', 'Perez', 'Garcia', '629012345',10,4);
GO