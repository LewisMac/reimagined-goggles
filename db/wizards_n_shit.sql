DROP TABLE students;
DROP TABLE house;

CREATE TABLE house (
  id serial4 primary key,
  house_name VARCHAR(255)
);

CREATE TABLE students (
  id serial4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT2,
  house_id INT4 references house(id)
);

