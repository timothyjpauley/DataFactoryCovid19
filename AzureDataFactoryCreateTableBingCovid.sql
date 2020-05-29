/***********************
*Developer Tim Pauley
*Date: May 25 2020
*Description: BingCovid Table
************************/

USE [Covid19]
GO
--Drop Tables if exists
IF OBJECT_ID('dbo.BingCovid', 'U') IS NOT NULL 
  DROP TABLE dbo.BingCovid;


CREATE TABLE BingCovid
(
	[ID] [float] NULL,
	[Updated] [date] NULL, --fix date
	[Confirmed] [float] NULL,
	[ConfirmedChange] [float] NULL,
	[Deaths] [float] NULL,
	[DeathsChange] [float] NULL,
	[Recovered] [nvarchar](255) NULL,
	[RecoveredChange] [nvarchar](255) NULL,
	[Latitude] [nvarchar](255) NULL,
	[Longitude] [nvarchar](255) NULL,
	[ISO2] [nvarchar](255) NULL,
	[ISO3] [nvarchar](255) NULL,
	[Country_Region] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL, --renamed state
	[AdminRegion2] [nvarchar](255) NULL
) 
GO

INSERT INTO BingCovid
SELECT [ID]
      ,[Updated]
      ,[Confirmed]
      ,[ConfirmedChange]
      ,[Deaths]
      ,[DeathsChange]
      ,[Recovered]
      ,[RecoveredChange]
      ,[Latitude]
      ,[Longitude]
      ,[ISO2]
      ,[ISO3]
      ,[Country_Region]
      ,[AdminRegion1]
      ,[AdminRegion2]
  FROM [Covid].[dbo].[BingCovid2020$]
  WHERE [Updated] >= '2020-05-01' --just grab a month
  AND Country_Region = 'United States'
GO

SELECT * FROM BingCovid