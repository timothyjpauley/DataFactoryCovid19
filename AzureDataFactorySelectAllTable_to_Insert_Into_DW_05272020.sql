/**********
Developer: Tim Pauley
Script: Run tables and data warehouse
Date: 05/28/2020
**************/

/**********Truncate Tables*****************/
TRUNCATE TABLE [dbo].[BingCovid]
TRUNCATE TABLE [dbo].[DimDate]
TRUNCATE TABLE [dbo].[Unemployment]
TRUNCATE TABLE [dbo].[USA_States]

/***********Run Tables*******************/
SELECT * FROM [dbo].[BingCovid]
SELECT * FROM [dbo].[DimDate]
SELECT * FROM [dbo].[Unemployment]
SELECT * FROM [dbo].[USA_States]