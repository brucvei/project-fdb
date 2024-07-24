SELECT Season, COUNT(*) AS Number_of_Games
FROM olympic
GROUP BY Season
ORDER BY Season;

SELECT sport, COUNT(*) AS Total
FROM modality
GROUP BY sport
ORDER BY Total DESC;

WITH MedalCounts AS (SELECT id_atlhete_modality,
                            SUM(CASE
                                    WHEN Medal = 'Bronze'
                                        THEN 1
                                    ELSE 0 END) AS
                                                   Bronze_Medals,
                            SUM(CASE
                                    WHEN Medal = 'Silver'
                                        THEN 1
                                    ELSE 0 END) AS
                                                   Silver_Medals,
                            SUM(CASE
                                    WHEN Medal = 'Gold'
                                        THEN 1
                                    ELSE 0 END) AS
                                                   Gold_Medals,
                            SUM(CASE
                                    WHEN Medal IN ('Bronze',
                                                   'Silver', 'Gold') THEN 1
                                    ELSE 0 END)
                                                AS Total_Medals
                     FROM medals
                     GROUP BY id_atlhete_modality)
SELECT id_atlhete_modality,
       Bronze_Medals,
       Silver_Medals,
       Gold_Medals,
       Total_Medals
FROM MedalCounts
ORDER BY Total_Medals DESC
LIMIT 10;