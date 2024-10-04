-- Codecademy Project - Intro to SQL--
DROP DATABASE IF EXISTS friends;
CREATE DATABASE friends;
USE friends;

CREATE TABLE friends (
id INT,
name TEXT,
birthday DATE,
PRIMARY KEY (id)
);

INSERT INTO friends (id, name, birthday)
VALUES 
(1, "Ororo Munro","1940-05-30"),
(2, "Jeremy Davies","1998-02-15"),
(3, "Priya Laksha","1995-08-14")
;

-- Edit the name of Ororo Munro to Storm --
UPDATE friends
SET name = "Storm"
WHERE id = 1;

-- Add a column called email --
ALTER TABLE friends
ADD COLUMN email TEXT;

-- Add email for email --
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'jeremy.davies@codecademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'priya.laksha@codecademy.com'
WHERE id = 3;

-- Remove Storm, she doesn't exist --
DELETE FROM friends
WHERE id = 1;

SELECT *
FROM friends;