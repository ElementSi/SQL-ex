-- Для тех производителей, у которых есть продукты с известной ценой хотя бы в одной из таблиц Laptop, PC, Printer
-- найти максимальные цены на каждый из типов продукции.
-- Вывод: maker, максимальная цена на ноутбуки, максимальная цена на ПК, максимальная цена на принтеры.
-- Для отсутствующих продуктов/цен использовать NULL.

WITH Item AS (SELECT model,
                     MAX(price) AS max_price
              FROM PC
              GROUP BY model

              UNION ALL

              SELECT model,
                     MAX(price) AS max_price
              FROM Laptop
              GROUP BY model

              UNION ALL

              SELECT model,
                     MAX(price) AS max_price
              FROM Printer
              GROUP BY model)

SELECT pr.maker,
       MAX(CASE WHEN pr.type = 'Laptop' THEN it.max_price END)  AS Laptop_max_price,
       MAX(CASE WHEN pr.type = 'PC' THEN it.max_price END)      AS PC_max_price,
       MAX(CASE WHEN pr.type = 'Printer' THEN it.max_price END) AS Printer_max_price
FROM Product AS pr
         LEFT JOIN Item AS it
                   ON pr.model = it.model
GROUP BY pr.maker
HAVING MAX(CASE WHEN pr.type = 'Laptop' THEN it.max_price END) IS NOT NULL
    OR MAX(CASE WHEN pr.type = 'PC' THEN it.max_price END) IS NOT NULL
    OR MAX(CASE WHEN pr.type = 'Printer' THEN it.max_price END) IS NOT NULL

