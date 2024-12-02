-- Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/2001
-- для базы данных с отчетностью не чаще одного раза в день.

SELECT SUM(balance)
FROM (SELECT COALESCE(i.point, o.point)              AS point
           , COALESCE(i.date, o.date)                AS date
           , COALESCE(i.inc, 0) - COALESCE(o.out, 0) AS balance
      FROM Income_o AS i
               FULL JOIN Outcome_o AS o
                         ON i.point = o.point AND i.date = o.date
      WHERE COALESCE(i.date, o.date) < '2001-04-15') AS b
