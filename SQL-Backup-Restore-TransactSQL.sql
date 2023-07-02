


USE [master]

--DATABASE BACKUP
Declare @backuplocation varchar(500)
Set @backuplocation = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\Backup\testdb.bak'

BACKUP DATABASE testdb TO DISK = @backuplocation
WITH FORMAT, NAME = N'testdb-Full Database Backup'



--DATABASE RESTORE
USE master
Declare @backuplocation varchar(500)
Set @backuplocation = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\Backup\SQLtestdb.bak'
RESTORE DATABASE newtestdb FROM DISK = @backuplocation 

--DATABASE RESTORE  TO DIFFERENT DATABASE
create database newtestdb
Declare @restorelocation varchar(500)
Declare @OldLogicalDatafile varchar(500)
Declare @NewLogicalDatafile varchar(500)
Declare @OldLogicalLogfile varchar(500) 
Declare @NewLogicalLogfile varchar(500) 

Set @restorelocation = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\Backup\SQLtestdb.bak'

Set @OldLogicalDatafile = 'testdb'
Set @OldLogicalLogfile = 'testdb_log'

Set @NewLogicalDatafile = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\newtestdb.mdf'
Set @NewLogicalLogfile = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\newtestdb_log.ldf'

RESTORE DATABASE newtestdb
FROM DISK = @restorelocation
WITH 
MOVE  'testdb' TO @NewLogicalDatafile,
MOVE 'testdb_log' TO @NewLogicalLogfile,
     REPLACE


RESTORE FILELISTONLY
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\Backup\SQLtestdb.bak';