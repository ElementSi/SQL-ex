-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

WITH All_products AS (SELECT DISTINCT model, price
                      FROM PC
                      UNION
                      SELECT DISTINCT model, price
                      FROM Laptop
                      UNION
                      SELECT DISTINCT model, price
                      FROM Printer)
SELECT model
FROM All_products
WHERE price = (SELECT MAX(price)
               FROM All_products)
