CREATE OR REPLACE TABLE `marko_andrii_illia.directors` (
 director_id INT64 ,
 director_name STRING,
 age INT64,
);


CREATE OR REPLACE TABLE `marko_andrii_illia.actors` (
 actor_id INT64 ,
 actor_name STRING,
 age INT64
);


CREATE OR REPLACE TABLE `marko_andrii_illia.users` (
 user_id INT64 ,
 user_name STRING,
 user_email STRING
);

CREATE OR REPLACE TABLE `marko_andrii_illia.transaction` (
 transaction_id INT64 , 
 user_id INT64 ,
 movie_id INT64,
 promo_id INT64,
 amount INT64,
 `timestamp` TIMESTAMP,
);
CREATE OR REPLACE TABLE `marko_andrii_illia.promos` (
  promo_id INT64 ,
  discount DECIMAL(3, 2),
  start_date DATETIME,
  end_date DATETIME
);


CREATE OR REPLACE TABLE `marko_andrii_illia.movies` (
  movie_id INT64,
  director_id INT64,
  lead_actor_id INT64,
  movie_name STRING,
  rating DECIMAL(3, 1),
  gross INT64,
  release_date DATETIME,
  base_price DECIMAL(4, 2),
  produce_country STRING
);

INSERT INTO `marko_andrii_illia.directors` (director_id, director_name, age)
VALUES
  (1, 'Christopher Nolan', 54),
  (2, 'Greta Gerwig', 41),
  (3, 'Denis Villeneuve', 56),
  (4, 'Martin Scorsese', 81),
  (5, 'Quentin Tarantino', 61),
  (1, 'Christopher Nolan', 54),
  (2, 'Greta Gerwig', 41),
  (3, 'Denis Villeneuve', 56),
  (4, 'Martin Scorsese', 81),
  (5, 'Quentin Tarantino', 61),
  (1, 'Christopher Nolan', 54),
  (2, 'Greta Gerwig', 41),
  (3, 'Denis Villeneuve', 56),
  (4, 'Martin Scorsese', 81),
  (5, 'Quentin Tarantino', 61),
  (null, 'Andrii Booichuk', 18);


INSERT INTO `marko_andrii_illia.actors` (actor_id, actor_name, age)
VALUES
  (1, 'Cillian Murphy', 48),
  (2, 'Margot Robbie', 34),
  (3, 'Timothée Chalamet', 28),
  (4, 'Ryan Gosling', 43),
  (5, 'Leonardo DiCaprio', 49),
  (6, 'Zendaya', 28),
  (7, 'Anya Taylor-Joy', 28),
  (8, 'Samuel L. Jackson', 75),
  (9, 'Robert De Niro', 80),
  (10, 'Florence Pugh', 28),
  (null, 'Andrii Boichuk', 18);


INSERT INTO `marko_andrii_illia.users` (user_id, user_name, user_email)
VALUES
  (1, 'Alice Smith', 'alice@example.com'),
  (2, 'Bob Johnson', 'bob@example.com'),
  (3, 'Carla Diaz', 'carla@example.net'),
  (4, 'David Lee', 'david@example.org'),
  (5, 'Emily White', 'emily@example.com'),
  (6, 'Frank Brown', 'frank@example.com'),
  (7, 'Grace Hall', 'grace@example.net'),
  (8, 'Henry King', 'henry@example.com'),
  (9, 'Ivy Scott', 'ivy@example.com'),
  (10, 'Jack Green', 'jack@example.org'),
  (11, 'Kate Adams', 'kate@example.com'),
  (12, 'Leo Baker', 'leo@example.net'),
  (13, 'Mia Clark', 'mia@example.com'),
  (14, 'Noah Evans', 'noah@example.com'),
  (15, 'Olivia Hill', 'olivia@example.org'),
  (16, 'Paul Irwin', 'paul@example.com'),
  (17, 'Quinn Jones', 'quinn@example.net'),
  (18, 'Rachel Kim', 'rachel@example.com'),
  (19, 'Sam Lewis', 'sam@example.com'),
  (20, 'Tom Wilson', 'tom@example.org'),
  (null, 'Andrii Boichuk', 'tupadud20203203023');


INSERT INTO `marko_andrii_illia.promos` (promo_id, discount, start_date, end_date)
VALUES
  (1, 0.10, DATETIME("2024-01-01T00:00:00"), DATETIME("2024-01-31T23:59:59")),
  (2, 0.25, DATETIME("2024-02-10T00:00:00"), DATETIME("2024-02-14T23:59:59")),
  (3, 0.50, DATETIME("2023-12-20T00:00:00"), DATETIME("2023-12-26T23:59:59")),
  (3, 0.50, DATETIME("2023-12-20T00:00:00"), DATETIME("2023-12-26T23:59:59")),
  (4, 0.15, DATETIME("2024-03-01T00:00:00"), DATETIME("2024-03-31T23:59:59")),
  (5, 0.20, DATETIME("2024-05-01T00:00:00"), DATETIME("2024-05-31T23:59:59"));


INSERT INTO `marko_andrii_illia.movies` (movie_id, director_id, lead_actor_id, movie_name, rating, gross, release_date, base_price, produce_country)
VALUES
  (1, 1, 1, 'Oppenheimer', 8.6, 952600000, DATETIME("2023-07-21T00:00:00"), 14.99, 'USA'),
  (2, 2, 2, 'Barbie', 7.0, 1442000000, DATETIME("2023-07-21T00:00:00"), 14.99, 'USA'),
  (3, 3, 3, 'Dune: Part One', 8.0, 402000000, DATETIME("2021-09-03T00:00:00"), 12.99, 'USA'),
  (4, 1, 5, 'Inception', 8.8, 829900000, DATETIME("2010-07-16T00:00:00"), 9.99, 'USA'),
  (5, 2, NULL, 'Lady Bird', 7.4, 79000000, DATETIME("2017-11-03T00:00:00"), 8.99, 'USA'),
  (6, 3, 3, 'Dune: Part Two', 8.9, 711800000, DATETIME("2024-03-01T00:00:00"), 19.99, 'USA'),
  (7, 4, 9, 'Killers of the Flower Moon', 7.6, 157000000, DATETIME("2023-10-20T00:00:00"), 17.99, 'USA'),
  (8, 5, 8, 'Pulp Fiction', 8.9, 213900000, DATETIME("1994-10-14T00:00:00"), 7.99, 'USA'),
  (9, 1, 5, 'The Dark Knight', 9.0, 1006000000, DATETIME("2008-07-18T00:00:00"), 9.99, 'USA'),
  (10, 3, 6, 'Arrival', 7.9, 203400000, DATETIME("2016-11-11T00:00:00"), 8.99, 'USA'),
  (11, 5, NULL, 'Reservoir Dogs', 8.3, 2900000, DATETIME("1992-10-09T00:00:00"), 6.99, 'USA'),
  (12, 4, 5, 'The Wolf of Wall Street', 8.2, 392000000, DATETIME("2013-12-25T00:00:00"), 11.99, 'USA'),
  (13, 1, 10, 'Interstellar', 8.7, 731000000, DATETIME("2014-11-07T00:00:00"), 12.99, 'USA'),
  (14, 2, 4, 'Little Women', 7.8, 218600000, DATETIME("2019-12-25T00:00:00"), 10.99, 'USA'),
  (15, 3, 4, 'Blade Runner 2049', 8.0, 260500000, DATETIME("2017-10-06T00:00:00"), 13.99, 'USA'),
  (16, 5, 8, 'Django Unchained', 8.4, 425400000, DATETIME("2012-12-25T00:00:00"), 11.99, 'USA'),
  (17, 4, 9, 'Goodfellas', 8.7, 46800000, DATETIME("1990-09-19T00:00:00"), 7.99, 'USA'),
  (18, 1, NULL, 'Dunkirk', 7.8, 527000000, DATETIME("2017-07-21T00:00:00"), 12.99, 'UK'),
  (19, 5, 5, 'Once Upon a Time in Hollywood', 7.6, 374600000, DATETIME("2019-07-26T00:00:00"), 13.99, 'USA'),
  (20, 2, 3, 'The French Dispatch', 7.1, 46300000, DATETIME("2021-10-22T00:00:00"), 10.99, 'Germany');


INSERT INTO `marko_andrii_illia.transaction` (transaction_id, user_id, movie_id, promo_id, amount, `timestamp`)
VALUES
  (1, 1, 1, NULL, 14, TIMESTAMP("2024-03-10T10:00:00Z")),
  (2, 2, 6, NULL, 19, TIMESTAMP("2024-03-10T11:30:00Z")),
  (3, 3, 8, 4, 7, TIMESTAMP("2024-03-09T14:20:00Z")),
  (4, 1, 2, NULL, 14, TIMESTAMP("2024-03-09T18:00:00Z")),
  (5, 4, 10, 4, 8, TIMESTAMP("2024-03-08T20:15:00Z")),
  (6, 5, 12, NULL, 11, TIMESTAMP("2024-03-08T21:00:00Z")),
  (7, 6, 17, NULL, 7, TIMESTAMP("2024-03-07T12:10:00Z")),
  (8, 7, 3, 4, 12, TIMESTAMP("2024-03-07T15:45:00Z")),
  (9, 8, 15, NULL, 13, TIMESTAMP("2024-03-06T19:00:00Z")),
  (10, 2, 1, NULL, 14, TIMESTAMP("2024-03-06T22:30:00Z")),
  (11, 9, 20, 4, 10, TIMESTAMP("2024-03-05T10:00:00Z")),
  (12, 10, 19, NULL, 13, TIMESTAMP("2024-03-05T13:00:00Z")),
  (13, 11, 4, 4, 9, TIMESTAMP("2024-03-04T16:20:00Z")),
  (14, 12, 7, NULL, 17, TIMESTAMP("2024-03-04T17:00:00Z")),
  (15, 13, 11, NULL, 6, TIMESTAMP("2024-03-03T11:00:00Z")),
  (16, 14, 13, NULL, 12, TIMESTAMP("2024-02-12T14:50:00Z")),
  (17, 15, 14, 2, 10, TIMESTAMP("2024-02-12T18:00:00Z")),
  (18, 16, 2, 2, 14, TIMESTAMP("2024-02-13T19:30:00Z")),
  (19, 17, 9, 2, 9, TIMESTAMP("2024-02-14T20:00:00Z")),
  (19, 17, 9, 2, 9, TIMESTAMP("2024-02-14T20:00:00Z")),
  (20, 1, 6, NULL, 19, TIMESTAMP("2024-03-11T09:00:00Z")),
  (21, 1, 1, 1, 14, TIMESTAMP("2025-10-10T10:00:00Z"));












