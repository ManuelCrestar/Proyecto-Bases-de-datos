$comando = "SELECT * FROM Airsoft.dbo.Jugadores"
Invoke-Sqlcmd -ServerInstance localhost -Query $comando