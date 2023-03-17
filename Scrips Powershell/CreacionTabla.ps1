$comando = "CREATE TABLE Campo(ID_Campo INTEGER NOT NULL, Nombre VARCHAR (255) NOT NULL, Direccion VARCHAR (255) NOT NULL,FotoCampo VARBINARY);"
Invoke-Sqlcmd -ServerInstance localhost -Query $comando