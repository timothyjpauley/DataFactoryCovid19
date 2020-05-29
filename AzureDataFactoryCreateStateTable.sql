/***********************
*Developer Tim Pauley
*Date: May 25 2020
*Description: State Table
************************/

USE [Covid19]
GO
--Drop Tables if exists
IF OBJECT_ID('dbo.Unemployment', 'U') IS NOT NULL 
  DROP TABLE dbo.Unemployment;

CREATE TABLE USA_States
(
	[state] [nvarchar](255) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[name] [nvarchar](255) NULL
) 
GO

SELECT [state]
      ,[latitude]
      ,[longitude]
      ,[name]
  FROM [CxEExcelDocs].[dbo].[USA_States$]
GO

