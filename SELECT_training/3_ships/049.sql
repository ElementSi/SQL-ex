-- Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).

WITH All_ships AS (SELECT name, bore
                   FROM Classes
                            INNER JOIN Ships
                                       ON Classes.class = Ships.class
                   UNION
                   SELECT ship, bore
                   FROM Classes
                            INNER JOIN Outcomes
                                       ON Classes.class = Outcomes.ship)

SELECT name
FROM All_ships
WHERE bore = 16
