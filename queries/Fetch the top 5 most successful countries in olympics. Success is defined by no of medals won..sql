-- Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.

SELECT region , total_medals
FROM 
	(SELECT region , count(medal) as total_medals ,
			dense_rank() OVER (ORDER By count(medal) DESC) as medal_rank
	FROM athlete_events
	JOIN noc_regions ON
		athlete_events.NOC = noc_regions.NOC
	WHERE Medal <> "NA"
	GROUP By region
	ORDER By count(medal) DESC)
WHERE medal_rank <= 5


			


