-- Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
-- Замечания.
-- 1) A - B и B - A считать РАЗНЫМИ маршрутами.
-- 2) Использовать только таблицу Trip

WITH Routes AS (SELECT COUNT(trip_no) AS qty
                FROM Trip
                GROUP BY town_from, town_to)

SELECT COUNT(qty) AS most_popular_num
FROM Routes
WHERE qty = (SELECT MAX(qty)
             FROM Routes)
