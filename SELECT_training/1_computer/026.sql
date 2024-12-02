-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква).
-- Вывести: одна общая средняя цена.

SELECT AVG(price)
FROM (SELECT price
      FROM Product
               INNER JOIN PC
                          ON Product.model = PC.model
      WHERE maker = 'A'
      UNION ALL
      SELECT price
      FROM Product
               INNER JOIN Laptop
                          ON Product.model = Laptop.model
      WHERE maker = 'A') x
