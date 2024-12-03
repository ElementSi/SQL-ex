-- Среди тех, кто пользуется услугами только какой-нибудь одной компании,
-- определить имена разных пассажиров, летавших чаще других.
-- Вывести: имя пассажира и число полетов.

WITH Loyal_Passenger AS (SELECT psg.name,
                                COUNT(pit.trip_no) AS flights_qty
                         FROM Passenger AS psg
                                  INNER JOIN Pass_in_trip AS pit
                                             ON psg.ID_psg = pit.ID_psg
                                  INNER JOIN Trip AS trp
                                             ON pit.trip_no = trp.trip_no
                         GROUP BY psg.ID_psg, psg.name
                         HAVING COUNT(DISTINCT trp.ID_comp) = 1)

SELECT name,
       flights_qty
FROM Loyal_Passenger
WHERE flights_qty = (SELECT MAX(lp1.flights_qty)
                     FROM Loyal_Passenger AS lp1)
