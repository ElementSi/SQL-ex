-- Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
-- определить максимальную цену на его продукцию.
-- Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL,
-- то выводить для этого производителя NULL, иначе максимальную цену.

WITH Maker_prices AS (SELECT maker, price
                      FROM Product
                               INNER JOIN (SELECT model, price
                                           FROM PC
                                           UNION
                                           SELECT model, price
                                           FROM Laptop
                                           UNION
                                           SELECT model, price
                                           FROM Printer) AS Model_prices
                                          ON Product.model = Model_prices.model)
SELECT maker,
       CASE
           WHEN COUNT(price) < COUNT(*) THEN NULL
           ELSE MAX(price)
           END AS max_price
FROM Maker_prices
GROUP BY maker
