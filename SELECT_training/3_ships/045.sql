-- Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
-- Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.

WITH All_ships AS (SELECT name
                   FROM Ships
                   UNION
                   SELECT ship
                   FROM Outcomes)
SELECT name
FROM All_ships
WHERE name LIKE '% % %'
