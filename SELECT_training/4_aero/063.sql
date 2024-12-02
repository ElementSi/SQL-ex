-- Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.

SELECT psg.name
FROM (SELECT DISTINCT ID_psg
      FROM Pass_in_trip
      GROUP BY ID_psg, place
      HAVING COUNT(trip_no) > 1) AS x
         INNER JOIN
     Passenger AS psg
     ON x.ID_psg = psg.ID_psg
