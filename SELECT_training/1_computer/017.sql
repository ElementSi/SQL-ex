-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
-- Вывести: type, model, speed

SELECT DISTINCT type, Laptop.model, speed
FROM Product
         INNER JOIN Laptop
                    ON Product.model = Laptop.model
WHERE speed < ALL (SELECT speed
                   FROM PC)
