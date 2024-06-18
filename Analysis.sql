-- ANALYSIS ------------------------------------------------------------
# Who are the 5 users with the highest purchase value?
select O.buyer_id, U.user_name as UserName, sum(total) as highest_purchase_value
from Users u
join Orders O
on U.user_id = O.buyer_id
group by O.buyer_id, UserName
order by highest_purchase_value desc
limit 5;

# Users with the highest number of transactions but never use discounts
select U.User_id, U.User_name, count(O.order_id) as Number_of_transaction
from Users U
join orders O
on U.user_id = O.buyer_id
group by U.user_id, U.User_name
having sum(O.discount) = 0
order by Number_of_transaction desc, U.User_name 
Limit 5;

# Particular Email domain of seller
select distinct O.seller_id, SUBSTRING_INDEX(U.email, '@', -1) as Domain_Name
from Users U
join orders O
on U.user_id = O.seller_id
where SUBSTRING_INDEX(U.email, '@', -1)  = 'cv.web.id'
or SUBSTRING_INDEX(U.email, '@', -1)  = 'cv.com'
or SUBSTRING_INDEX(U.email, '@', -1)  = 'cv.net.id'
or SUBSTRING_INDEX(U.email, '@', -1)  = 'pt.net.id'
or SUBSTRING_INDEX(U.email, '@', -1)  = 'ud.co.id'
order by Domain_Name;

# Top 5 best selling products in December 2019
select P.Product_Name as ProductName, sum(OD.Quantity) as TotalQuantity
from Order_details OD
join products P
using (product_id)
join Orders O
using (Order_id)
where O.paid_at >= '2019-12-01' and O.paid_at <= '2019-12-31'
group by ProductName
order by TotalQuantity desc
Limit 5;

# Big Deals in December 2019
select U.User_name as UserName, O.total as total 
from Orders O
join Users U
on O.buyer_id = U.user_id
where O.created_at >= '2019-12-01' and O.created_at <= '2019-12-31'
and total >= 20000000
order by UserName;

# transaction value per month
select Year(created_at) as year,
month(created_at) as NoOfMonth,
monthname(created_at) as MonthName,
Count(paid_at) as NoOfTransactions,
sum(total) as TransactionValue
from orders
group by year, NoOfMonth, MonthName
order by year, NoOfMonth;

# Best Selling Product Category in 2019
select P.category as ProductCategory, sum(Od.quantity) as TotalQuantity, sum(Od.price) as TotalPrice
from order_details Od
join Products P
using (product_id)
join Orders O
using (Order_id)
where O.created_at between '2019-01-01' and '2020-01-01'
and O.delivery_at is not null
group by ProductCategory
order by TotalQuantity desc
Limit 5;

# Best Selling Product Category in 2020
select P.category as ProductCategory, sum(Od.quantity) as TotalQuantity, sum(Od.price) as TotalPrice
from order_details Od
join Products P
using (product_id)
join Orders O
using (Order_id)
where O.created_at >='2020-01-01'
and O.delivery_at is not null
group by ProductCategory
order by TotalQuantity desc
Limit 5;

# Looking for high-value buyers
select U.User_name as Name, count(U.User_name) as NoOfTransaction, sum(O.total) as TotalTransactionValue, min(O.total) as MinTransactionValue
from Orders O
join Users U
on O.buyer_id = U.user_id
group by U.user_id, Name
having NoOfTransaction > 5 and MinTransactionValue > 2000000;

# Looking for Dropshipper
select U.User_name as Name,
count(U.User_name) as NoOfTransactions, 
count(distinct O.kodepos) as NoOfDifferentZipCode, 
Sum(O.Total) as TotalTransactionValue, 
avg(O.total) as AverageTransactionValue
from Orders O
join Users U
on O.buyer_id = U.user_id
group by U.user_id, Name
having NoOfTransactions >= 10
and NoOfTransactions = NoOfDifferentZipCode;

# Looking for Reseller Offline
select U.User_Name as Name, 
Avg(O.total) as AverageTransactionValue, 
Avg(Od.TotalQuantity) as AverageQuantityPerTransactions, 
Count(U.user_Name) as NoOfTransactions,
Sum(O.total) as TotalTransactionValue
from Orders O	
join Users U
on O.buyer_id = U.user_id
join 
(
select order_id, sum(quantity) as TotalQuantity
from order_details
group by order_id
) Od
using (order_id)
where O.kodepos = U.kodepos
group by U.user_id, U.User_name
having NoOfTransactions >= 8 
and AverageQuantityPerTransactions >= 10 
order by U.user_id, U.User_name;

#user who are both buyer and seller
select U.user_name as User_Name, NoOfBuyerTransactions, NoOfSellerTransactions
from Users U
join 
(
select buyer_id, count(buyer_id) as NoOfBuyerTransactions
from orders
group by buyer_id
) as buyer
on U.User_id = buyer.buyer_id
join 
(
select seller_id, count(seller_id) as NoOfSellerTransactions
from orders
group by seller_id
) as Seller
on U.User_id = Seller.seller_id
where NoOfBuyerTransactions >= 7
order by User_Name;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
