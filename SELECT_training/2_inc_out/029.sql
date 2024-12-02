-- В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день
-- [т.е. первичный ключ (пункт, дата)],
-- написать запрос с выходными данными (пункт, дата, приход, расход).
-- Использовать таблицы Income_o и Outcome_o.

SELECT CASE
           WHEN Income_o.point IS NOT NULL
               THEN Income_o.point
           ELSE Outcome_o.point
           END AS point,
       CASE
           WHEN Income_o.date IS NOT NULL
               THEN Income_o.date
           ELSE Outcome_o.date
           END AS date,
       inc,
       out
FROM Income_o
         FULL JOIN Outcome_o
                   ON Income_o.point = Outcome_o.point
                       AND Income_o.date = Outcome_o.date
