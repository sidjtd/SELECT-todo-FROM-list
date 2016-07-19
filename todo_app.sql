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
  VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise','Complete this Exercise.', 'Study PostgreSQL', 'Read all the documentation')
-- CREATE TABLE task () INHERITS (tasks);
-- INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise.', now(), now(), NULL);
-- INSERT INTO task VALUES (DEFAULT , 'Complete this Exercise.', now(), now(), NULL);
-- INSERT INTO tasks VALUES (DEFAULT , 'Study PostgreSQL', 'Read all the documentation.', now(), now(), NULL);

--v.
INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation')

--vi.
SELECT title
  FROM tasks
 WHERE completed_at = NULL;

--vii.
UPDATE tasks SET at completed_at = NULL
  WHERE title = 'Study SQL';

--viii.
SELECT title, description
  FROM tasks
 WHERE completed_at NULL;

--ix.
SELECT *
  FROM tasks
  ORDER BY created_at = NULL;

--x.

--xi.








-- end
\c user;