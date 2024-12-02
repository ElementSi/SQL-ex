-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT Product.model, PC.price
FROM Product
         INNER JOIN PC
                    ON Product.model = PC.model
WHERE Product.maker = 'B'
UNION
SELECT Product.model, Laptop.price
FROM Product
         INNER JOIN Laptop
                    ON Product.model = Laptop.model
WHERE Product.maker = 'B'
UNION
SELECT Product.model, Printer.price
FROM Product
         INNER JOIN Printer
                    ON Product.model = Printer.model
WHERE Product.maker = 'B'
