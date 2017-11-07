DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

CREATE TABLE instructors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INT
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  instructor_id INT
);
