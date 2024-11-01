
use resthw5;

/*/Specify SQL queries to satisfy the following:

1.	List the dates and bill totals for customer Bob Crow.

2.	List the names of all customers whose last name is Smith. List each customer only once in the reverse lexicographical order.

3.	List the names of all customers whose second names begin with 'C'. List each customer only once.

4.	List the names of all the headwaiters.

5.	List all the details of bills dated February 2016.

6.	List the dates the restaurant took money in 2015. List each date only once in the sorted order.
*/

select cust_name,bill_total, bill_date from restbill where cust_name="Bob Crow";

select distinct cust_name from restbill where cust_name like '%Smith';

select  distinct cust_name from restbill where cust_name like '% C%';

select distinct first_name,surname from reststaff where headwaiter IS NOT NULL;

SELECT bill_no, bill_date, bill_total, cust_name from restbill where bill_date like '1602%';

select distinct bill_date from restbill where bill_date like '15%';

