DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE  customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds VARCHAR(255)
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE tickets(
  id VARCHAR(255),
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  movie_id INT4 REFERENCES films(id) ON DELETE CASCADE
);
