USE master;
 
DROP DATABASE IF EXISTS Trello;

CREATE DATABASE Trello;

USE Trello;

-- ������� ����� ��� �������������
CREATE TABLE Developer
(
	id INT NOT NULL PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	email NVARCHAR(50) NOT NULL
) AS NODE;

-- ���������� ������� ����� ��� �������������
INSERT INTO Developer (id, name, email) 
VALUES (1, N'����� ���� ��������', N'nizIVA@gmail.com'), 
	   (2, N'�������� ���� ���������', N'plevok.petr@gmail.com'),
	   (3, N'������ ������ ��������', N'nikcat@gmail.com'),
	   (4, N'������ ���������� �������������', N'kostya.goat@gmail.com'),
	   (5, N'�������� ��������� ���������', N'smirnaya@gmail.com'),
	   (6, N'������� ������ �������������', N'kirkoval@gmail.com'),
	   (7, N'�������� ����� ����������', N'olga.danilova@gmail.com'),
	   (8, N'�������� ����� �����������', N'mishaigorev@gmail.com'),
	   (9, N'������� ����� ������������', N'igorandrrr@gmail.com'), 
	   (10, N'�������� ������ ����������', N'serg221@gmail.com'),
	   (11, N'������� ���� ��������', N'feeedorov@gmail.com'), 
	   (12, N'����� ����� ����������', N'tyomawhite@gmail.com'),
	   (13, N'��������� ������� ����������', N'goshinzheka@gmail.com'),
	   (14, N'��������� ��������� ���������', N'kuzzzzya@gmail.com'),
	   (15, N'������� ��������� ��������', N'lebed.shura@gmail.com');


SELECT *
FROM Developer
-- ������� ����� ��� ������������
CREATE TABLE Comment(
    id INT NOT NULL PRIMARY KEY,
    CommentText NVARCHAR(500) NOT NULL
) AS NODE;

-- ���������� ������� ����� ��� ������������
INSERT INTO Comment (id, CommentText)
VALUES (1, N'������� ��������� �������'),
	   (2, N'����� ��������� ������ �� ������ 23'),
	   (3, N'����������, ��������� ���� ���'),
	   (4, N'���� �������� ����� ��������'),
	   (5, N'��� �������, ����� ���� ���������� ������'),
	   (6, N'�������� ������, ����������� � ��� �� ����'),
	   (7, N'���� ��� ����� ����������, ����� �� ��� ����� ��������'),
	   (8, N'����� �� ���-�� �������������� ���� ���?'),
	   (9, N'������� �� ����������, ������ � ��� �������'),
	   (10, N'����� �������� ��������� ���������� � ��� �������'),
	   (11, N'������ ����� ������������ ���� ������ ��������?'),
	   (12, N'� �� ������������ ������������ ������ �������� ��� ���� ������'),
	   (13, N'����������, �������� ����������� � ����� ����'),
	   (14, N'����� ���� ������������� ������ ������'),
	   (15, N'����� �������� ����� ���������� ������������ ���� �������');


SELECT *
FROM Comment


-- ������� ����� ��� �����
CREATE TABLE Task (
    id INT NOT NULL PRIMARY KEY,
    TaskName NVARCHAR(255) NOT NULL,
    TaskDescription NVARCHAR(MAX) NOT NULL
) AS NODE;

-- ���������� ������� ����� ��� �����
INSERT INTO Task (id, TaskName, TaskDescription)
VALUES (1, N'���������� ���-����������', N'����� ����������� ���-���������� ��� ����� ������� ������ �����������.'),
	   (2, N'������ ������', N'���������� ���������������� ������ � �������� � ���������� �������� ���������� �������.'),
	   (3, N'���������� API', N'��������� ������������� API ���������� ������� � ���� �������.'),
	   (4, N'������������ ����������', N'���������� �������� � �������� ����� ��� ������ ����������.'),
	   (5, N'�������� ��������� ����', N'����� ������� ��������� ���� ��� ������������� �������.'),
	   (6, N'���������� ���������� ����������', N'��������� ����������� ��������� ���������� ��� ������ ���.'),
	   (7, N'����������� ������������������', N'���������� �������������� ������������������ ����� �������.'),
	   (8, N'���������� ����', N'����� ����������� ������������ ���� �� ���� ������ ������.'),
	   (9, N'�������� ������� ����������', N'��������� ������� ������ ���������� ��� ������ ������ ��������.'),
	   (10, N'���������� ���������', N'���������� ����������� �������� ��� ������������� ����.'),
	   (11, N'������ � ����� ������', N'��������� ��������� � �������������� ������ � ����� ������.'),
	   (12, N'���������� ������� �������������', N'����� ����������� ������� ������������� ��� ������ ������������.'),
	   (13, N'�������� �������������� ��� ������������', N'��������� ������� �������������� ��� ��������������� ������������ ������ ����������.'),
	   (14, N'���������� ������� ������������', N'���������� ����������� ������� ������������ ��� ����� �������������.'),
	   (15, N'�������� ����������� ����������', N'��������� ������� ����������� ���������� ��� ������ ������ ��������.');


SELECT *
FROM Task


-- �������� ������-�����

-- �������� ������� ����� ��� ��������������� �����	
CREATE TABLE CommentTaskEdge AS EDGE;
ALTER TABLE CommentTaskEdge ADD CONSTRAINT EC_CommentTaskEdge CONNECTION (Comment TO Task);

-- ���������� ������� ����� ��� ��������������� �����
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

-- �������� ������� ����� ��� �������������� ����� ��������������
CREATE TABLE DeveloperCollaborationEdge AS EDGE; 
ALTER TABLE DeveloperCollaborationEdge ADD CONSTRAINT EC_DeveloperCollaborationEdge CONNECTION (Developer TO Developer);

-- ���������� ������� ����� ��� �������������� ����� ��������������
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

 -- �������� ������� ����� ��� ������ �������������� ��� �������
CREATE TABLE DeveloperTaskEdge AS EDGE;
ALTER TABLE DeveloperTaskEdge ADD CONSTRAINT EC_DeveloperTaskEdge CONNECTION (Developer TO Task);

-- ���������� ������� ����� ��� ������ �������������� ��� �������
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



-- �������� ������� ����� ��� ���������� �������������� ������������
CREATE TABLE DeveloperCommentEdge AS EDGE;
ALTER TABLE DeveloperCommentEdge ADD CONSTRAINT EC_DeveloperCommentEdge CONNECTION (Developer TO Comment);

-- ���������� ������� ����� ��� ���������� �������������� ������������
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