-- Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
-- С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны,
-- у которой есть корабли в базе данных.

SELECT country,
       CAST(AVG(POWER(bore, 3)) / 2 AS NUMERIC(6, 2)) AS mw
FROM (SELECT country, name, bore
      FROM Classes
               INNER JOIN Ships
                          ON Classes.class = Ships.class
      UNION
      SELECT country, ship, bore
      FROM Classes
               INNER JOIN Outcomes
                          ON Classes.class = Outcomes.ship) AS All_Ships
GROUP BY country
