DELETE FROM grad_dimensional.dim_date;

INSERT INTO grad_dimensional.dim_date(
date,
dayOfYear,
dayOfMonth,
numberMonth,
nameMonth,
year,
numberDayOfWeek,
nameDayOfWeek)

SELECT 
date, 
DayOfYear, 
DayOfMonth, 
Month, 
MONTHNAME(date) as nameMonth,
year, 
DayOfWeekUSA, 
DayName
FROM(
	SELECT 
		date as Date,    
		DATE_FORMAT(date, '%d/%m/%Y') AS FullDateUK,
		DATE_FORMAT(date, '%m/%d/%Y') AS FullDateUSA,
		DAY(date) AS DayOfMonth,
		DAYNAME(date) AS DayName,  CASE 
			WHEN DAYOFWEEK(date) = 1 THEN 7 
			ELSE DAYOFWEEK(date) - 1 
		END AS DayOfWeekUK,
		FLOOR((DAY(date) - 1) / 7) + 1 AS DayOfWeekInMonth,
		CASE
			WHEN DAY(date) IN (1,21,31) THEN CONCAT(DAY(date), 'st')
			WHEN DAY(date) IN (2,22) THEN CONCAT(DAY(date), 'nd')
			WHEN DAY(date) IN (3,23) THEN CONCAT(DAY(date), 'rd')
			ELSE CONCAT(DAY(date), 'th')
		END AS DaySuffix,  
		DAYOFWEEK(date) AS DayOfWeekUSA,
		DAYOFYEAR(date) AS DayOfWeekInYear,
		DAY(date) - DAY(DATE_SUB(date, INTERVAL QUARTER(date) - 1 QUARTER)) + 1 AS DayOfQuarter,
		DAYOFYEAR(date) AS DayOfYear,
		CEILING(DAY(date) / 7) AS WeekOfMonth,
		CEILING((DAYOFYEAR(date) - 1) / 7) AS WeekOfQuarter,
		WEEK(date, 1) AS WeekOfYear, 
		MONTH(date) AS Month,    
		((MONTH(date) - 1) % 3) + 1 AS MonthOfQuarter,
		CEILING(MONTH(date) / 3) AS Quarter,
		CASE CEILING(MONTH(date) / 3)
			WHEN 1 THEN 'Q1'
			WHEN 2 THEN 'Q2'
			WHEN 3 THEN 'Q3'
			WHEN 4 THEN 'Q4'
		END AS QuarterName,
		YEAR(date) AS Year,    
		CONCAT('Year ', YEAR(date)) AS YearName,
		CONCAT(MONTHNAME(date), ' ', YEAR(date)) AS MonthYear,
		DATE_FORMAT(date, '%m%Y') AS MMYYYY,
		DATE_FORMAT(date, '%Y-%m-01') AS FirstDayOfMonth,
		LAST_DAY(date) AS LastDayOfMonth, 
		DATE_FORMAT(date - INTERVAL (QUARTER(date) - 1) * 3 MONTH, '%Y-%m-01') AS FirstDayOfQuarter,
		DATE_FORMAT(LAST_DAY(date + INTERVAL (2 - QUARTER(date)) * 3 MONTH), '%Y-%m-%d') AS LastDayOfQuarter,
		CONCAT(YEAR(date), '-01-01') AS FirstDayOfYear,
		CONCAT(YEAR(date), '-12-31') AS LastDayOfYear,
		CASE
				WHEN MONTH(date) = 1 AND DAY(date) = 1 THEN 'New Year''s Day'
				WHEN MONTH(date) = 7 AND DAY(date) = 4 THEN 'Independence Day'
				WHEN MONTH(date) = 12 AND DAY(date) = 25 THEN 'Christmas Day'
			ELSE 'Not a holiday'
		END AS HolidayUSA,
		CASE
				WHEN MONTH(date) = 1 AND DAY(date) = 1 THEN 1  -- New Year's Day
				WHEN MONTH(date) = 7 AND DAY(date) = 4 THEN 1  -- Independence Day
				WHEN MONTH(date) = 12 AND DAY(date) = 25 THEN 1  -- Christmas Day
			ELSE 0
		END AS IsHolidayUSA,
		CASE
				WHEN DAYOFWEEK(date) IN (2,3,4,5,6) THEN 1  -- Monday to Friday
			ELSE 0
		END AS IsWeekday,
		CASE
				WHEN MONTH(date) = 1 AND DAY(date) = 1 THEN 1  -- New Year's Day
				WHEN MONTH(date) = 12 AND DAY(date) = 25 THEN 1  -- Christmas Day
				WHEN MONTH(date) = 12 AND DAY(date) = 26 THEN 1  -- Boxing Day
			ELSE 0
		END AS IsHolidayUK,
		CASE
				WHEN MONTH(date) = 1 AND DAY(date) = 1 THEN 'New Year''s Day'
				WHEN MONTH(date) = 12 AND DAY(date) = 25 THEN 'Christmas Day'
				WHEN MONTH(date) = 12 AND DAY(date) = 26 THEN 'Boxing Day'
			ELSE 'Not a holiday'
		END AS HolidayUK,
		CASE
				WHEN MONTH(date) >= 4 THEN DAYOFYEAR(date) - DAYOFYEAR(CONCAT(YEAR(date), '-04-01')) + 1
			ELSE DAYOFYEAR(DATE_SUB(date, INTERVAL 1 YEAR)) - DAYOFYEAR(CONCAT(YEAR(date) - 1, '-04-01')) + 1
		END AS FiscalDayOfYear,        
		CASE
				WHEN MONTH(date) >= 4 THEN CEILING((DAYOFYEAR(date) - DAYOFYEAR(CONCAT(YEAR(date), '-04-01')) + 1) / 7)
			ELSE CEILING((DAYOFYEAR(DATE_SUB(date, INTERVAL 1 YEAR)) - DAYOFYEAR(CONCAT(YEAR(date) - 1, '-04-01')) + 1) / 7)
		END AS FiscalWeekOfYear,
		CASE
				WHEN MONTH(date) >= 4 THEN MONTH(date) - 3
			ELSE MONTH(date) + 9
		END AS FiscalMonth,
		CASE
				WHEN MONTH(date) BETWEEN 4 AND 6 THEN 'Q1'
				WHEN MONTH(date) BETWEEN 7 AND 9 THEN 'Q2'
				WHEN MONTH(date) BETWEEN 10 AND 12 THEN 'Q3'
			ELSE 'Q4'
		END AS FiscalQuarter,
		CASE
				WHEN MONTH(date) BETWEEN 4 AND 6 THEN 'Q1 - April to June'
				WHEN MONTH(date) BETWEEN 7 AND 9 THEN 'Q2 - July to September'
				WHEN MONTH(date) BETWEEN 10 AND 12 THEN 'Q3 - October to December'
			ELSE 'Q4 - January to March'
		END AS FiscalQuarterName,
		IF(MONTH(date) >= 4, YEAR(date), YEAR(date) - 1) AS FiscalYear,
		CONCAT(IF(MONTH(date) >= 4, YEAR(date), YEAR(date) - 1), '-', IF(MONTH(date) >= 4, YEAR(date) + 1, YEAR(date))) AS FiscalYearName,
		CONCAT(
			IF(MONTH(date) >= 4, YEAR(date), YEAR(date) - 1),
			'-',
			IF(MONTH(date) >= 4, MONTH(date) - 3, MONTH(date) + 9)
		) AS FiscalMonthYear,
		CONCAT(
			IF(MONTH(date) >= 4, LPAD(MONTH(date) - 3, 2, '0'), LPAD(MONTH(date) + 9, 2, '0')),
			YEAR(date)
		) AS FiscalMMYYYY,
		CASE
				WHEN MONTH(date) >= 4 THEN CONCAT(YEAR(date), '-', LPAD(MONTH(date) - 3, 2, '0'), '-01')
			ELSE CONCAT(YEAR(date) - 1, '-', LPAD(MONTH(date) + 9, 2, '0'), '-01')
		END AS FiscalFirstDayOfMonth,
		CASE
				WHEN MONTH(date) >= 4 THEN LAST_DAY(CONCAT(YEAR(date), '-', LPAD(MONTH(date) - 3, 2, '0'), '-01'))
			ELSE LAST_DAY(CONCAT(YEAR(date) - 1, '-', LPAD(MONTH(date) + 9, 2, '0'), '-01'))
		END AS FiscalLastDayOfMonth,
		CASE
			WHEN MONTH(date) >= 4 THEN
				CASE
					WHEN MONTH(date) BETWEEN 4 AND 6 THEN CONCAT(YEAR(date), '-04-01')
					WHEN MONTH(date) BETWEEN 7 AND 9 THEN CONCAT(YEAR(date), '-07-01')
					WHEN MONTH(date) BETWEEN 10 AND 12 THEN CONCAT(YEAR(date), '-10-01')
				END
			ELSE
				CASE
					WHEN MONTH(date) BETWEEN 1 AND 3 THEN CONCAT(YEAR(date) - 1, '-04-01')
					WHEN MONTH(date) BETWEEN 4 AND 6 THEN CONCAT(YEAR(date) - 1, '-07-01')
					WHEN MONTH(date) BETWEEN 7 AND 9 THEN CONCAT(YEAR(date) - 1, '-10-01')
				END
		END AS FiscalFirstDayOfQuarter,
		CASE
			WHEN MONTH(date) >= 4 THEN
				CASE
					WHEN MONTH(date) BETWEEN 4 AND 6 THEN LAST_DAY(CONCAT(YEAR(date), '-06-30'))
					WHEN MONTH(date) BETWEEN 7 AND 9 THEN LAST_DAY(CONCAT(YEAR(date), '-09-30'))
					WHEN MONTH(date) BETWEEN 10 AND 12 THEN LAST_DAY(CONCAT(YEAR(date), '-12-31'))
				END
			ELSE
				CASE
					WHEN MONTH(date) BETWEEN 1 AND 3 THEN LAST_DAY(CONCAT(YEAR(date) - 1, '-06-30'))
					WHEN MONTH(date) BETWEEN 4 AND 6 THEN LAST_DAY(CONCAT(YEAR(date) - 1, '-09-30'))
					WHEN MONTH(date) BETWEEN 7 AND 9 THEN LAST_DAY(CONCAT(YEAR(date) - 1, '-12-31'))
				END
		END AS FiscalLastDayOfQuarter,
		CASE
				WHEN MONTH(date) >= 4 THEN CONCAT(YEAR(date), '-04-01')
			ELSE CONCAT(YEAR(date) - 1, '-04-01')
		END AS FiscalFirstDayOfYear,
		CASE
				WHEN MONTH(date) >= 4 THEN LAST_DAY(CONCAT(YEAR(date) + 1, '-03-31'))
			ELSE LAST_DAY(CONCAT(YEAR(date), '-03-31'))
		END AS FiscalLastDayOfYear
	FROM (
		SELECT 
			DATE_ADD('2016-01-01', INTERVAL n DAY) AS date
		FROM (
			SELECT 
				(t5.n * 10000 + t4.n * 1000 + t3.n * 100 + t2.n * 10 + t1.n) AS n
			FROM 
				(SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
				(SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
				(SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t3,
				(SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t4,
				(SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t5
		) numbers
		WHERE DATE_ADD('2016-01-01', INTERVAL n DAY) BETWEEN '2016-01-01' AND '2024-12-31'
	) dates
) as subset;