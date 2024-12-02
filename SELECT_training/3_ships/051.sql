-- Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения
-- (учесть корабли из таблицы Outcomes).

WITH All_ships AS (SELECT name, numGuns, displacement
                   FROM Classes
                            INNER JOIN Ships
                                       ON Classes.class = Ships.class
                   UNION
                   SELECT ship, numGuns, displacement
                   FROM Classes
                            INNER JOIN Outcomes
                                       ON Classes.class = Outcomes.ship)

SELECT S1.name
FROM All_ships AS S1
WHERE S1.numGuns >= ALL (SELECT numGuns
                         FROM All_ships AS S2
                         WHERE S2.displacement = S1.displacement)
