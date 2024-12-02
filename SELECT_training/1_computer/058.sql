-- Для каждого типа продукции и каждого производителя из таблицы Product
-- c точностью до двух десятичных знаков найти процентное отношение числа моделей данного типа данного производителя
-- к общему числу моделей этого производителя.
-- Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя

WITH Total_models AS (SELECT maker,
                             COUNT(model) * 1.0 AS total_num_f
                      FROM Product
                      GROUP BY maker),

     Type_models AS (SELECT maker,
                            type,
                            COUNT(model) * 1.0 AS type_num_f
                     FROM Product
                     GROUP BY maker, type),

     Maker_type_combinations AS (SELECT makers.maker,
                                        types.type
                                 FROM (SELECT DISTINCT maker FROM Product) AS makers
                                          CROSS JOIN
                                          (VALUES ('Laptop'), ('PC'), ('Printer')) AS types(type))

SELECT cmb.maker,
       cmb.type,
       CAST((COALESCE(typ.type_num_f, 0.0) / ttl.total_num_f) * 100
           AS NUMERIC(5, 2)) AS percentage
FROM Maker_type_combinations AS cmb
         LEFT JOIN
     Type_models AS typ
     ON cmb.maker = typ.maker
         AND cmb.type = typ.type
         INNER JOIN
     Total_models AS ttl
     ON cmb.maker = ttl.maker
