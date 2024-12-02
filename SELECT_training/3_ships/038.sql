-- Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').

SELECT DISTINCT country
FROM (SELECT country
      FROM Classes
      WHERE type = 'bb'
      INTERSECT
      SELECT country
      FROM Classes
      WHERE type = 'bc') as x
