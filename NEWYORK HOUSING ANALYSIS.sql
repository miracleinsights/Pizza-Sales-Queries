SELECT TYPE, sum(CAST(price AS DECIMAL(18, 2))) AS sum_price
FROM NY_Housing_data
GROUP BY TYPE
ORDER BY sum_price desc

select *
from NY_Housing_data

-- Calculate summary statistics for house prices
SELECT
    COUNT(*) AS TotalHouses,
    AVG(CAST(price AS DECIMAL(17, 2))) AS AveragePrice,
    MIN(PRICE) AS MinPrice,
    MAX(PRICE) AS MaxPrice
FROM
    NY_Housing_data;


-- Property Size Analysis: Relationship between Property Size and Prices
select 
	type,
	avg(cast(PROPERTYSQFT as decimal(18,2))) as Avg_property_size,
	AVG(CAST(price AS DECIMAL(17, 2))) AS AveragePrice
from NY_Housing_data
group by Type

--location based Analysis:AVERAGE PRICE BY STATE
SELECT
	LOCALITY,
	COUNT(*) AS TotalHouses,
    AVG(CAST(price AS DECIMAL(17, 2))) AS AveragePrice
FROM NY_Housing_data
GROUP BY LOCALITY
ORDER BY 3 DESC
--Min and max price of houses based on Location
SELECT
	LOCALITY,
	COUNT(*) AS TotalHouses,
     MIN(PRICE) AS MinPrice,
    MAX(PRICE) AS MaxPrice
FROM NY_Housing_data
GROUP BY LOCALITY
ORDER BY 2 desc


--IMPACT OF NUMBER OF BEDROOMS AND BATHROOMS ON HOUSE PRICES
--Bedroom and Bathroom Trends
SELECT
	BEDS,BATH,COUNT(*) AS HOUSE_COUNT,
	AVG(CAST(price AS DECIMAL(18, 0))) AS AveragePrice
FROM NY_Housing_data
GROUP BY BEDS,BATH
ORDER BY 4 DESC

-- Broker Performance Analysis: Top 5 Brokers by Average Transaction Value per House
SELECT
	BROKERTITLE,COUNT(*) AS HOUSE_COUNT,
	AVG(CAST(price AS DECIMAL(18, 0))) AS AveragePrice,
	SUM(CAST(price AS DECIMAL(18, 0))) AS TotalPrice
FROM NY_Housing_data
GROUP BY BROKERTITLE
ORDER BY 4 DESC















