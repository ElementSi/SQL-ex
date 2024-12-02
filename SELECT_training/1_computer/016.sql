-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
-- В результате каждая пара указывается только один раз, т.е. (i, j), но не (j, i),
-- Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT PC_1.model, PC_2.model, PC_1.speed, PC_1.ram
FROM PC AS PC_1,
     PC AS PC_2
WHERE PC_1.speed = PC_2.speed
  AND PC_1.ram = PC_2.ram
  AND PC_1.model > PC_2.model
