-- С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей
-- (учесть корабли из таблицы Outcomes).

WITH BB_ships AS (SELECT name, numGuns
                  FROM Classes
                           RIGHT JOIN Ships
                                      ON Classes.class = Ships.class
                  WHERE type = 'bb'
                  UNION
                  SELECT ship, numGuns
                  FROM Classes
                           RIGHT JOIN Outcomes
                                      ON Classes.class = Outcomes.ship
                  WHERE type = 'bb')

SELECT CAST(AVG(numGuns * 1.0) AS NUMERIC(4, 2))
FROM BB_ships
