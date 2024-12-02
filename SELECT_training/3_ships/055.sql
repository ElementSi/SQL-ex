-- Для каждого класса определите год, когда был спущен на воду первый корабль этого класса.
-- Если год спуска на воду головного корабля неизвестен, определите минимальный год спуска на воду кораблей этого класса.
-- Вывести: класс, год.

SELECT Classes.class, MIN(launched)
FROM Classes
         LEFT JOIN Ships
                   ON Classes.class = Ships.class
GROUP BY Classes.class
