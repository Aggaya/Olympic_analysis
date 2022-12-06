-- Which nation has participated in all of the olympic games

SELECT region, net_games
FROM
	(SELECT 
		region, 
		count(distinct games) as net_games
	FROM athlete_events
	JOIN noc_regions on
		athlete_events.NOC = noc_regions.NOC
	GROUP by region)
WHERE net_games IN
	(SELECT count(DISTINCT Games) 
		FROM athlete_events 
	)


