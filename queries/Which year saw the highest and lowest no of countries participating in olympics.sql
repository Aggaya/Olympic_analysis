--  Which year saw the highest and lowest no of countries participating in olympics

SELECT 
	Year || "__" || min(total_country) as lowest_country,
	Year || "__" || max(total_country) as heighest_country
FROM
	(SELECT 
		Year, 
		count(DISTINCT NOC) as total_country
	from athlete_events
	GROUP by Year) 
		as count_table

