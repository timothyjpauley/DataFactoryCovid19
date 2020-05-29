/***********************
*Developer Tim Pauley
*Date: May 25 2020
*Description: Unemployment Table
************************/

USE [Covid19]
GO
--Drop Tables if exists
IF OBJECT_ID('dbo.Unemployment', 'U') IS NOT NULL 
  DROP TABLE dbo.Unemployment;


CREATE TABLE Unemployment
(
	[State] [nvarchar](255) NULL,
	[Filed week ended] [date] NULL, --cast as date
	[Initial Claims] [float] NULL,
	[Reflecting Week Ended] [date] NULL, --cast as date
	[Continued Claims] [float] NULL,
	[Covered Employment] [float] NULL,
	[Insured Unemployment Rate] [float] NULL
) 
GO

INSERT INTO Unemployment
SELECT [State]
      ,[Filed week ended]
      ,[Initial Claims]
      ,[Reflecting Week Ended]
      ,[Continued Claims]
      ,[Covered Employment]
      ,[Insured Unemployment Rate]
  FROM [Covid].[dbo].[Unemployment2020$]
  WHERE [Filed week ended] >= '2020-05-01' --just grab a month
GO

SELECT * FROM Unemployment