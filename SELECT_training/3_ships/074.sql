-- Вывести все классы кораблей России (Russia).
-- Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран.
-- Вывод: страна, класс

SELECT country,
       class
FROM Classes
WHERE
    ('Russia' IN (SELECT country FROM Classes) AND country = 'Russia')
    OR
    ('Russia' NOT IN (SELECT country FROM Classes))
