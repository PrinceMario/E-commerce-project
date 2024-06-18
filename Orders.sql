-- orders table ----------------------------------------------------------------
# checking null and total records
select count(order_id) from orders;

select count(order_id) from orders
where created_at is null;

select count(order_id) from orders
where paid_at is null;

select count(order_id) from orders
where delivery_at is null;

select count(order_id) from orders
where paid_at is not null and delivery_at is null;

#created order table based on create_at
select order_id, created_at
from orders
order by created_at;

# number of users who are buyer or/and seller, or neither
select count(order_id) from orders
where paid_at = delivery_at;

select count(distinct buyer_id)
from orders
where buyer_id is not null;

select count(distinct seller_id)
from orders 
where seller_id is not null;

select count(distinct seller_id)
from orders 
where buyer_id is not null;

# creating new columns as status_order and Calculate percentage 
select order_id, created_at, paid_at, delivery_at,
case
when paid_at is not null and delivery_at is not null then 'Completed'
when paid_at is null and delivery_at is null then 'unpaid orders'
when paid_at is not null and delivery_at is null then 'Paid & Undelivered'
else 'None' 
End as Status
from orders;

with Percentage as
(select
concat(round((((select count(order_id) from orders where paid_at is not null and delivery_at is not null)/count(order_id)) * 100), 2), '%') as Completed,
Concat(round((((select count(order_id) from orders where paid_at is null and delivery_at is null)/count(order_id)) * 100), 2), '%') as Unpaid,
Concat(round((((select count(order_id) from orders where paid_at is not null and delivery_at is null)/count(order_id)) * 100), 2), '%') as Paid_Undelivered
from orders)
select *, Concat(Unpaid + Paid_Undelivered, '%') as unpaid_undelivered from Percentage;

# Order made in 2019
select monthname(created_at) as MonthName, count(order_id) as Orders_in_2019  from orders
where year(created_at) = 2019
group by MonthName
order by Orders_in_2019;

# Order made in 2020
select monthname(created_at) as MonthName, count(order_id) as Orders_in_2020 from orders
where year(created_at) = 2020
group by MonthName
order by Orders_in_2020;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------










