-- Определите среднее число орудий для классов линейных кораблей.
-- Получить результат с точностью до 2-х десятичных знаков.

SELECT CAST(AVG(numGuns * 1.0) AS NUMERIC(4, 2))
FROM Classes
WHERE type = 'bb'
