-- Для всех дней в интервале с 01/04/2003 по 07/04/2003 определить число рейсов из Rostov с пассажирами на борту.
-- Вывод: дата, количество рейсов.

WITH Dates AS (SELECT CAST('2003-04-01' AS DATETIME) AS date
               UNION ALL
               SELECT DATEADD(DAY, 1, date)
               FROM Dates
               WHERE date < '2003-04-07'),

     Flights AS (SELECT Pass.date,
                        COUNT(Pass.trip_no) AS qty
                 FROM (SELECT DISTINCT trip_no,
                                       date
                       FROM Pass_in_trip
                       WHERE date BETWEEN '2003-04-01' AND '2003-04-07') AS Pass
                          INNER JOIN Trip
                                     ON Pass.trip_no = Trip.trip_no
                 WHERE town_from = 'Rostov'
                 GROUP BY Pass.date)

SELECT Dates.date,
       COALESCE(Flights.qty, 0) AS qty
FROM Dates
         LEFT JOIN Flights
                   ON Dates.date = Flights.date