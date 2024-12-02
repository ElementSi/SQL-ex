-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM
-- и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM.
-- Вывести: Maker

SELECT DISTINCT maker
FROM Product
         INNER JOIN PC
                    ON Product.model = PC.model
WHERE speed = (SELECT MAX(speed)
               FROM PC
               WHERE ram = (SELECT MIN(ram)
                            FROM PC))
  AND maker IN (SELECT maker
                FROM Product
                WHERE type = 'Printer')
  AND ram = (SELECT MIN(ram)
             FROM PC)
