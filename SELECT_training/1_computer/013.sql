-- Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed)
FROM Product
         INNER JOIN PC
                    ON Product.model = PC.model
WHERE maker = 'A'
