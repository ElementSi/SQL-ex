-- Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.

SELECT name
FROM Battles
WHERE DATEPART(yyyy, date) NOT IN (SELECT launched
                                   FROM Ships
                                   WHERE launched IS NOT NULL)
