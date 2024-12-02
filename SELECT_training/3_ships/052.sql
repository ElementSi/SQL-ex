-- Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
-- имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн

SELECT name
FROM Ships
         INNER JOIN Classes
                    ON Classes.class = Ships.class
WHERE (type IS NULL OR type = 'bb')
  AND (country IS NULL OR country = 'Japan')
  AND (numGuns IS NULL OR numGuns >= 9)
  AND (bore IS NULL OR bore < 19)
  AND (displacement IS NULL OR displacement <= 65000)
