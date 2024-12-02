-- Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
-- Замечания.
-- 1) A - B и B - A считать ОДНИМ И ТЕМ ЖЕ маршрутом.
-- 2) Использовать только таблицу Trip

WITH Routes AS (SELECT COUNT(*) AS qty
                FROM (SELECT IIF(town_from < town_to, town_from, town_to) AS town_1,
                             IIF(town_from < town_to, town_to, town_from) AS town_2
                      FROM Trip) AS tr
                GROUP BY town_1, town_2)

SELECT COUNT(qty) AS most_popular_num
FROM Routes
WHERE qty = (SELECT MAX(qty)
             FROM Routes)
