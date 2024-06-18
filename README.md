# Overview

![1684637327634](https://github.com/PrinceMario/E-commerce-project/assets/172631198/6e516701-6526-431b-a41f-7d5d655a2d1c)

Dashboard: https://app.powerbi.com/groups/me/reports/a577764a-65af-4320-8d55-9bcb0202d3e1/5af8ff7827817d57aeb9?experience=power-bi

A SQL project I’m working on with a case study that analyzes sales data belonging to an E-Commerce company. This project is part of a project training session provided by DQLab to enhance relational database capabilities. I am working on this project using MySQL as Relational Database and Data Processing tool. For better visualization, I use Tableau software combined with SQL to get better analysis results.

# Goals
Provide the business insights of the E-Commerce performance from 2019–2020.

# Result
The insight into the E-Commerce performance is shown in the dashboard report.

# Analysis approach
Descriptive Statistics and Data Visualizations are only used to provide insight into sales performance. I used SQL to access related data so that it will help me explain the connection of each data table.

# Data profiling
The dataset used is sales data from DQLab Store. Users can buy goods from other users who sell. Each user can be both a buyer and a seller. The file is in zip format and contains four CSV files. The files are imported and saved into the database using MySQL workbench then.
The relationship between tables can be described in the following diagram:
![Entity relationship diagram](https://github.com/PrinceMario/E-commerce-project/assets/172631198/5f74c25d-8903-49a2-9941-aa0ae4df07f9)

                                               Entity relationship diagram

# Exploratory data analysis
## Products
products table contains detailed data of the products sold. It has 1,145 total records for which there is no null data. It means there are 1,145 unique products sold. All of these products are divided into 12 categories, consisting of:
![Total Unique Products Based on Category](https://github.com/PrinceMario/E-commerce-project/assets/172631198/b758be87-5d0b-42f0-8a92-28c10c53288b)
 
                                        Total Unique Products Based on Category
                                        
Based on the table above, shows most products are in the products with ‘Kebersihan Diri’ category.

## Orders
orders table contains purchase transactions from buyers to sellers. There are 74,874 total records. There is no null value in the ‘created_at’ column. However, each of the ‘paid_at’ and ‘delivered_at’ columns has null values. That means from a total of 74,874 orders made, 6.73% are unpaid orders, 13.05% are both unpaid and undelivered orders, and 6.33% are paid orders but not delivered. In addition, there are 4,588 transactions that were sent exactly on the date on which the payment was made.
This SQL syntax below defines a new column as the status of the order category using conditional function.

 ![1](https://github.com/PrinceMario/E-commerce-project/assets/172631198/1b224f85-252c-4481-bc74-fd7b54d7ca86)

 ![2](https://github.com/PrinceMario/E-commerce-project/assets/172631198/65416cf1-7eae-442c-9d1f-faafc1b7224d)

Output

![Percentage of order based on status](https://github.com/PrinceMario/E-commerce-project/assets/172631198/a9a1996b-8e37-4ac1-a54d-776b3ec15c61)
 
                                      Percentage of order based on status
                                      
Based on the pie chart above, unpaid orders are common in transactions. However, the thing that needs to be considered and evaluated by the company is that still there are 6.34% of transactions whose goods are not sent to the buyer even though he has made a payment. Regardless of whether there are complaints from these users or not, this needs to be further explored.

![3](https://github.com/PrinceMario/E-commerce-project/assets/172631198/5f6e7cf4-c371-49ec-966f-a108aae073c5)
 
The bar chart above shows the company’s performance which has been increasing in the last 1 year. In fact, compared to 2019, the total orders made by buyers per month in 2020 increased sharply. December is the month with the highest total orders because as we know it is the end of the year.

## Users
users table contains detailed user data. It has 17,936 total records or 17,936 account users who have made transactions in total. There are 17,877 users who have transacted as buyers and only 69 of them have also transacted as sellers. On the other hand, all users who have transacted as sellers also transacted as buyers. it also means that there are 59 users who have never made any transactions either as buyers or sellers.

## Order details
order_details table contains details of the items purchased during the transaction. It has 187,452 order details made by buyers. There is not much interesting information from this table.


# Who are the 5 users with the highest purchase value?
By running the following syntax, we will get information about who the 5 users with the highest purchase value are.

![4](https://github.com/PrinceMario/E-commerce-project/assets/172631198/d5908a4a-502e-47d0-8c09-52d5f3c78b95)

## Output

![5](https://github.com/PrinceMario/E-commerce-project/assets/172631198/1b36f185-e321-4861-87e6-0a4043638f69)

Based on the output, we can see the names of the users with the highest purchase value. Users with the name Jaga Puspasari and user_id 14411 are the users who have the highest purchase value of Rp. 54,102,250.00.

# Users with the highest number of transactions but never use discounts
To find out who are the users with the highest number of transactions but never use discounts, we can enter the following query:

![6](https://github.com/PrinceMario/E-commerce-project/assets/172631198/6c153ec1-3e73-4b96-8bd3-9b272457ee7c)

## Output

![7](https://github.com/PrinceMario/E-commerce-project/assets/172631198/28be0b30-e6c6-4ac3-8390-2307b5fbc75f)
 
Here are the names of the users with the most transactions and also those who have never used discounts. All of them have made transactions more than 10 times without using any discount at all. The first order user is Yessi Wibisono with user_id 12476 with a total of 13 transactions.

# Particular Email domain of seller
Now we want to know if a particular email domain is used by the seller. The domains to be checked include cv.web.id, cv.com, cv.net.id, pt.net.id, and ud.co.id. We can run the following syntax:

![8](https://github.com/PrinceMario/E-commerce-project/assets/172631198/3dccc0d3-4f8f-4cfb-8bd6-13c1f6fd396d)

## Output

![9](https://github.com/PrinceMario/E-commerce-project/assets/172631198/c7ec422b-8134-48a5-970f-7f4e230c3c44)
  
Only two are used by sellers of the five previously email domains mentioned. These domains include cv.web.id and pt.net.id with a total of 2 and 3 for each domain.

# Top 5 best selling products in December 2019
To find out which products were purchased the most in December 2019 seen by total quantity, we can enter the following query:

 ![10](https://github.com/PrinceMario/E-commerce-project/assets/172631198/c938d369-7f3f-4c11-afa3-387d97a268f1)
 
## Output

![11](https://github.com/PrinceMario/E-commerce-project/assets/172631198/98eba36c-9f87-4f8f-9def-ebe2cabee1de)
 
The graphic table above is a list of the 5 best-selling products in December 2019. The most purchased product was ‘Queen Cefa Bracelet Leather’ with a total of 2550 units purchased.

# Big Deals in December 2019
Then, I will show all users with a minimum transaction value of 20,000,000 in December 2019. The query syntax that can be executed is as follows:

![12](https://github.com/PrinceMario/E-commerce-project/assets/172631198/1a2e1f05-ceeb-4e07-99e9-4010bc09b71b)
 
## Output
 
![13](https://github.com/PrinceMario/E-commerce-project/assets/172631198/49305098-0df7-4a45-9d58-4d4b0ffd8cff)

Based on the above table, there are 12 buyers making transactions with a value of more than Rp 20 million during the month of December 2019.

# What is the Transaction Value per month?
We want to display a summary of transactions per month from 2019 to 2020. Here is the query:

 ![14](https://github.com/PrinceMario/E-commerce-project/assets/172631198/e653ca6b-1282-4f6d-a47b-9abe7c660b1f)

## Output

![15](https://github.com/PrinceMario/E-commerce-project/assets/172631198/d45b3f5d-8412-4872-a979-e483b6534dfe)
 
The graph shows that the transaction value in 2020 increased dramatically compared to 2019. Between December and early 2020 in January, the transaction value decreased but continued to increase from month to month. At some points, although the number of transactions between 2019 and 2020 is relatively close, for example in December 2019 and May 2020 which both have a number of transactions of around 9000, both show very different transaction values. This explains that the company’s sales performance in 2020 is much more effective in terms of the transaction value with a relatively close number of transactions.

# Best Selling Product Category in 2019 and 2020
The following syntax is an SQL command to find which product categories are the best-selling in a given year based on Total Price and Total Quantity.
 
![16](https://github.com/PrinceMario/E-commerce-project/assets/172631198/16878cbd-7111-4c25-beb4-b1c437993d00)

![17](https://github.com/PrinceMario/E-commerce-project/assets/172631198/44bd72f7-5d40-49d5-8908-1f7bde32856e)

## Output
 
![18](https://github.com/PrinceMario/E-commerce-project/assets/172631198/5d55dfab-04bc-4385-a000-66e73f41ecad)

![19](https://github.com/PrinceMario/E-commerce-project/assets/172631198/f9fd7bdd-1109-4a23-a0de-b0e3fa5eb3a3)

The two tables above show the five best-selling products in 2019 and 2020. According to the table, there is no change in the position of product categories between 2019 and 2020. However, the entire category of products has increased significantly both in terms of Total Quantity or Total Price.

# Looking for high-value buyers
This is a SQL query to find buyers who have transacted more than 5 times, and each transaction is more than 2,000,000.

![20](https://github.com/PrinceMario/E-commerce-project/assets/172631198/2db5b47d-88f7-44d2-8f66-0d722da04225)
 
## Output
 
![21](https://github.com/PrinceMario/E-commerce-project/assets/172631198/23776a81-4871-4d0e-9208-436da5b0f6d2)

# Looking for Dropshipper
## Output 

![22](https://github.com/PrinceMario/E-commerce-project/assets/172631198/27980ef4-71fd-4715-962e-92fbbd817fd7)

# Looking for Offline Resellers
Next, we will find out the types of users who are offline resellers or have offline stores, which are buyers who often buy goods and are often sent to the same address. Purchase also with a large number of products. So the possibility of this item will be sold again.
So I made a SQL query to find buyers who have 8 or more transactions whose transaction shipping address is the same as the main shipping address, and the average total quantity per transaction is more than 10.

![23](https://github.com/PrinceMario/E-commerce-project/assets/172631198/8e744f78-63f2-4f82-ac98-3189adbefc81) 

## Output
 
![24](https://github.com/PrinceMario/E-commerce-project/assets/172631198/87b0decd-83cc-4593-a65d-2bd82df3f966)

# The user who is both Buyer and Seller
The following is a SQL query to find sellers who have also transacted as buyers at least 7 times.
 
![25](https://github.com/PrinceMario/E-commerce-project/assets/172631198/00afff1a-3060-4c07-9fee-93676f0d0fb4)

# Summary

![26](https://github.com/PrinceMario/E-commerce-project/assets/172631198/bd1fe85f-c681-45ef-a6fa-8cb6d9684b66)

- There are approximately 1145 unique products divided into 12 categories. The highest number of unique products available by category are products that are in the ‘personal hygiene’ category with a number of unique products of approximately 434 products.
- There are 6.34% of paid transactions that are not sent to buyers. E-Commerce needs to consider evaluating the transaction system in an effort to increase the security of buyers and sellers
-	E-Commerce’s performance has increased in the last 1 year based on the number of orders made by users. An increase in the number of orders means an increase in buying and selling activities carried out by users via this E-Commerce application. In fact, compared to 2019, the total orders placed by buyers per month in 2020 increased sharply. December is the month with the highest total orders. Companies must prepare various forms of promotion, for example through discounts, etc., in December of the following year.
-	However, if we analyzed based on the transaction value, it increased dramatically in 2020 compared to 2019 and it continues to increase from month to month. Except in December until the beginning of 2020, in January the transaction value decreased but continued to increase from month to month.
-	The Best Selling Product Category in 2019 and 2020 are the products from the ‘personal hygiene category. The second are the products from the ‘fresh food’ category. Compared to 2019, both categories of featured products have increased, both in sales volume and total price, in 2020.
  
SQL is a tool that can help in revealing hidden information from a collection of tabular data relations. For example, I have revealed who are the users who are also sellers and buyers or users who are drop shippers or offline resellers along with the numerical information. Other information has been described in the previous ‘Exploratory Data Analysis’ section.
