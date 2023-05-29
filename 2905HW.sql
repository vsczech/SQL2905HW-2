/*
ПАРКТИЧЕСКОЕ ЗАНЯТИЕ №3

Условие по таблице staff:
Создадим таблицу.
*/
DROP DATABASE IF EXISTS Goods_And_Sales;
CREATE DATABASE IF NOT EXISTS Goods_And_Sales;

USE Goods_And_Sales;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`

(`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

/*
Задание 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
*/

SELECT *
FROM staff
ORDER BY salary DESC; -- В порядке убывания

SELECT *
FROM staff
ORDER BY salary ASC; -- В порядке возрастания

/*
Задание 2. Выведите 5 максимальных заработных плат (salary)
*/
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

/*
Задание 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
*/

SELECT  post, 
SUM(salary) AS 'Суммарная зарплата'
FROM staff
GROUP BY post;

/*
Задание 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
*/

SELECT COUNT(lastname)
FROM(SELECT  lastname
FROM staff
WHERE age >= 24 and age <= 49 and post = 'Рабочий') AS workers;

/*
Задание 5. Найдите количество специальностей
*/

SELECT COUNT(post) AS 'Количество специальностей'
FROM (SELECT  post
FROM staff
GROUP BY post) AS posts;

/*
Задание 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет (включительно)
*/

SELECT post
FROM(SELECT  post, 
AVG(age) AS average_age
FROM staff
GROUP BY post) AS posts
WHERE  average_age <= 30