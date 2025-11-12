
create or replace table marko_andrii_illia.users_stage as
select
  distinct(user_id),
  split(user_name, " ")[safe_offset(0)] as first_name,
  split(user_name, " ")[safe_offset(1)] as last_name,
  user_email
  from `marko_andrii_illia.users`
  where user_id is not null;


create or replace table marko_andrii_illia.promos_stage as
select
  distinct(promo_id),
  discount,
  start_date,
  end_date,
  case 
    when cast(end_date as timestamp)>current_timestamp() then true
    else false
  end as is_active
  from `marko_andrii_illia.promos`
  where promo_id is not null;


create or replace table `marko_andrii_illia.actors_stage` as
select distinct actor_id, actor_name, age from marko_andrii_illia.actors
where actor_id is not null;


create or replace table `marko_andrii_illia.directors_stage` as
select distinct * from marko_andrii_illia.directors
where director_id is not null;


create or replace table marko_andrii_illia.movies_stage as
select distinct 
  m.movie_id,
  m.movie_name,
  m.director_id,
  d.director_name,
  d.age as director_age,
  m.lead_actor_id,
  coalesce(a.actor_name, "Unknown") as actor_name,
  a.age as actor_age,
  m.rating, 
  m.gross,
  m.release_date,
  m.base_price,
  m.produce_country
  from `marko_andrii_illia.movies` m
  left join marko_andrii_illia.directors_stage d on m.director_id = d.director_id
  left join marko_andrii_illia.actors_stage a on m.lead_actor_id = a.actor_id
  where m.movie_id is not null;

INSERT INTO `marko_andrii_illia.promos_stage` (promo_id, discount, start_date, end_date)
VALUES
  (0, 0.0, DATETIME("1024-01-01T00:00:00"), DATETIME("3024-01-31T23:59:59"));

create or replace table marko_andrii_illia.transaction_stage as 
select  distinct
 transaction_id, 
 user_id,
 movie_id, 
 coalesce(
  case when
  cast(t.timestamp as timestamp) > cast(p.start_date as timestamp) and cast(t.timestamp as timestamp)<cast(p.end_date as timestamp) then t.promo_id
 else 0
 end , 0)as promo_id,
 amount,
 `timestamp`
 from `marko_andrii_illia.transaction` t
 left join marko_andrii_illia.promos_stage p on p.promo_id = t.promo_id
 where transaction_id is not null;








