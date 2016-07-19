-- 1 Delete user named michael (if exists)
DROP user IF EXISTS michael;

--2 Create user michael w/ encrypted pw
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
  -- wrong? CREATE ROLE michael

--3 Drop db: todo_app (if exists)
DROP DATABASE IF EXISTS todo_app;

--4 Create db: todo_app
CREATE DATABASE todo_app;

--5 Connect to db
\c todo_app;

--6/7 Create table: tasks, Define column id as primary key
CREATE TABLE tasks(
  id serial PRIMARY KEY,
  title varchar(40) NOT NULL,
  description text NOT NULL,
  created_at timestamp DEFAULT now(),
  updated_at timestamp NOT NULL,
  completed boolean NULL
);

--8i. Remove column named completed
ALTER TABLE IF EXISTS tasks
DROP COLUMN IF EXISTS completed;

--ii. Add column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
ALTER TABLE IF EXISTS tasks
ADD COLUMN completed_at timestamp DEFAULT NULL;

--iii. change updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET DEFAULT now();
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET NOT NULL;
-- UPDATE tasks SET updated_at = now() WHERE updated_at IS NULL;

--iv. Create new task, by only setting values (not defining which columns)
INSERT INTO tasks
(id, title, description, updated_at, completed_at)
  VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise', now(), NULL);
-- CREATE TABLE task () INHERITS (tasks);
-- INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise.', now(), now(), NULL);
-- INSERT INTO task VALUES (DEFAULT , 'Complete this Exercise.', now(), now(), NULL);
-- INSERT INTO tasks VALUES (DEFAULT , 'Study PostgreSQL', 'Read all the documentation.', now(), now(), NULL);

--v. create a new task
INSERT INTO tasks
VALUES (DEFAULT, 'Study PostgreSQL', 'Read all documentation', now(), now(), NULL);
-- This doesn't work?
-- INSERT INTO tasks VALUES (title, description)
-- ('Study PostgreSQL', 'Read all the documentation');

--vi. select all the titles of tasks that are not yet completed
SELECT title
  FROM tasks
  WHERE completed_at IS NULL;

--vii. update task w/ a title of 'Study SQL' to be completed as of now
UPDATE tasks SET completed_at = NULL
WHERE title = 'Study SQL';
--INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this Exercise.', now(), now(), NULL);??

--viii. select all titles & descr of tasks that are not yet completed
SELECT title, description
  FROM tasks
  WHERE completed_at IS NULL;
--??? SELECT title, description FROM tasks WHERE completed_at is NULL;

--ix. select all fields of every task sorted by creation date in descending order
SELECT *
  FROM tasks
  ORDER BY created_at IS NULL;
--??? SELECT * FROM tasks ORDER BY created_at DESC;

--x. create a new task
INSERT INTO tasks
VALUES (DEFAULT , 'mistake 1', 'a test entry.', now(), now(), NULL);

--xi. create a new task
INSERT INTO tasks
VALUES (DEFAULT , 'mistake 2', 'another test entry.', now(), now(), NULL);

--xii. create a new task
INSERT INTO tasks
VALUES (DEFAULT , 'third mistake', 'another test entry.', now(), now(), NULL);

--xiii. select title fields of all tasks w/ title that includes 'mistake'
SELECT title
  FROM tasks
 WHERE title LIKE 'mistake';

--xiv. delete task that has title of mistake 1
DELETE
FROM tasks
WHERE title LIKE 'mistake 1';

--xv. select title & descr fields of all tasks w/ title that includes 'mistake'
SELECT title
FROM tasks
WHERE title LIKE 'mistake';

--xvi. delete all tasks that includes word 'mistake' in the title
SELECT *
FROM tasks
WHERE title LIKE 'mistake';

--xvii. select all fields of all tasks sorted by title in ascending order
SELECT * FROM tasks;

-- end
\c user;