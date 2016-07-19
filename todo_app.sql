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

--67
CREATE TABLE tasks(
  id serial PRIMARY KEY,
  title varchar (40) NOT NULL,
  description char NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL,
  completed boolean NOT NULL
);

--8
ALTER TABLE IF EXISTS tasks DROP COLUMN IF EXISTS completed;
ALTER TABLE IF EXISTS tasks ADD COLUMN completed_at timestamp DEFAULT NULL;
ALTER TABLE IF EXISTS tasks ALTER COLUMN updated_at SET DEFAULT now();



--9

--10


-- end
\c user;