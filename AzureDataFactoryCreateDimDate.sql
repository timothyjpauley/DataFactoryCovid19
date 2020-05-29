/***********************
*Developer Tim Pauley
*Date: May 25 2020
*Description: DimDate
https://www.mssqltips.com/sqlservertip/4054/creating-a-date-dimension-or-calendar-table-in-sql-server/
************************/
USE [Covid19]
GO
--Drop Tables if exists
IF OBJECT_ID('dbo.DimDate', 'U') IS NOT NULL 
  DROP TABLE dbo.DimDate;

CREATE TABLE DimDate
(
ReportingDate date
,TheDay int
,TheDayName nvarchar(50)
,TheWeek int
,TheSOWeek int
,TheDayOfWeek int
,TheMonth int
,TheMonthName nvarchar(50)
,TheQuarter int
,TheYear int
,TheFirstOfTheMonth nvarchar(50)
,TheLastOfTheMonth nvarchar(50)
,DayofTheYear nvarchar(50)
)

DECLARE @StartDate  date = '20200501';

DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 30, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS
(
  SELECT
    TheDate         = CONVERT(date, d),
    TheDay          = DATEPART(DAY,       d),
    TheDayName      = DATENAME(WEEKDAY,   d),
    TheWeek         = DATEPART(WEEK,      d),
    TheISOWeek      = DATEPART(ISO_WEEK,  d),
    TheDayOfWeek    = DATEPART(WEEKDAY,   d),
    TheMonth        = DATEPART(MONTH,     d),
    TheMonthName    = DATENAME(MONTH,     d),
    TheQuarter      = DATEPART(Quarter,   d),
    TheYear         = DATEPART(YEAR,      d),
    TheFirstOfMonth = DATEFROMPARTS(YEAR(d), MONTH(d), 1),
    TheLastOfYear   = DATEFROMPARTS(YEAR(d), 12, 31),
    TheDayOfYear    = DATEPART(DAYOFYEAR, d)
  FROM d
)

INSERT INTO DimDate
	SELECT 
	* 
	FROM src
	WHERE TheDate < '2020-05-31' --added this in to only grab May 2020
	ORDER BY TheDate
	OPTION (MAXRECURSION 0);

SELECT * FROM DimDate