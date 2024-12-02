-- Найдите производителей ПК с процессором не менее 450 Мгц.
-- Вывести: Maker

SELECT DISTINCT Product.maker
FROM Product
         INNER JOIN PC
                    ON Product.model = PC.model
WHERE speed >= 450
