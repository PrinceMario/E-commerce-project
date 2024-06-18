-- CHECKING DATASET ---------------------------------------------------------------

-- products table -----------------------------------------------------------------
# checking null and total records
select count(distinct Product_Name)
from products;

select * from products
where base_price is null;

select category, count(Product_Name)
from products
group by category
order by category;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





