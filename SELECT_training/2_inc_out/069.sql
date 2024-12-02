-- По таблицам Income и Outcome для каждого пункта приема найти остатки денежных средств на конец каждого дня,
-- в который выполнялись операции по приходу и/или расходу на данном пункте.
-- Учесть при этом, что деньги не изымаются, а остатки/задолженность переходят на следующий день.
-- Вывод: пункт приема, день в формате "dd/mm/yyyy", остатки/задолженность на конец этого дня.

WITH Balance_o AS (SELECT COALESCE(ai.point, ao.point)                          AS point,
                          COALESCE(ai.date, ao.date)                            AS date,
                          COALESCE(ai.total_inc, 0) - COALESCE(ao.total_out, 0) AS bal
                   FROM (SELECT point,
                                date,
                                SUM(inc) AS total_inc
                         FROM Income
                         GROUP BY point, date) AS ai
                            FULL JOIN (SELECT point,
                                              date,
                                              SUM(out) AS total_out
                                       FROM Outcome
                                       GROUP BY point, date) AS ao
                                      ON ai.point = ao.point AND ai.date = ao.date)

SELECT point,
       FORMAT(date, 'dd/MM/yyyy') AS day,
       (SELECT SUM(bal)
        FROM Balance_o
        WHERE point = b.point
          AND date <= b.date)     AS run_bal
FROM Balance_o AS b
