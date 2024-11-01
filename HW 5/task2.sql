use resthw5;

/*
1.	How much money has the restaurant taken? Change the name of the output column to 'Income'.

2.	How much money did the restaurant take in February 2016? Change the name of the output column to 'Feb Income'.

3.	Calculate the average bill in table 2.

4.	Calculate the minimal, maximal, and average amount of seats of tables in Blue room. Name the corresponding columns as Min, Max, Avg.

5.	Count how many distinct tables are served by waiters 004 and 002.

*/


select sum(bill_total) as Income from restbill;

select sum(bill_total) as 'Feb Income' from restbill where bill_date like '1602%';

select avg(bill_total) from restbill;

select min(no_of_seats) as Min, max(no_of_seats) as Max, avg(no_of_seats) as Avg from restrest_table where room_name="Blue";

select count(*) from restbill where waiter_no=2 or waiter_no=4;

