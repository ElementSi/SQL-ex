-- Найти производителей, которые выпускают более одной модели,
-- при этом все выпускаемые производителем модели являются продуктами одного типа.
-- Вывести: maker, type

SELECT maker, MIN(type)
FROM Product
GROUP BY maker
HAVING COUNT(model) > 1
   AND COUNT(DISTINCT type) = 1
