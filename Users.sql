-- users table ------------------------------------------------
# checking null and total records
select count(distinct user_id) 
from users;

# Count of users who have transacted as buyers
select count(distinct U.user_id) as Count_of_buyer_id
from users U
join Orders O
on U.user_id = O.buyer_id;

# Count of users who have transacted as Seller
select count(distinct U.user_id) as Count_of_Seller_id
from users U
join Orders O
on U.user_id = O.Seller_id;

# Count of users who have never made any transactions either as buyers or sellers.
select count(User_id) as Not_involved_in_Transactions
from Users
where User_id not in 
(
select buyer_id from Orders
) 
and User_id not in 
(
select buyer_id from Orders
);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------