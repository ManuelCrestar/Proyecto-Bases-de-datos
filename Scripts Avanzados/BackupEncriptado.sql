-- Para esta practica, crearemos una copia de la BD
-- Airsoft con el nombre AirsoftEncriptado
-- Creamos una MASTER KEY para usar como contraseña en todo el proceso
-- y un certificado
USE MASTER
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Abcd1234.';
GO
CREATE CERTIFICATE CertificadoAirsoft
WITH SUBJECT = 'Certificado de la BD Airsoft';
GO

-- Comprobamos que existe y que es correcto
SELECT * FROM sys.certificates
GO

-- Hacemos un backup del certificado, ya que sin el, no podremos
-- recuperar la base de datos
BACKUP CERTIFICATE CertificadoAirsoft TO FILE =
'C:\Datos\CertificadoAirsoft.cer'
WITH PRIVATE KEY 
    (
        FILE = 'C:\Datos\CertificadoAirsoft.pvk',
        ENCRYPTION BY PASSWORD='Abcd1234.'
    )
GO

-- Activamos el cifrado de la base de datos
USE AirProductos
GO
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE CertificadoAirsoft;
GO
ALTER DATABASE AirProductos
SET ENCRYPTION ON
GO

-- Y finalmente creamos el backup con el cifrado
USE MASTER
GO
BACKUP DATABASE [AirProductos]
TO DISK = 'C:\Backups\AirProductos.bak'
WITH ENCRYPTION
    (
    ALGORITHM = AES_256,
    SERVER CERTIFICATE= CertificadoAirsoft
    ),
STATS = 10, INIT
GO

-- Ahora queremos recuperar la BD
RESTORE DATABASE AirProductos
FROM DISK='C:\Backups\AirProductos.bak'
GO