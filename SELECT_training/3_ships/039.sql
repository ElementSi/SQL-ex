-- Найдите корабли, `сохранившиеся для будущих сражений`;
-- т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.

WITH Ships_history AS (SELECT ship,
                              date,
                              result
                       FROM Battles
                                INNER JOIN Outcomes
                                           ON Battles.name = Outcomes.battle)
SELECT DISTINCT ship
FROM Ships_history AS sh_1
WHERE sh_1.result = 'damaged'
  AND EXISTS (SELECT 1
              FROM Ships_history AS sh_2
              WHERE sh_1.ship = sh_2.ship
                AND sh_1.date < sh_2.date)
