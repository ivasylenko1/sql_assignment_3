CREATE OR REPLACE TABLE `marko_andrii_illia.dim_movies` AS
SELECT 
  movie_id,
  director_id,
  lead_actor_id,
  release_date,
  rating,
  gross,
  base_price,
  produce_country
FROM `marko_andrii_illia.movies_stage`;

-- CREATE SEARCH INDEX IF NOT EXISTS user_idx
-- ON `marko_andrii_illia.dim_movies` (movie_id);


CREATE OR REPLACE TABLE `marko_andrii_illia.dim_promos` AS
SELECT
  promo_id,
  discount,
  start_date,
  end_date,
  RANGE(start_date, end_date) as activity_period,
  is_active
FROM `marko_andrii_illia.promos_stage`;


CREATE OR REPLACE TABLE `marko_andrii_illia.dim_users` AS
SELECT
  user_id,
  user_email
FROM `marko_andrii_illia.users_stage`;


CREATE OR REPLACE TABLE `marko_andrii_illia.fact_transaction` AS
SELECT
*
FROM `marko_andrii_illia.transaction_stage`;


CREATE OR REPLACE TABLE `marko_andrii_illia.fact_user_info` AS
SELECT
  u.user_id,
  COUNT(t.transaction_id) AS num_transactions,
  SUM(t.amount) AS num_bought,
  SUM(t.amount*m.base_price*(1-p.discount)) as user_revenue
FROM
`marko_andrii_illia.fact_transaction` AS t
LEFT JOIN `marko_andrii_illia.dim_users` u ON t.user_id = u.user_id
LEFT JOIN `marko_andrii_illia.dim_promos` p ON t.promo_id = p.promo_id
LEFT JOIN `marko_andrii_illia.dim_movies` m ON t.movie_id = m.movie_id
GROUP BY u.user_id;

CREATE OR REPLACE TABLE `marko_andrii_illia.fact_movie_info` AS
SELECT 
  m.movie_id,
  COUNT(t.transaction_id) AS num_transactions,
  SUM(t.amount) AS num_tickets,
  SUM(t.amount*m.base_price*(1-p.discount)) as movie_revenue
FROM
`marko_andrii_illia.fact_transaction` AS t
LEFT JOIN `marko_andrii_illia.dim_promos` p ON t.promo_id = p.promo_id
LEFT JOIN `marko_andrii_illia.dim_movies` m ON t.movie_id = m.movie_id
GROUP BY m.movie_id;

CREATE OR REPLACE TABLE `marko_andrii_illia.fact_promo_info` AS
SELECT
  p.promo_id,
  COUNT(t.transaction_id) AS num_transactions,
  SUM(t.amount) AS num_tickets,
  SUM(t.amount*m.base_price*(1-p.discount)) as promo_revenue,
  SUM(t.amount*m.base_price*p.discount) as promo_loss
FROM `marko_andrii_illia.fact_transaction` AS t
LEFT JOIN `marko_andrii_illia.dim_promos` p ON t.promo_id = p.promo_id
LEFT JOIN `marko_andrii_illia.dim_movies` m ON t.movie_id = m.movie_id
GROUP BY p.promo_id;



