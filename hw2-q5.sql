-- ii

select * from (
  select month, count(distinct discount)
  from sales
  group by month
) as functional_check
where functional_check.count > 1;

--  month | count 
-- -------+-------
-- (0 rows)

-- month => discount

select * from (
  select name, count(distinct price)
  from sales
  group by name
) as functional_check
where functional_check.count > 1;

--  name | count 
-- ------+-------
-- (0 rows)

-- name => price

-- iii

create table sales (
  name text,
  discount text,
  month text,
  price integer
);
create table product (
  name text primary key,
  price integer
);
create table monthly_discount (
  month text primary key,
  discount text
);
create table product_discount_months (
  name text references product(name),
  month text references monthly_discount(month)
);

-- iv

\copy sales           from '/Users/kstone/homework/544/hw2/hw2-data.txt'           with header delimiter E'\t' csv quote E'\n'
insert into product select distinct name, price from sales;
insert into monthly_discount select distinct month, discount from sales;
insert into product_discount_months select distinct name, month from sales;
