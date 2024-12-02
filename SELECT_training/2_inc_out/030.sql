-- В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз
-- (первичным ключом в таблицах является столбец code), требуется получить таблицу,
-- в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
-- Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc).
-- Отсутствующие значения считать неопределенными (NULL).

WITH Income_sum AS (SELECT point, date, SUM(inc) AS inc_sum
                    FROM Income
                    GROUP BY point, date),
     Outcome_sum AS (SELECT point, date, SUM(out) AS out_sum
                     FROM Outcome
                     GROUP BY point, date)
SELECT COALESCE(Income_sum.point, Outcome_sum.point) AS point,
       COALESCE(Income_sum.date, Outcome_sum.date)   AS date,
       out_sum,
       inc_sum
FROM Income_sum
         FULL JOIN Outcome_sum
                   ON Income_sum.point = Outcome_sum.point
                       AND Income_sum.date = Outcome_sum.date
