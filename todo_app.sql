-- 1
DROP user IF EXISTS michaels;

--2
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker'
--CREATE ROLE michael

--3
DROP DATABASE IF EXISTS todo_app;

--4
CREATE DATABASE todo_app;

--5
\c todo_app;

--6
CREATE TABLE tasks(
  id serial PRIMARY KEY
);



-- end
\c user;