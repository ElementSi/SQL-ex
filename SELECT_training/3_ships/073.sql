-- Для каждой страны определить сражения, в которых не участвовали корабли данной страны.
-- Вывод: страна, сражение

WITH CountryBattles AS (SELECT DISTINCT CL.country,
                                        O.battle
                        FROM Outcomes AS O
                                 INNER JOIN Classes AS CL
                                            ON O.ship = CL.class
                                                OR O.ship IN (SELECT S.name
                                                              FROM Ships AS S
                                                              WHERE S.class = CL.class)),

     AllCombinations AS (SELECT C.country,
                                B.name AS battle
                         FROM (SELECT name FROM Battles) AS B
                                  CROSS JOIN (SELECT DISTINCT country FROM Classes) AS C)

SELECT AC.country,
       AC.battle
FROM AllCombinations AS AC
         LEFT JOIN CountryBattles AS CB
                   ON AC.country = CB.country AND AC.battle = CB.battle
WHERE CB.battle IS NULL
