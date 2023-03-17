USE MASTER
GO
-- Configuramos la opcion "Filestream acess level" a nivel "2" ya que 
-- la base es a nivel local. Es lo conseguimos 
-- con el procedimiento almacenado 'sp_configure'
EXECUTE sp_configure 'filestream access level','2'
RECONFIGURE
GO
-- Vamos a asociarle un directorio para subir nuestros archivos
USE Airsoft
GO
ALTER DATABASE Airsoft
ADD FILEGROUP [Fotos_Partida] CONTAINS FILESTREAM
GO
ALTER DATABASE Airsoft
-- Añadimos una foto a nuestro FILEGROUP
ADD FILE 
(
    NAME = N'FotosAirsoft', FILENAME = 'C:\Fotos\'
)
TO FILEGROUP [Fotos_Partida]
GO
-- Comprobamos si la tabla existe y la creamos con los parametros correctos
-- para que funcione a traves de FILESTREAM
DROP TABLE IF EXISTS [Partida-Bandos]
GO
CREATE TABLE "Partida-Bandos" 
    (
     Partida_ID_Partida INTEGER NOT NULL , 
     Bandos_ID_Bando INTEGER NOT NULL,
	 ID_Foto UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
	 Fotos VARBINARY(MAX)FILESTREAM NULL UNIQUE NONCLUSTERED (ID_Foto ASC)
    )FILESTREAM_ON [Fotos_Partida]
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

