USE Airsoft
GO
UPDATE [dbo].[Partida-Bandos]
SET Fotos =
    (SELECT * FROM
    OPENROWSET (BULK N'C:\Fotos\ECAT.jpg', SINGLE_BLOB)
    AS LogoBandoJPG)
    WHERE [Bandos_ID_Bando]=2;
GO