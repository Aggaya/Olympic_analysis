-- List down total gold, silver and bronze medals won by each country.

WITH 
	table_region AS
		(SELECT region as Country
		FROM noc_regions
		JOIN athlete_events ON	athlete_events.NOC = noc_regions.NOC 
		GROUP By region),
	table_gold AS
		(SELECT region, count(medal) as total_gold
		FROM noc_regions
		JOIN athlete_events ON	athlete_events.NOC = noc_regions.NOC
		WHERE Medal = "Gold" 
		GROUP By region),
	table_silver AS
		(SELECT region, count(medal) as total_silver
		FROM noc_regions
		JOIN athlete_events ON	athlete_events.NOC = noc_regions.NOC
		WHERE Medal = "Silver" 
		GROUP By region),
	table_bronze AS
		(SELECT region, count(medal) as total_bronze
		FROM noc_regions
		JOIN athlete_events ON	athlete_events.NOC = noc_regions.NOC
		WHERE Medal = "Bronze" 
		GROUP By region)

SELECT Country,  total_gold  , total_silver , total_bronze
FROM table_region
INNER JOIN table_gold ON table_gold.region = table_region.Country
INNER JOIN table_silver ON table_gold.region = table_silver.region
INNER JOIN table_bronze ON table_bronze.region = table_gold.region
--WHERE Country = "Canada"
ORDER By total_gold DESC

-- SELECT Country
-- from table_region
