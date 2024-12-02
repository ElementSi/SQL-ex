-- Найдите названия всех кораблей в базе данных, начинающихся с буквы R.

WITH All_ships AS (SELECT name
                   FROM Ships
                   UNION
                   SELECT ship
                   FROM Outcomes)
SELECT name
FROM All_ships
WHERE name LIKE 'R%'