-- Используя таблицы Income и Outcome,
-- для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
-- Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.

WITH Income_sum AS (SELECT point, date, SUM(inc) as total_inc
                    FROM Income
                    GROUP BY point, date)

   , Outcome_sum AS (SELECT point, date, SUM(out) as total_out
                     FROM Outcome
                     GROUP BY point, date)

SELECT COALESCE(ISum.point, OSum.point)         AS point
     , COALESCE(ISum.date, OSum.date)           AS date
     , CASE
           WHEN ISum.date IS NOT NULL AND OSum.date IS NULL THEN 'inc'
           WHEN ISum.date IS NULL AND OSum.date IS NOT NULL THEN 'out'
    END                                         AS type
     , COALESCE(ISum.total_inc, OSum.total_out) AS total
FROM Income_sum AS ISum
         FULL JOIN Outcome_sum AS OSum
                   ON ISum.point = OSum.point AND ISum.date = OSum.date
WHERE (ISum.date IS NULL OR OSum.date IS NULL)
