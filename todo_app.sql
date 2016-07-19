-- 1
DROP user IF EXISTS michael;

--2
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
--CREATE ROLE michael

--3
DROP DATABASE IF EXISTS todo_app;

--4
CREATE DATABASE todo_app;

--5
\c todo_app;

--6/7
CREATE TABLE tasks(
  id serial PRIMARY KEY,
  title varchar(40) NOT NULL,
  description text NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL,
  completed boolean NOT NULL
);

--8i.
ALTER TABLE IF EXISTS tasks DROP COLUMN IF EXISTS completed;
--ii.
ALTER TABLE IF EXISTS tasks ADD COLUMN completed_at timestamp DEFAULT NULL;
--iii.
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET DEFAULT now();
-- UPDATE tasks SET updated_at = now() WHERE updated_at IS NULL;
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET NOT NULL;
--iv.
INSERT INTO tasks (id, title, description, created_at, updated_at, completed at)
  VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise','Complete this Exercise.', 'Study PostgreSQL', 'Read all the documentation');
-- CREATE TABLE task () INHERITS (tasks);
-- INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise.', now(), now(), NULL);
-- INSERT INTO task VALUES (DEFAULT , 'Complete this Exercise.', now(), now(), NULL);
-- INSERT INTO tasks VALUES (DEFAULT , 'Study PostgreSQL', 'Read all the documentation.', now(), now(), NULL);

--v.
-- This doesn't work?
-- INSERT INTO tasks VALUES (title, description)
-- ('Study PostgreSQL', 'Read all the documentation');
INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

--vi.
SELECT title
  FROM tasks
  WHERE completed_at IS NULL;

--vii.
UPDATE tasks SET at completed_at IS NULL
  WHERE title = 'Study SQL';
--INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise.', now(), now(), NULL);??

--viii.
SELECT title, description
  FROM tasks
  WHERE completed_at IS NULL;
--??? SELECT title, description FROM tasks WHERE completed_at is NULL;

--ix.
SELECT *
  FROM tasks
  ORDER BY created_at IS NULL;
--??? SELECT * FROM tasks ORDER BY created_at DESC;

--x.
INSERT INTO tasks VALUES (DEFAULT , 'mistake 1', 'a test entry.', now(), now(), NULL);

--xi.
INSERT INTO tasks VALUES (DEFAULT , 'mistake 2', 'another test entry.', now(), now(), NULL);


SELECT * FROM tasks;
-- end
\c user;