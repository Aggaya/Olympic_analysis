-- Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).

WITH 
	table_1 as (
		SELECT Name, count(medal),
		dense_rank () OVER (ORDER BY count(medal) DESC) as mdl_rnk
		FROM athlete_events
		WHERE Medal <> "NA"
		GROUP By Name
		ORDER BY count(medal) DESC )

SELECT * 
FROM table_1
WHERE mdl_rnk <=5
		
		
-- with t1 as
--             (select name, team, count(1) as total_medals
--             from athlete_events
--             where medal in ('Gold', 'Silver', 'Bronze')
--             group by name, team
--             order by total_medals desc),
--         t2 as
--             (select *, dense_rank() over (order by total_medals desc) as rnk
--             from t1)
--     select name, team, total_medals
--     from t2
--     where rnk <= 5;