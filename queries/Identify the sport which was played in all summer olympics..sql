-- Identify the sport which was played in all summer olympics.

SELECT Sport , total_games
FROM (
		SELECT Sport , count(Games) as total_games
		FROM (
				SELECT DISTINCT Sport  , Games
				FROM athlete_events
				WHERE Season = "Summer"
				ORDER By Games)
		GROUP By Sport)

WHERE total_games IN 
		(	
			SELECT count(Distinct Games)
			FROM athlete_events
			WHERE Season = "Summer" 	--29
		)
