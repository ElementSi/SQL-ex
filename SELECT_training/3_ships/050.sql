-- Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.

SELECT DISTINCT battle
FROM Outcomes
WHERE ship IN (SELECT name
               FROM Ships
               WHERE Ships.class = 'Kongo')
