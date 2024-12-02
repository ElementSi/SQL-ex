-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT DISTINCT Product.maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT DISTINCT Product.maker
FROM Product
WHERE type = 'Laptop'
