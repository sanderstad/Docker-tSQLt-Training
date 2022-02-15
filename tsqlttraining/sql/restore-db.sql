USE [master]
RESTORE DATABASE [Northwind] FROM  DISK = N'/tmp/northwind.bak' WITH  FILE = 1,  MOVE N'Northwind' TO N'/var/opt/sqlserver/data/northwnd.mdf',  MOVE N'Northwind_log' TO N'/var/opt/sqlserver/log/northwnd.ldf',  NOUNLOAD,  STATS = 5

GO


USE [master]
RESTORE DATABASE [pubs] FROM  DISK = N'/tmp/pubs.bak' WITH  FILE = 1,  MOVE N'pubs' TO N'/var/opt/sqlserver/data/pubs.mdf',  MOVE N'pubs_log' TO N'/var/opt/sqlserver/log/pubs_log.ldf',  NOUNLOAD,  STATS = 5

GO


--USE [master]
--RESTORE DATABASE [WideWorldImporters] FROM  DISK = N'/tmp/WideWorldImporters-Full.bak' WITH  FILE = 1,  MOVE N'WWI_Primary' TO N'/var/opt/sqlserver/data/WideWorldImporters.mdf',  MOVE N'WWI_UserData' TO N'/var/opt/sqlserver/data/WideWorldImporters_UserData.ndf',  MOVE N'WWI_Log' TO N'/var/opt/sqlserver/log/WideWorldImporters.ldf',  MOVE N'WWI_InMemory_Data_1' TO N'/var/opt/sqlserver/data/WideWorldImporters_InMemory_Data_1',  NOUNLOAD,  STATS = 5
--
--GO


