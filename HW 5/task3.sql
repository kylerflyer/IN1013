/*
Specify SQL queries to satisfy the following:

1.	List the names of the waiters who have served the customer Tanya Singh.

2.	On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored.

3.	List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.

4.	List the customer name, the amount they spent and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.

5.	List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.

6.	List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
*/

select restbill.cust_name AS custname, restbill.waiter_no AS waiterno ,reststaff.first_name, reststaff.surname
FROM restbill LEFT JOIN reststaff ON restbill.waiter_no=reststaff.staff_no 
where restbill.cust_name="Tanya Singh";

/* 3 */
select * from reststaff where headwaiter = (select headwaiter from reststaff where first_name="Zoe" and surname="Ball");

/* 4 */
select * from restbill left join reststaff on restbill.waiter_no = reststaff.staff_no ORDER BY bill_total DESC;

/* 6 */

select * FROM reststaff where headwaiter in (select headwaiter from restroom_management where room_date=160312);


