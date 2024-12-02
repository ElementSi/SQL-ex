-- Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц,
-- так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker

SELECT maker
FROM (SELECT maker
      FROM Product
               INNER JOIN PC
                          ON Product.model = PC.model
      WHERE speed >= 750
      INTERSECT
      SELECT maker
      FROM Product
               INNER JOIN Laptop
                          ON Product.model = Laptop.model
      WHERE speed >= 750) AS x
