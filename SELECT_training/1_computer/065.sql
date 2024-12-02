-- Пронумеровать уникальные пары {maker, type} из Product, упорядочив их следующим образом:
-- имя производителя (maker) по возрастанию;
-- тип продукта (type) в порядке PC, Laptop, Printer.
-- Если некий производитель выпускает несколько типов продукции, то выводить его имя только в первой строке;
-- остальные строки для ЭТОГО производителя должны содержать пустую строку символов ('').

WITH Maker_type AS (SELECT ROW_NUMBER() OVER (
    ORDER BY maker ASC
    )     AS maker_num
                         , maker
                         , ROW_NUMBER() OVER (
        PARTITION BY maker
        ORDER BY
            CASE type
                WHEN 'PC' THEN 1
                WHEN 'Laptop' THEN 2
                WHEN 'Printer' THEN 3
                ELSE 4
                END
        ) AS type_num
                         , type
                    FROM Product
                    GROUP BY maker, type)

SELECT maker_num AS num
     , CASE type_num
           WHEN 1 THEN maker
           ELSE ''
    END          AS maker
     , type
FROM Maker_type
