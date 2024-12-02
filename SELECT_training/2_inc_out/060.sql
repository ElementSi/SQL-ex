-- Посчитать остаток денежных средств на начало дня 15/04/2001
-- на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день.
-- Вывод: пункт, остаток.
-- Замечание. Не учитывать пункты, информации о которых нет до указанной даты.

WITH Balance_o AS (SELECT COALESCE(i.point, o.point)              AS point
                        , COALESCE(i.date, o.date)                AS date
                        , COALESCE(i.inc, 0) - COALESCE(o.out, 0) AS balance
                   FROM Income_o AS i
                            FULL JOIN Outcome_o AS o
                                      ON i.point = o.point AND i.date = o.date)

SELECT point, SUM(balance)
FROM Balance_o
WHERE date < '2001-04-15'
GROUP BY point
