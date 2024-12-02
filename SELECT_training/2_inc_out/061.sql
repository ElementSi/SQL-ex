-- Посчитать остаток денежных средств на всех пунктах приема для базы данных с отчетностью не чаще одного раза в день.

WITH Balance_o AS (SELECT COALESCE(i.point, o.point)              AS point
                        , COALESCE(i.date, o.date)                AS date
                        , COALESCE(i.inc, 0) - COALESCE(o.out, 0) AS balance
                   FROM Income_o AS i
                            FULL JOIN Outcome_o AS o
                                      ON i.point = o.point AND i.date = o.date)

SELECT SUM(balance)
FROM Balance_o