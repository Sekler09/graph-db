USE master;
 
DROP DATABASE IF EXISTS Trello;

CREATE DATABASE Trello;

USE Trello;

-- Таблица узлов для разработчиков
CREATE TABLE Developer
(
	id INT NOT NULL PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	email NVARCHAR(50) NOT NULL
) AS NODE;

-- Заполнение таблицы узлов для разработчиков
INSERT INTO Developer (id, name, email) 
VALUES (1, N'Низюк Иван Петрович', N'nizIVA@gmail.com'), 
	   (2, N'Плювакин Петр Сергеевич', N'plevok.petr@gmail.com'),
	   (3, N'Кошкин Никита Иванович', N'nikcat@gmail.com'),
	   (4, N'Козлов Константин Александрович', N'kostya.goat@gmail.com'),
	   (5, N'Смирнова Анастасия Андреевна', N'smirnaya@gmail.com'),
	   (6, N'Ковалев Кирилл Александрович', N'kirkoval@gmail.com'),
	   (7, N'Данилова Ольга Викторовна', N'olga.danilova@gmail.com'),
	   (8, N'Михайлов Игорь Геннадьевич', N'mishaigorev@gmail.com'),
	   (9, N'Андреев Игорь Владимирович', N'igorandrrr@gmail.com'), 
	   (10, N'Васильев Сергей Михайлович', N'serg221@gmail.com'),
	   (11, N'Федоров Олег Петрович', N'feeedorov@gmail.com'), 
	   (12, N'Белов Артем Викторович', N'tyomawhite@gmail.com'),
	   (13, N'Григорьев Евгений Евгеньевич', N'goshinzheka@gmail.com'),
	   (14, N'Кузнецова Екатерина Андреевна', N'kuzzzzya@gmail.com'),
	   (15, N'Лебедев Александр Иванович', N'lebed.shura@gmail.com');


SELECT *
FROM Developer
-- Таблица узлов для комментариев
CREATE TABLE Comment(
    id INT NOT NULL PRIMARY KEY,
    CommentText NVARCHAR(500) NOT NULL
) AS NODE;

-- Заполнение таблицы узлов для комментариев
INSERT INTO Comment (id, CommentText)
VALUES (1, N'Задание выполнено успешно'),
	   (2, N'Нужно исправить ошибку на строке 23'),
	   (3, N'Пожалуйста, проверьте этот код'),
	   (4, N'Этот алгоритм нужно ускорить'),
	   (5, N'Мне кажется, здесь есть логическая ошибка'),
	   (6, N'Отличная работа, продолжайте в том же духе'),
	   (7, N'Этот код нужно переписать, чтобы он был более читаемым'),
	   (8, N'Можно ли как-то оптимизировать этот код?'),
	   (9, N'Спасибо за объяснения, теперь я все понимаю'),
	   (10, N'Нужно добавить обработку исключений в эту функцию'),
	   (11, N'Почему здесь используется цикл вместо рекурсии?'),
	   (12, N'Я бы рекомендовал использовать другой алгоритм для этой задачи'),
	   (13, N'Пожалуйста, добавьте комментарии к этому коду'),
	   (14, N'Здесь есть потенциальная утечка памяти'),
	   (15, N'Нужно провести более тщательное тестирование этой функции');


SELECT *
FROM Comment


-- Таблица узлов для задач
CREATE TABLE Task (
    id INT NOT NULL PRIMARY KEY,
    TaskName NVARCHAR(255) NOT NULL,
    TaskDescription NVARCHAR(MAX) NOT NULL
) AS NODE;

-- Заполнение таблицы узлов для задач
INSERT INTO Task (id, TaskName, TaskDescription)
VALUES (1, N'Разработка веб-приложения', N'Нужно разработать веб-приложение для учета времени работы сотрудников.'),
	   (2, N'Анализ данных', N'Необходимо проанализировать данные о продажах и определить наиболее популярный продукт.'),
	   (3, N'Интеграция API', N'Требуется интегрировать API стороннего сервиса в нашу систему.'),
	   (4, N'Тестирование приложения', N'Необходимо написать и провести тесты для нашего приложения.'),
	   (5, N'Обучение нейронной сети', N'Нужно обучить нейронную сеть для распознавания образов.'),
	   (6, N'Разработка мобильного приложения', N'Требуется разработать мобильное приложение для заказа еды.'),
	   (7, N'Оптимизация производительности', N'Необходимо оптимизировать производительность нашей системы.'),
	   (8, N'Разработка игры', N'Нужно разработать компьютерную игру на базе нашего движка.'),
	   (9, N'Создание дизайна интерфейса', N'Требуется создать дизайн интерфейса для нашего нового продукта.'),
	   (10, N'Разработка алгоритма', N'Необходимо разработать алгоритм для распознавания речи.'),
	   (11, N'Работа с базой данных', N'Требуется настроить и оптимизировать работу с базой данных.'),
	   (12, N'Разработка системы автоматизации', N'Нужно разработать систему автоматизации для нашего производства.'),
	   (13, N'Создание инфраструктуры для тестирования', N'Требуется создать инфраструктуру для автоматического тестирования нашего приложения.'),
	   (14, N'Разработка системы безопасности', N'Необходимо разработать систему безопасности для наших пользователей.'),
	   (15, N'Создание архитектуры приложения', N'Требуется создать архитектуру приложения для нашего нового продукта.');


SELECT *
FROM Task


-- Создание таблиц-ребер

-- Создание таблицы ребер для комментирования задач	
CREATE TABLE CommentTaskEdge AS EDGE;
ALTER TABLE CommentTaskEdge ADD CONSTRAINT EC_CommentTaskEdge CONNECTION (Comment TO Task);

-- Заполнение таблицы ребер для комментирования задач
INSERT INTO CommentTaskEdge ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Comment WHERE ID = 1), (SELECT $node_id FROM Task WHERE ID = 12)),
	   ((SELECT $node_id FROM Comment WHERE ID = 2), (SELECT $node_id FROM Task WHERE ID = 13)),
	   ((SELECT $node_id FROM Comment WHERE ID = 4), (SELECT $node_id FROM Task WHERE ID = 11)),
	   ((SELECT $node_id FROM Comment WHERE ID = 3), (SELECT $node_id FROM Task WHERE ID = 12)),
	   ((SELECT $node_id FROM Comment WHERE ID = 6), (SELECT $node_id FROM Task WHERE ID = 9)),
	   ((SELECT $node_id FROM Comment WHERE ID = 5), (SELECT $node_id FROM Task WHERE ID = 15)),
	   ((SELECT $node_id FROM Comment WHERE ID = 7), (SELECT $node_id FROM Task WHERE ID = 1)),
	   ((SELECT $node_id FROM Comment WHERE ID = 8), (SELECT $node_id FROM Task WHERE ID = 2)),
	   ((SELECT $node_id FROM Comment WHERE ID = 9), (SELECT $node_id FROM Task WHERE ID = 3)),
	   ((SELECT $node_id FROM Comment WHERE ID = 10), (SELECT $node_id FROM Task WHERE ID = 5)),
	   ((SELECT $node_id FROM Comment WHERE ID = 11), (SELECT $node_id FROM Task WHERE ID = 4)),
	   ((SELECT $node_id FROM Comment WHERE ID = 12), (SELECT $node_id FROM Task WHERE ID = 6)),
	   ((SELECT $node_id FROM Comment WHERE ID = 13), (SELECT $node_id FROM Task WHERE ID = 8)),
	   ((SELECT $node_id FROM Comment WHERE ID = 14), (SELECT $node_id FROM Task WHERE ID = 7)),
	   ((SELECT $node_id FROM Comment WHERE ID = 15), (SELECT $node_id FROM Task WHERE ID = 9))

SELECT *
FROM CommentTaskEdge

-- Создание таблицы ребер для сотрудничества между разработчиками
CREATE TABLE DeveloperCollaborationEdge AS EDGE; 
ALTER TABLE DeveloperCollaborationEdge ADD CONSTRAINT EC_DeveloperCollaborationEdge CONNECTION (Developer TO Developer);

-- Заполнение таблицы ребер для сотрудничества между разработчиками
INSERT INTO DeveloperCollaborationEdge ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Developer WHERE ID = 1), (SELECT $node_id FROM Developer WHERE ID = 2)),
	   ((SELECT $node_id FROM Developer WHERE ID = 3), (SELECT $node_id FROM Developer WHERE ID = 5)),
	   ((SELECT $node_id FROM Developer WHERE ID = 5), (SELECT $node_id FROM Developer WHERE ID = 7)),
	   ((SELECT $node_id FROM Developer WHERE ID = 6), (SELECT $node_id FROM Developer WHERE ID = 1)),
	   ((SELECT $node_id FROM Developer WHERE ID = 6), (SELECT $node_id FROM Developer WHERE ID = 9)),
	   ((SELECT $node_id FROM Developer WHERE ID = 5), (SELECT $node_id FROM Developer WHERE ID = 12)),
	   ((SELECT $node_id FROM Developer WHERE ID = 15), (SELECT $node_id FROM Developer WHERE ID = 14)),
	   ((SELECT $node_id FROM Developer WHERE ID = 4), (SELECT $node_id FROM Developer WHERE ID = 8)),
	   ((SELECT $node_id FROM Developer WHERE ID = 11), (SELECT $node_id FROM Developer WHERE ID = 12)),
	   ((SELECT $node_id FROM Developer WHERE ID = 13), (SELECT $node_id FROM Developer WHERE ID = 2)),
	   ((SELECT $node_id FROM Developer WHERE ID = 7), (SELECT $node_id FROM Developer WHERE ID = 12))

SELECT *
FROM DeveloperCollaborationEdge

 -- Создание таблицы ребер для работы разработчиками над задачей
CREATE TABLE DeveloperTaskEdge AS EDGE;
ALTER TABLE DeveloperTaskEdge ADD CONSTRAINT EC_DeveloperTaskEdge CONNECTION (Developer TO Task);

-- Заполнение таблицы ребер для работы разработчиками над задачей
INSERT INTO DeveloperTaskEdge ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Developer WHERE ID = 1), (SELECT $node_id FROM Task WHERE ID = 15)),
       ((SELECT $node_id FROM Developer WHERE ID = 2), (SELECT $node_id FROM Task WHERE ID = 15)),
	   ((SELECT $node_id FROM Developer WHERE ID = 3), (SELECT $node_id FROM Task WHERE ID = 14)),
	   ((SELECT $node_id FROM Developer WHERE ID = 5), (SELECT $node_id FROM Task WHERE ID = 14)),
	   ((SELECT $node_id FROM Developer WHERE ID = 5), (SELECT $node_id FROM Task WHERE ID = 13)),
	   ((SELECT $node_id FROM Developer WHERE ID = 7), (SELECT $node_id FROM Task WHERE ID = 13)),
	   ((SELECT $node_id FROM Developer WHERE ID = 6), (SELECT $node_id FROM Task WHERE ID = 12)),
	   ((SELECT $node_id FROM Developer WHERE ID = 1), (SELECT $node_id FROM Task WHERE ID = 12)),
	   ((SELECT $node_id FROM Developer WHERE ID = 6), (SELECT $node_id FROM Task WHERE ID = 11)),
	   ((SELECT $node_id FROM Developer WHERE ID = 9), (SELECT $node_id FROM Task WHERE ID = 11)),
	   ((SELECT $node_id FROM Developer WHERE ID = 5), (SELECT $node_id FROM Task WHERE ID = 10)),
	   ((SELECT $node_id FROM Developer WHERE ID = 12), (SELECT $node_id FROM Task WHERE ID = 10)),
	   ((SELECT $node_id FROM Developer WHERE ID = 15), (SELECT $node_id FROM Task WHERE ID = 9)),
	   ((SELECT $node_id FROM Developer WHERE ID = 14), (SELECT $node_id FROM Task WHERE ID = 9)),
	   ((SELECT $node_id FROM Developer WHERE ID = 4), (SELECT $node_id FROM Task WHERE ID = 8)),
	   ((SELECT $node_id FROM Developer WHERE ID = 8), (SELECT $node_id FROM Task WHERE ID = 8)),
	   ((SELECT $node_id FROM Developer WHERE ID = 11), (SELECT $node_id FROM Task WHERE ID = 7)),
	   ((SELECT $node_id FROM Developer WHERE ID = 12), (SELECT $node_id FROM Task WHERE ID = 7)),
	   ((SELECT $node_id FROM Developer WHERE ID = 13), (SELECT $node_id FROM Task WHERE ID = 6)),
	   ((SELECT $node_id FROM Developer WHERE ID = 2), (SELECT $node_id FROM Task WHERE ID = 6)),
	   ((SELECT $node_id FROM Developer WHERE ID = 7), (SELECT $node_id FROM Task WHERE ID = 5)),
	   ((SELECT $node_id FROM Developer WHERE ID = 12), (SELECT $node_id FROM Task WHERE ID = 5)),
	   ((SELECT $node_id FROM Developer WHERE ID = 10), (SELECT $node_id FROM Task WHERE ID = 4)),
	   ((SELECT $node_id FROM Developer WHERE ID = 3), (SELECT $node_id FROM Task WHERE ID = 3)),
	   ((SELECT $node_id FROM Developer WHERE ID = 8), (SELECT $node_id FROM Task WHERE ID = 2)),
	   ((SELECT $node_id FROM Developer WHERE ID = 12), (SELECT $node_id FROM Task WHERE ID = 1))

SELECT *
FROM DeveloperTaskEdge



-- Создание таблицы ребер для оставления разработчиками комментариев
CREATE TABLE DeveloperCommentEdge AS EDGE;
ALTER TABLE DeveloperCommentEdge ADD CONSTRAINT EC_DeveloperCommentEdge CONNECTION (Developer TO Comment);

-- Заполнение таблицы ребер для оставления разработчиками комментариев
INSERT INTO DeveloperCommentEdge ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Developer WHERE ID = 11), (SELECT $node_id FROM Comment WHERE ID = 1)),
	   ((SELECT $node_id FROM Developer WHERE ID = 2), (SELECT $node_id FROM Comment WHERE ID = 2)),
	   ((SELECT $node_id FROM Developer WHERE ID = 14), (SELECT $node_id FROM Comment WHERE ID = 4)),
	   ((SELECT $node_id FROM Developer WHERE ID = 6), (SELECT $node_id FROM Comment WHERE ID = 3)),
	   ((SELECT $node_id FROM Developer WHERE ID = 5), (SELECT $node_id FROM Comment WHERE ID = 6)),
	   ((SELECT $node_id FROM Developer WHERE ID = 7), (SELECT $node_id FROM Comment WHERE ID = 5)),
	   ((SELECT $node_id FROM Developer WHERE ID = 9), (SELECT $node_id FROM Comment WHERE ID = 7)),
	   ((SELECT $node_id FROM Developer WHERE ID = 8), (SELECT $node_id FROM Comment WHERE ID = 8)),
	   ((SELECT $node_id FROM Developer WHERE ID = 10), (SELECT $node_id FROM Comment WHERE ID = 9)),
	   ((SELECT $node_id FROM Developer WHERE ID = 1), (SELECT $node_id FROM Comment WHERE ID = 10)),
	   ((SELECT $node_id FROM Developer WHERE ID = 4), (SELECT $node_id FROM Comment WHERE ID = 11)),
	   ((SELECT $node_id FROM Developer WHERE ID = 12), (SELECT $node_id FROM Comment WHERE ID = 12)),
	   ((SELECT $node_id FROM Developer WHERE ID = 15), (SELECT $node_id FROM Comment WHERE ID = 13)),
	   ((SELECT $node_id FROM Developer WHERE ID = 11), (SELECT $node_id FROM Comment WHERE ID = 14)),
	   ((SELECT $node_id FROM Developer WHERE ID = 3), (SELECT $node_id FROM Comment WHERE ID = 15))

SELECT *
FROM DeveloperCommentEdge


--запрос где главный разработчик - Низюк
SELECT Developer1.name
 , Developer2.name AS [Developer Collaboration name]
FROM Developer AS Developer1
 , DeveloperCollaborationEdge
 , Developer AS Developer2
WHERE MATCH(Developer1-(DeveloperCollaborationEdge)->Developer2) AND Developer1.name = N'Низюк Иван Петрович';

--все, кто не работает с Низюк
SELECT DISTINCT Developer2.name
FROM Developer AS Developer1
 , DeveloperCollaborationEdge
 , Developer AS Developer2
WHERE MATCH(Developer1-(DeveloperCollaborationEdge)->Developer2) AND Developer1.name <> N'Низюк Иван Петрович' AND Developer2.name <> N'Низюк Иван Петрович';


--проекты Смирновой
SELECT Developer1.name as[Developer]
 , Task2.TaskName AS [Task]
FROM Developer AS Developer1
 , DeveloperTaskEdge
 , Task AS Task2
WHERE MATCH(Developer1-(DeveloperTaskEdge)->Task2)  AND Developer1.name =N'Смирнова Анастасия Андреевна';

--иерархия в разработке проекта Смирновой
SELECT Developer1.name + N' работает над проектом с ' + Developer2.name AS Level1
 , Developer2.name + N' работает над проектом с  ' + Developer3.name AS Level2
FROM Developer AS Developer1
 , DeveloperCollaborationEdge AS DeveloperCollaboration1
 , Developer AS Developer2
 , DeveloperCollaborationEdge AS DeveloperCollaboration2
 , Developer AS Developer3
WHERE MATCH(Developer1-(DeveloperCollaboration1)->Developer2-(DeveloperCollaboration2)->Developer3)
 AND Developer1.name =N'Смирнова Анастасия Андреевна';



-- запрос показывающий разработчиков, задачи и комментарии 
SELECT Developer1.name as[Developer],Task2.TaskName AS [Task]
 , Comment2.CommentText AS [Comment]
FROM Developer AS Developer1
 , DeveloperTaskEdge
 , Task as Task2
 , CommentTaskEdge
 , Comment AS Comment2
WHERE MATCH(Developer1-(DeveloperTaskEdge)->Task2<-(CommentTaskEdge)-Comment2) ;



--SHORTEST_PATH1
SELECT Developer1.name AS DeveloperName
 , STRING_AGG(Developer2.name, '->') WITHIN GROUP (GRAPH PATH) AS
[Collab]
FROM Developer AS Developer1
 , DeveloperCollaborationEdge FOR PATH AS dev
 , Developer FOR PATH AS Developer2
WHERE MATCH(SHORTEST_PATH(Developer1(-(dev)->Developer2)+))
 AND Developer1.name = N'Смирнова Анастасия Андреевна';

 --SHORTEST_PATH2
DECLARE @DeveloperFrom AS NVARCHAR(50) =N'Смирнова Анастасия Андреевна';
DECLARE @DeveloperTo AS NVARCHAR(50) =  N'Белов Артем Викторович';
WITH T1 AS
(
SELECT Developer1.name AS DeveloperName
 , STRING_AGG(Developer2.name, '->') WITHIN GROUP (GRAPH PATH)
AS Friends
 , LAST_VALUE(Developer2.name) WITHIN GROUP (GRAPH PATH) AS
LastNode
FROM Developer AS Developer1
 , DeveloperCollaborationEdge FOR PATH AS fo
 , Developer FOR PATH AS Developer2
WHERE MATCH(SHORTEST_PATH(Developer1(-(fo)->Developer2)+))
 AND Developer1.name = @DeveloperFrom
)
SELECT DeveloperName, Friends
FROM T1
WHERE LastNode = @DeveloperTo;
