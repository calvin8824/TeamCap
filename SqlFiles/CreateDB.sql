SET NOCOUNT ON
Go

USE master
Go

if exists (select * from sysdatabases where name='BinaryTextAdventure')
		drop database BinaryTextAdventure
Go

Create Database BinaryTextAdventure
Go

Use BinaryTextAdventure
Go

Insert Into AspNetRoles(Id,[Name])
VALUES(1, 'Admin'),
	(2, 'Creator'),
	(3, 'User')

Select *
From AspNetRoles




